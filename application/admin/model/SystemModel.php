<?php

namespace app\admin\model;

use think\Model;
use think\Db;

class SystemModel extends BaseModel {


    /**
     * 根据ID获取组件信息
     * @param $control_id
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getControlInfoById($control_id){
        $res = Db::table("control_cms")->where('id',$control_id)->find();
        return $res;
    }

    /**
     * 根据page_id获取页面信息
     * @param $page_id
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getPageNameById($page_id){
        $page_info = Db::table("page_cate")->where('id',$page_id)->find();
        return $page_info;
    }

    /**
     * 根据type_id获取组件类型
     * @param $type_id
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getControlTypeByTypeId($type_id){
        $type_info = Db::table("control_type")->where('id',$type_id)->find();
        return $type_info;
    }

}