<?php

namespace app\admin\model;

use app\common\ConstCode;
use app\common\Util;
use think\Db;
use think\Model;

class ControlModel extends BaseModel {
    //表名
    protected $table = 'control_cms';
    //主键
    protected $pk = 'id';

    /**
     * 把标签ID数组换成名称数组
     */
    public static function getNameList($str){
        $List = [];
        $tags = Util::fromJson($str);
        if($tags){
            foreach($tags as $tag){
                $List[] = self::getName($tag)['name'];
            }
        }
        return $List;
    }

    /**
     * 根据id获取标签名称
     * @param $tagId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getName($id){
        $where=['id',$id];
        $res = self::where($where)->find();
        return $res;
    }

}