<?php

namespace app\admin\model;

use app\common\ConstCode;
use think\Db;
use think\Model;

class CommentsModel extends BaseModel {
    //表名
    protected $table = 'user_comments';
    //主键
    protected $pk = 'id';

    /**
     * 关联关系 资源
     */
    public function resources()
    {
        return $this->hasOne('Resources','id','video_id')->order('id');
    }
}