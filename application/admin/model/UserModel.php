<?php

namespace app\admin\model;

use app\common\ConstCode;
use think\Db;
use think\Model;

class UserModel extends BaseModel
{
    //表名
    protected $table = 'users';
    //主键
    protected $pk = 'id';

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
        $where['is_valid']=ConstCode::ZAN_YES;
        $where['user_id']=$userId;

        if(!empty($userId)){
            $res = Db::table("user_zan_record")->where($where)->find();
            if($res){
                return ConstCode::ZAN_YES;
            }else{
                return ConstCode::ZAN_NO;
            }
        }else{
            return 0;
        }

    }

}