<?php

namespace app\api\model;

use app\common\ConstCode;
use app\common\Util;
use think\Model;
use think\Db;
use app\api\model\KeyWordsModel;


class UserModel extends \app\admin\model\UserModel {

    /**
     * 根据 userId 获取用户发布的所有作品
     * @param $userId
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getUserProductList($userId){
        $res = Db::table("videos")->where('channel_id',$userId)->select();
        return $res;
    }

    /**
     * 根据 userID 获取用户信息
     * @param $userId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getUserInfoById($userId){
        $res = Db::table("users")->where('id',$userId)->find();
        return $res;
    }

    /**
     * 根据 userId 获取用户获得的关注数/粉丝数/点赞数
     * @param $userId
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getUserFocusList($userId,$type = ""){
        switch ($type){
            case 'focus';
                $res = Db::table("user_focus_channels")->where('user_id',$userId)->select();
                break;
            case 'fans';
                $res = Db::table("user_focus_channels")->where('channel_id',$userId)->select();
                break;
            case 'zan';
                $list = self::getUserProductList($userId);
                $res = 0;
                foreach ($list as $val){
                    $res += $val['fabulou_count'];
                }
                break;
        }
        return $res;
    }


    /**
     * 根据 userId 获取用户发布的资源列表
     * @param $userId
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getUserProduct($userId){
//        获取该用户的所有发布的资源
        $contents = self::getUserProductList($userId);
        $resContent=[];
        /**
         * 封装数据包
         * 重命名
         */
        foreach ($contents AS $val) {
            $authorInfo=KeyWordsModel::getUserHeadImg($val['channel_id']);
            /**
             * 根据资源类型获取不同的数据字段 但是都放入url字段
             */
            if ($val['type'] == ConstCode::VIDEO_TYPE_VIDEO) {
                $url = $val['url'];
                $isFree = ConstCode::IS_FREE_YES;
                if ($val['is_free'] == ConstCode::IS_FREE_NO) {
                    $url = $val['demo_url'];
                    $isFree = ConstCode::IS_FREE_NO;
                }
            } else {
//                $url = Util::fromJson(domain_replace($val['image_url']));
                $url = '非视频资源';
                $isFree = ConstCode::IS_FREE_YES;
            }
            //封装一个content
            $content = [
                'id' => $val['id'],
                'avatar' => domain_replace($authorInfo['avatar']),
                'nickname' => $authorInfo['name'],
                'title' => $val['name'],
                'price' => $val['price'],
                'url' => domain_replace($url),
                'is_free' => $isFree,
                'duration' => $val['duration'],
                'poster' => domain_replace($val['poster']),
                'type' => $val['type'],
                'desc' => $val['desc'],
                'publish_at' => $val['published_at'],
                'like_num' => calcK($val['fabulou_count']),
                'played_num' => calcK($val['played_count']),
                'is_top' => $val['is_top'],
                'is_vertical' => $val['is_vertical'],
                'tags' => VideoModel::getTagNameList($val['tag_list']),
                'comments_num' => count(KeyWordsModel::getShenPingByVideoId($val['id'])['commentList']),
            ];

            $resContent[] = $content;
        }

        return $resContent;
    }

    /**
     * 根据 videoId 获取作品评论
     * @param $videoId
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getProductCommentsNum($videoId){
        $res = Db::table("user_comments")->where('video_id',$videoId)->select();
        return $res;
    }

    /**
     * 判断用户的关注列表与用户的关系
     * @param $channelId
     * @param $userId
     * @return int
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function userIsFocusMe($channelId,$userId){
        $res1= Db::table("user_focus_channels")->where('user_id',$userId)->where('channel_id',$channelId)->where('is_valid',1)->find();
        $res2= Db::table("user_focus_channels")->where('user_id',$channelId)->where('channel_id',$userId)->where('is_valid',1)->find();

        //没有关注别人0
        //已关注别人 1
        //被别人关注 2
        //互关 3
        if($res1){
            if($res2){
                return 3;
            }else{
                return 1;
            }
        }else{
            if($res2){
            return 2;
            }else{
                return 0;
            }
        }
    }

    /**
     * 根据产品ID获取产品信息
     * @param $videoId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getProductInfoById($videoId){
        $res = Db::table("videos")->where('id',$videoId)->find();
        return $res;
    }

    /**
     * 根据 优惠券ID 获取优惠券信息
     * @param $couponId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getCouponInfoById($couponId){
        $res = Db::table("coupon")->where('id',$couponId)->find();
        return $res;
    }

    /**
     * 判断当前用户 对该产品对象的点赞状态
     * @param $userId
     * @param $objectId
     * @param $type
     * @return int
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function userJudgeZan($userId,$objectId,$type){
        switch($type){
            case ConstCode::TYPE_ZAN_VIDEO:
                $where['video_id'] = $objectId;
                break;
            case ConstCode::TYPE_ZAN_COMMENT:
                $where['comment_id'] = $objectId;
                break;
            case ConstCode::TYPE_ZAN_REPLY:
                $where['reply_id'] = $objectId;
                break;
        }
        if(!empty($userId)){
            $res = Db::table("user_zan_record")->where("user_id",$userId)->where("is_valid",ConstCode::ZAN_YES)->where($where)->find();
            if($res){
                return ConstCode::ZAN_YES;
            }else{
                return ConstCode::ZAN_NO;
            }
        }else{
            return ConstCode::ZAN_NO;
        }

    }
}