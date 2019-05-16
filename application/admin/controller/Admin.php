<?php

namespace app\admin\controller;
use think\Controller;

class Admin extends Controller
{
    public function _initialize()
    {
        if (!session('?VideoAdmin')) {
            return $this->redirect('Login/index');
        }

        // lPp7ER1yrGM4CKQU
        /*if (session('admin.role_id')) {
            $accesses = \think\Db::table('roles')->where('id', session('admin.role_id'))->find();

            $accessesArray = (explode(",", $accesses['accesses']));
            // dump($accesses_array);
            foreach ($accessesArray as $key => $value) {
                $accessesArrayStr = (explode(".", $value));
                $accessesArrayModule[] = $accessesArrayStr[0];
                $accessesArrayController[] = $accessesArrayStr[1];
                $accessesArrayAction[] = $accessesArrayStr[2];
            }

            session('accessesArray', $accessesArray);
            session('accessesArrayModule', $accessesArrayModule);
            session('accessesArrayController', $accessesArrayController);
            session('accessesArrayAction', $accessesArrayAction);

            $request = \think\Request::instance();
            $access = $request->module(). '.' .$request->controller(). '.' .$request->action();

            if (!in_array($access, $accessesArray)) {
                echo '没有权限';
                $this->redirect('Noaccess/index');
            }
        }*/

    }
}
