<?php

namespace app\admin\controller;

use think\Config;
use think\Controller;

class Login extends Controller
{
    /*
     * 登陆页面
     */
    public function index()
    {
        return view('index');
    }

    /**
     * 登陆操作
     * @return \think\response\Redirect
     */
    public function loginPost()
    {
        $name = input('username');
        $resp = array('accessGranted' => false); // For ajax response

        $admin = Config::get('admin');

        if (!$admin) {
            echo json_encode($resp);
            exit;
        }

        $password = input('password');
        if (md5($password) != $admin['password']) {
            echo json_encode($resp);
            exit;
        }

        //session('VideoAdmin', $admin[0]);
        session('VideoAdmin', $admin);
        writeAdminLog($name,'登陆IP为：'.request()->ip()); //后台管理日志

        $resp['accessGranted'] = true;
        $resp['url'] = url('Index/index');

        echo json_encode($resp);
    }

    /**
     * 退出登陆
     * @return \think\response\Redirect
     */
    public function loginOut()
    {
        session('VideoAdmin', null);
        writeAdminLog('后台管理员','退出登陆，IP：'.request()->ip()); //后台管理日志
        return redirect('Login/index');
    }
}
