<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

class System extends Controller
{
    public function video()
    {
        $item = \think\Db::table('system')->where('key','state_video')->find();
        $content = $item['value'];
        $title = '视频功能声明';
        return view('index',compact('content','title'));
    }

    public function member()
    {
        $item = \think\Db::table('system')->where('key','state_member')->find();
        $content = $item['value'];
        $title = '用户协议';
        return view('index',compact('content','title'));
    }

    public function copyright()
    {
        $item = \think\Db::table('system')->where('key','state_copyright')->find();
        $content = $item['value'];
        $title = '版权声明';
        return view('index',compact('content','title'));
    }

    public function privacy()
    {
        $item = \think\Db::table('system')->where('key','state_privacy')->find();
        $content = $item['value'];
        $title = '隐私政策';
        return view('index',compact('content','title'));
    }
}
