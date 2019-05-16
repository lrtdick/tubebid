<?php

namespace app\admin\model;

use app\api\model\KeyWordsModel;
use app\common\ConstCode;
use app\common\Util;
use think\Model;
use think\Db;

class VideoModel extends ResourcesModel
{

//表名
    protected $table = 'videos';
    //主键
    protected $pk = 'id';

}