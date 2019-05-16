<?php

namespace app\admin\model;

use app\common\ConstCode;
use think\Db;
use think\Model;
use app\admin\model\KeywordsResourcesMappingModel;



class ArticlesModel extends ResourcesModel
{

//表名
    protected $table = 'videos';
    //主键
    protected $pk = 'id';

    public static function getKeywordsInfo($id)
    {
        $resourcesList= ArticlesModel::where(['id'=>$id])->with('keywordsMappings.keywords')->select();
//        $resourcesList = $resourcesModel->with('keywordsMappings.keywords')->select();
        return $resourcesList;

    }

}