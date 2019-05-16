<?php

namespace app\admin\controller;
use think\Db;
class Index extends Admin
{
    /**
     * 首页数据
     * @return \think\response\View
     * @throws \think\exception\DbException
     */
    public function index()
    {
        //日志列表
        /*$time = input('time');
        if(!empty($time)) {
            $time = date('Ymd',input('time'));
        }else{
            $time = date('Ymd',time());
        }
        $lists = readAdminLog($time);*/

        //用户数据
        $user['all'] = Db::table('users')->field('id')->count();  //总数
        $user['today'] = Db::table('users')->whereTime('create_time','today')->field('id')->count();//今日新增用户数

//        //用户意见反馈
//        $lists = \think\Db::table('user_options')->order('created_at desc')->paginate('25')->each(function ($item,$key){
//            $user = \think\Db::table('users')->where('id',$item['user_id'])->field('name,avatar')->find();
//            $item['user_name'] = $user['name'];
//            $item['avatar'] = $user['avatar'];
//            return $item;
//        });
        $lists = array();
        return view('index',compact('user','lists'));
    }
}