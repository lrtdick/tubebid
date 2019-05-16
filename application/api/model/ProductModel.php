<?php

namespace app\api\model;

use app\admin\model\CommentsModel;
use app\common\ConstCode;
use app\common\Util;
use think\Model;
use think\Db;

class ProductModel extends Model{

    /**
     * 记录用户足迹
     * @param $userId
     * @param $videoId
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function userPrintRecord($userId,$videoId){
        $res = Db::table("user_histories")
            ->where('user_id',$userId)
            ->where('video_id',$videoId)
            ->find();
        Db::startTrans();
        try{
            if($res){
                Db::table("user_histories")
                    ->where('id',$res['id'])
                    ->update(['update_time'=>date("Y-m-d H:i:s",time())]);
            }else {
                Db::table('user_histories')
                    ->insert(['user_id' => $userId, 'video_id' => $videoId]);
            }
            Db::commit();
        }catch (\Exception $e) {
            Db::rollback();
        }
    }


    /**
     * 根据评论 ID 获取该条评论的所有回复数据
     * @param $commentsId
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getCommentsReply($commentsId,$userId = null){
        //获取评论的回复
//        $repliesInfo = Db::table("user_comments")->where('comment_id',$commentsId)->order('created_at desc')->select();
        $repliesInfo=CommentsModel::where(['comment_id'=>$commentsId])->order('created_at desc')->select();
        $repliesList = [];
        foreach ($repliesInfo as $reply){
            $usersInfo= KeyWordsModel::getUserHeadImg($reply['user_id']);
            $replyUserInfo= KeyWordsModel::getUserHeadImg($reply['reply_user_id']);
            $repliesList[] = [
//                'resource_id' => $reply['id'],
//                'author_id' => $reply['user_id'],
//                'avatar' => $usersInfo['avatar'],
//                'nickname' => $usersInfo['name'],
                'reply_id'=> $reply['id'],
                'reply_user_id' => $reply['reply_user_id'],
                'reply_user_nickname' => $replyUserInfo['name'],
                'reply_user_avatar' => $replyUserInfo['avatar'],
                'content' => $reply['content'],
                'like_num' => $reply['like_num'],
                'is_like' => UserModel::userJudgeZan($userId,$reply['id'],ConstCode::TYPE_ZAN_REPLY),
                'create_time' => $reply['created_at']
            ];
        }
        return $repliesList;
    }

    public static function userIsFocusChannel($userId,$channelId,$type = ''){
        $res = Db::table("user_focus_channels")
            ->where('user_id',$userId)
            ->where('channel_id',$channelId)
            ->where('focus_type',$type)
            ->find();
        if($res){
            if($res['is_valid'] == ConstCode::ZAN_YES){
                $code = ConstCode::ZAN_YES;
            }elseif($res['is_valid'] == ConstCode::ZAN_NO){
                $code = ConstCode::ZAN_NO;
            }
        }else{
            $code = ConstCode::ZAN_NO;
        }
        return $code;
    }

    public static function userIsFocusKeywords($userId,$KeyWordsId,$type = ''){
        $res = Db::table("user_focus_channels")
            ->where('user_id',$userId)
            ->where('key_words_id',$KeyWordsId)
            ->where('focus_type',$type)
            ->find();
        if($res){
            return $res['is_valid'];
        }else{
            return 0;
        }

    }
}