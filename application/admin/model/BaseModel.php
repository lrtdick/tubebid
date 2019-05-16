<?php

namespace app\admin\model;

use app\common\ConstCode;
use think\Db;
use think\Model;

/**
 * 基础模型类 用于集成一些通用方法
 * Class BaseModel
 * @package app\admin\model
 */
class BaseModel extends Model{
    //表名
    protected $table;
    //主键
    protected $pk;

//   条件查询整合方法
    public static function getDatesByWhere($where=[],$order='id desc',$paginate_num=20){

        //状态不能是删除的 >1
        $where['status']=['gt',-1];
//        $res=self::get($where)->order('id desc');
        $res=self::where($where)
            ->order($order)
            ->paginate($paginate_num);//返回值20条
        return $res;
    }

    /**
     * 逻辑删除
     * 传入id或者其他查询语句
     * @param $where
     * @return BaseModel
     */
    public static function logicDelete($where){
        $where['status']=['gt',-1];
//        $res=self::get($where)->order('id desc');
        $res=self::where($where)
            ->update("status",-1);
        return $res;
    }

    /**
     * 数据根据 $order 字段排倒序
     * @param $dataList
     * @param $order
     * @return mixed
     */
    public static function contentSort($dataList,$order){
        $arrSort = [];
        if($dataList){
            foreach ($dataList AS $ukey => $row) {
                foreach($row AS $key=>$value) {
                    $arrSort[$key][$ukey] = $value;
                }
            }
            array_multisort($arrSort[$order], constant('SORT_DESC'), $dataList);
        }
        return $dataList;
    }

    /**
     * 获取字段信息
     * @param $dataList
     * @param $order
     * @return mixed
     */
    public function getColumnInfo(){
        $table=$this->table;
        $data = Db::query('SHOW FULL COLUMNS FROM '.$table);
        return $data;
    }

    /**
     * 获取一个或创建
     */
    public function firstOrCreate($where){
        $data=self::where($where)->select();
        if(!$data){
            $data=self::create($where);
        }
        return $data;
    }
}