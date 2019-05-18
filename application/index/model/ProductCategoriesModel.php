<?php

namespace app\index\model;


use think\Db;


/**
 * 基础模型类 用于集成一些通用方法
 * Class BaseModel
 * @package app\admin\model
 */
class ProductCategoriesModel extends BaseModel {
    //表名
    protected $table = 'products_categories';
    //主键
    protected $pk = 'id';

}