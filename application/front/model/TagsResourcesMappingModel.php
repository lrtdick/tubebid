<?php

namespace app\admin\model;

use app\common\ConstCode;
use think\Db;
use think\Model;

class TagsResourcesMappingModel extends BaseModel {
    //表名
    protected $table = 'tags_resources_mapping';
    //主键
    protected $pk = 'id';

    public function resources()
    {
        return $this->hasMany('VideoModel','id','resource_id')->order('id');
    }

    public function tags()
    {
        return $this->hasMany('TagsModel','id','tag_id')->order('id');
    }

}