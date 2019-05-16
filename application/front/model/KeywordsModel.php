<?php

namespace app\admin\model;

use app\common\ConstCode;
use think\Db;
use think\Model;

class KeywordsModel extends BaseModel {
    //表名
    protected $table = 'key_words';
    //主键
    protected $pk = 'id';

    /**
     * 移植的zgf方法
     */

    /**
     * 根据内容ID获取神评（点赞数最多的为神评）
     * @param $videoId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getShenPingByVideoId($videoId){
        $res = Db::table('user_comments')->where('video_id',$videoId)->order('like_num desc')->limit(3)->select();
        $shenPing = [];
        foreach ($res as $re){
            $shenPing[] = [
                'id' => $re['id'],
                'userId' => $re['user_id'],
                'nickName' => KeywordsModel::getUserHeadImg($re['user_id'])['name'],
                'content' => $re['content']
            ];
        }
        $comment = Db::table('user_comments')->where('video_id',$videoId)->order('created_at desc')->select();
        $commentInfo = [
            'shenPing' => $shenPing,
            'commentList' => $comment
        ];
        return $commentInfo;
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


    public function resourcesMappings()
    {
        return $this->hasMany('KeywordsResourcesMappingModel','keywords_id','id')->order('id');
    }
}