<?php

namespace app\index\controller;

use think\Controller;
use think\Request;
use think\Db;

class Share extends Controller
{
    /**
     * 分享页
     * @param Request $request
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index(Request $request)
    {
        $id = $request->param('id');
        if(empty($id)) {
            return "分享错误";
        }
        $info = Db::name('videos')->where('id',$id)->find();
        if(!empty($info)) {
            Db::name('videos')->where('id',$id)->setInc('shares_count');
        }
        $app = Db::name('system')->where('key','share_app_url')->find();
        return view('index',compact('info','app'));
    }
}
