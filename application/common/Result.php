<?php

namespace app\common;

use app\common\Util;

/**
 * 自己封装的返回的方法类
 * 可以添加一些逻辑
 * 主要为了代码复用
 * Class Result
 * @package app\common
 */
class Result{
    public static function getResultSuccess($data = [],$msg = 'success'){
        $arr = [
            'code' => 200,
            'message' => $msg,
            'data' => $data
        ];
        return json($arr);
//        return Util::toJson($arr);
    }

    public static function getResultError($message = "",$code = -1){
        $arr = [
            'code' => $code,
            'message' => $message,
            'data' => [],
        ];
        return json($arr);
        //return Util::toJson($arr);
    }

    public static function getLoginResultError($message = "",$code = -2){
        $arr = [
            'code' => $code,
            'message' => $message,
            'data' => [],
        ];
        return json($arr);
        //return Util::toJson($arr);
    }
}