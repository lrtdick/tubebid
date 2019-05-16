<?php

namespace app\admin\model;

use app\common\ConstCode;
use think\Db;
use think\Model;

class KeywordsResourcesMappingModel extends BaseModel {
    //表名
    protected $table = 'keywords_resources_mapping';
    //主键
    protected $pk = 'id';

    public function keywords()
    {
        return $this->hasMany('KeywordsModel','id','keywords_id')->order('id');
    }

    public function resources()
    {
        return $this->hasMany('VideoModel','id','resource_id')->order('id');
    }

}