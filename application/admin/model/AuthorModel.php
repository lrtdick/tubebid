<?php

namespace app\admin\model;

use app\common\ConstCode;
use think\Db;
use think\Model;

class AuthorModel extends BaseModel {
    //表名
    protected $table = 'users';
    //主键
    protected $pk = 'id';
}