<?php

namespace app\api\model;

use app\common\Util;
use app\common\ConstCode;
use app\admin\model\VideoModel;
use think\Model;
use think\Db;

class KeyWordsModel extends \app\admin\model\KeywordsModel
{


    /**
     * 根据 keyWordsId 获取聚合内容
     * @param $key_words_id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getContentByKeyWords($key_words_id,$field = null,$type = null,$isVertical = ConstCode::VIDEO_TRANSVERSE){
        $keyWordsInfo = Db::table("key_words")->where('id',$key_words_id)->find();
        $tagsInfo = Db::table('tags')->where('name','like','%'.$keyWordsInfo['name'].'%')->select();
        $contentList = [];
        $where['status'] = ['gt',-1];
        foreach ($tagsInfo as $tags){
            if($type == 'where'){
                $contentList[] =  Db::table('videos')
                    ->where($field,ConstCode::YES)
                    ->where('tag_list','like','%"'.$tags['id'].'"%') //taglist[["31","30","26"]]
                    ->where('is_vertical',$isVertical)
                    ->where($where)
                    ->select();
            }else{
                $contentList[] =  Db::table('videos')
                    ->where('tag_list','like','%"'.$tags['id'].'"%')
                    ->where('is_vertical',$isVertical)
                    ->where($where)
                    ->select();
            }
        }
        $content = [];
        foreach($contentList as $contents){
            foreach ($contents as $v){
                $content[$v['id']] = $v;
            }
        }
        return $content;
    }

    /**
     * 根据 id 获取关键词
     * @param $keyWordsId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getKeywordsById($keyWordsId){
        $keyWords = self::where(['id'=>$keyWordsId])->find();
        return $keyWords;
    }

    /**
     * 数据根据 $order 字段排倒序
     * @param $dataList
     * @param $order
     * @return mixed
     */
    public static function contentSort($dataList,$order){
        $arrSort = [];
        if($dataList){
            foreach ($dataList AS $ukey => $row) {
                foreach($row AS $key=>$value) {
                    $arrSort[$key][$ukey] = $value;
                }
            }
            array_multisort($arrSort[$order], constant('SORT_DESC'), $dataList);
        }
        return $dataList;
    }

    /**
     * 获取用户
     * @param $userId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getUserHeadImg($userId){
        $res = Db::table("users")->where('id',$userId)->find();
        return $res;
    }

    /**
     * 根据内容ID获取神评（点赞数最多的为神评）
     * @param $videoId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getShenPingByVideoId($videoId){
        $res = Db::table('user_comments')->where(['video_id'=>$videoId,'comment_id'=>null])->order('like_num desc')->limit(3)->select();
        $shenPing = [];
        foreach ($res as $re){
            $shenPing[] = [
                'id' => $re['id'],
                'user_id' => $re['user_id'],
                'nick_name' => KeyWordsModel::getUserHeadImg($re['user_id'])['name'],
                'content' => $re['content'],
                'like_num' => $re['like_num']?$re['like_num']:0,

            ];
        }
        $comment = Db::table('user_comments')->where(['video_id'=>$videoId,'comment_id'=>null])->order('created_at desc')->select();
        $commentInfo = [
            'shenPing' => $shenPing,
            'commentList' => $comment
        ];
        return $commentInfo;
    }

    /**
     * 关键词关注人数数字处理
     * @param $follow
     * @return string
     */
    public static function keyWordsFollowFormat($follow){
        if(mb_strlen($follow)>3){
            return substr($follow,0,mb_strlen($follow)-3).'K+';
        }
        return $follow;
    }

    /**
     * 根据广告ID获取内容
     * @param $advertising_id
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getAdvertisingById($advertising_id){
        $where['status'] = ['gt',-1];
        $where['id'] = $advertising_id;
        $advertising =  Db::table("advertising_cms")->where($where)->find();
        $res = [];
        if($advertising){
            $res['id'] = $advertising['id'];
            $res['publishat'] =$advertising['published_at'];
            $res['type'] = $advertising['type'];
            if($res['type'] == ConstCode::ADVERTISING_TYPE_TXT){
                $res['title'] = $advertising['name'];
                $res['link'] = null;
            }elseif($res['type'] == ConstCode::ADVERTISING_TYPE_IMG){
                $res['image'] = domain_replace($advertising['poster']);
                $res['link'] = null;
            }
        }
        return $res;
    }

    /**
     * 根据controlTypeId获取typeName
     * @param $type_id
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
     public static function getControlTypeName($type_id){
        return Db::table("control_type")->where('id',$type_id)->find();
     }


    /**
     * 根据规则ID获取数据
     * @param $roleId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getDataRoleById($roleId){
        $where['id'] = $roleId;
        $res = Db::table("data_role")->where($where)->find();
        return $res;
    }

    /**
     * 根据视频尺寸判断横版还是竖版
     * @param $width
     * @param $height
     * @return int
     */
    public static function videoJudgeSize($width,$height){
        if($width>$height){
            $isVertical = ConstCode::VIDEO_TRANSVERSE;
        }else{
            $isVertical = ConstCode::VIDEO_VERTICAL;
        }
        return $isVertical;
    }

    /**
     * 获取自定义规则的数据
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getRoleContent($keywords_id,$field,$limit,$type = null,$isVertical = ConstCode::VIDEO_TRANSVERSE){


        $content = self::getContentByKeyWords($keywords_id,$field,$type,$isVertical);

        if($type == 'where'){
            $field = 'create_time';
        }
        //排序后返回 DD
        if($content){
            $content = self::contentSort($content,$field);
            $resContent = [];
            foreach ($content as $k => $v){
                if($k < $limit ){
                    $resContent[] = $v;
                }
            }
            return $resContent;
        }
        return $content;
    }

    public static function getVieoList($val,$userId){
        if($val['type'] == ConstCode::VIDEO_TYPE_VIDEO){
            $url = $val['url'];
            $isFree = ConstCode::IS_FREE_YES;
            if($val['is_free'] == ConstCode::IS_FREE_NO){
                $url = $val['demo_url'];
                $isFree = ConstCode::IS_FREE_NO;
                if($userId){
                    $where['user_id'] = $userId;
                    $where['product_id'] = $val['id'];
                    $where['product_type'] = ConstCode::PRODUCT_TYPE_VIDEO;
                    $where['status'] = ConstCode::ORDER_STATUS_PAID;
                    $order = Db::table("orders")->where($where)->find();
                    if($order){
                        $url = $val['url'];
                        $isFree = ConstCode::IS_FREE_PAID;
                    }
                }
            }
        }else{
            $url = Util::fromJson($val['image_url']);
            $isFree = ConstCode::IS_FREE_YES;
        }
        $list = [
            'id' => $val['id'],
            'avatar' => domain_replace(self::getUserHeadImg($val['channel_id'])['avatar']),
            'nickName' => self::getUserHeadImg($val['channel_id'])['name'],
            'title' => $val['name'],
            'price' => $val['price'],
            'url' => domain_replace($url),
            'isFree' => $isFree,
            'duration' => $val['duration'],

            'poster' => domain_replace($val['poster']),
            'type' => $val['type'],
            'desc' => $val['desc'],
            'publishat' => $val['create_time'],
            'zanNum' => $val['fabulou_count'],
            'playedNum' => $val['played_count'],
            'isTop' => $val['is_top'],
            'isVertical' => $val['is_vertical'],
            'tags' => VideoModel::getTagNameList($val['tag_list']),
            'comments' => count(self::getShenPingByVideoId($val['id'])['commentList']),
        ];
        return $list;
    }

}