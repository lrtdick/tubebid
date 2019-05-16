<?php

namespace app\admin\model;

use think\Model;

class UserViewHistoriesModel extends BaseModel {
    //表名
    protected $table = 'user_view_histories';
    //主键
    protected $pk = 'id';

    public static function getUserViewKeywordsHistory($user_id,$channel_id,$keywords_id){
        $where=[];
        if($user_id>0){
            $where['user_id']=$user_id;
        }
        if($channel_id>0){
            $where['channel_id']=$channel_id;
        }
        if($keywords_id>0){
            $where['keywords_id']=$keywords_id;
        }

        $res=self::get($where);
        if(!$res){
            $res=New UserViewHistoriesModel();
        }
       return $res;
    }
}