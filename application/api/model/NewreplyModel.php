<?php

namespace app\api\model;

use app\common\Util;
use think\Model;
use think\Db;

class NewreplyModel extends Model{


    /**
     * 根据 id 获取关键词名称
     * @param $keyWordsId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getKeyWordsNameById($keyWordsId){
        $keyWords = Db::table("key_words")->where('id',$keyWordsId)->find();
        return $keyWords;
    }


    /**
     * 获取播放量排前四内容
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getPlayContent($key_words_id,$limit){
        $content = self::getContentByKeyWords($key_words_id);
        if($content){
            $content = self::contentSort($content,'played_count');
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

    /**
     * 获取置顶前2条推荐数据
     * @param $key_words_id
     * @param $limit
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getTopContent($key_words_id,$limit){
        $content = self::getContentByKeyWords($key_words_id,'top');
        if($content){
            $content = self::contentSort($content,'create_time');
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


    /**
     * 获取关键词聚合内容
     * @param $key_words_id
     * @param $pageNum
     * @param $pageSize
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getAllContent($key_words_id,$pageNum,$pageSize){
        $contents = self::getContentByKeyWords($key_words_id);
        if($contents){
            $content = self::contentSort($contents,'create_time');
            $limit = ($pageNum-1)*$pageSize;
            $resContent = [];
            foreach ($content as $k => $v){
                if($k >= $limit && $k < ($pageNum*$pageSize)){
                    $resContent[] =$v;
                }
            }
            return $resContent;
        }
        return $contents;
    }

    /**
     * 根据 keyWordsId 获取聚合内容
     * @param $key_words_id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getContentByKeyWords($key_words_id,$where = null){
        $keyWordsInfo = Db::table("key_words")->where('id',$key_words_id)->find();
        $tagsInfo = Db::table('tags')->where('name','like','%'.$keyWordsInfo['name'].'%')->select();
        //return $tagsInfo;
        $contentList = [];
        foreach ($tagsInfo as $tags){
            if($where == 'top'){
                $contentList[] =  Db::table('videos')->where('is_top',2)->where('tag_list','like','%"'.$tags['id'].'"%')->select();
            }else{
                $contentList[] =  Db::table('videos')->where('tag_list','like','%"'.$tags['id'].'"%')->select();
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
     * 数据根据 $order 字段排倒序
     * @param $dataList
     * @param $order
     * @return mixed
     */
    public static function contentSort($dataList,$order){
        $arrSort = [];
        foreach ($dataList AS $ukey => $row) {
            foreach($row AS $key=>$value) {
                $arrSort[$key][$ukey] = $value;
            }
        }
        array_multisort($arrSort[$order], constant('SORT_DESC'), $dataList);
        return $dataList;
    }

    /**
     * 获取用户头像
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
        $res = Db::table('user_comments')->where('video_id',$videoId)->order('like_num desc')->limit(1)->find();
        $comment = Db::table('user_comments')->where('video_id',$videoId)->select();
        $commentInfo = [
            'shenPing' => $res,
            'commentList' => $comment
        ];
        return $commentInfo;
    }
}