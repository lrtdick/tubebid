<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

use \OSS\OssClient;
use \OSS\Core\OssException;
use think\Config;
use think\Log;

error_reporting(E_ERROR | E_WARNING | E_PARSE);

/**
 * 返回成功
 * @param array $data
 * @param string $msg
 * @return \think\response\Json
 */

if (!function_exists('getallheaders')) {
    function getallheaders()
    {
        $headers = [];
        foreach ($_SERVER as $name => $value) {
            if (substr($name, 0, 5) == 'HTTP_') {
                $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
            }
        }
        return $headers;
    }
}

function success($msg,$data = [])
{
    $response = [
        'code' => 1,
        'message' => $msg,
        'data' => $data
    ];

    return json($response, 200, [
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Allow-Headers' => 'x-requested-with,content-type',
        'Access-Control-Allow-Methods' => 'POST,GET,OPTIONS,DELETE'
    ]);
}

/**
 * 返回失败
 * @param string $msg
 * @param array $data
 * @return \think\response\Json
 */
function error($msg = '',$code = 110)
{
    $response = [
        'code' => $code,
        'message' => $msg
    ];

    return json($response, 200, [
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Allow-Headers' => 'x-requested-with,content-type',
        'Access-Control-Allow-Methods' => 'POST,GET,OPTIONS,DELETE'
    ]);
}

/**
 * 撰写后台操作日志
 * @param $admin
 * @param $msg
 * @return bool
 */
function writeAdminLog($admin,$msg)
{
    $dir = __DIR__ . '/../runtime/admin';
    if(!is_dir($dir)) {
        var_dump($dir);
        mkdir($dir, '777');
    }
    $file_path = $dir.'/'.date('Ymd').'.log';
    //写入的内容
    $content = date('Y-m-d H:i:s',time()). "：【" .$admin. "】执行操作：" .$msg."|\r\n\n";
    //写入到log文本中
    file_put_contents($file_path,$content, FILE_APPEND);

    return true;
}

/**
 * 读取系统日志
 * @param $time
 * @return array
 */
function readAdminLog($time)
{
    $dir = __DIR__ . '/../runtime/admin';
    $file_path = $dir.'/'.$time.'.log';
    if(!file_exists($file_path)) {
        return $lists = [];
    }
    $string = file_get_contents($file_path);
    $lists = explode("|",$string);
    return $lists;
}

/**
 * 根据Config配置，得到一个OssClient实例
 *
 * @return OssClient 一个OssClient实例
 */
function getOssClient()
{
    $endpoint = Config::get('OSS.OSS_ENDPOINT');
    $accessKeyId = Config::get('OSS.OSS_ACCESS_ID');
    $accessKeySecret = Config::get('OSS.OSS_ACCESS_KEY');

    try {
        $ossClient = new OssClient($accessKeyId,$accessKeySecret,$endpoint,false);
    } catch (OssException $e) {
        printf(__FUNCTION__ . "creating OssClient instance: FAILED\n");
        printf($e->getMessage() . "\n");
        return null;
    }

    return $ossClient;
}

/**
 * OSS 存储图片
 *
 * @param $picture_path 图片路径
 * @param $object oss 资源
 * @param string $dir 虚拟目录
 * @param int $type  上传类型 1-字符串上传 2-本地上传
 * @param int $time_out 链接超时时间，默认10年
 * @return string|void oss 图片加密链接
 */
function getOssUrl($picture_path , $object , $dir = '' , $type = 1)
{

    $ossClient = getOssClient();  //实例化 oss
    $bucketName = Config::get('OSS.OSS_TEST_BUCKET');

    if(!empty($dir)) {
        $dir_exist = $ossClient->doesObjectExist($bucketName, $dir); // 判断 OSS 中虚拟目录是否存在
        if (!$dir_exist) {
            $ossClient->createObjectDir($bucketName, $dir);  // 创建虚拟目录
        }
    }

    $img_exist = $ossClient->doesObjectExist($bucketName, $object); //判断图片是否存在

    //字符串上传
    if($type == 1) {
        $content = file_get_contents($picture_path);

        //判断图片是否存入 oss 中
        if (!$img_exist) {

            try {
                $ossClient->putObject($bucketName, $object, $content); //上传文件
            } catch (OssException $e) {
                printf(__FUNCTION__ . ": FAILED\n");
                printf($e->getMessage() . "\n");
                return;
            }

            Log::write(date('Y-m-d H:i:s') . " insert image data '" . $object . "'<br>");
        }
    }

    //本地文件上传
    if($type == 2) {
        if (!$img_exist) {
            try{
                $ossClient->uploadFile($bucketName, $object, $picture_path);
            } catch(OssException $e) {
                printf(__FUNCTION__ . ": FAILED\n");
                printf($e->getMessage() . "\n");
                return;
            }

            Log::write(date('Y-m-d H:i:s') . " insert image data '" . $object . "'<br>");
        }

    }

    return $object;
}

/***
 * OSS 视频分片上传
 * @param $picture_path
 * @param $object
 * @param string $dir
 */

function getOssVideoUrl($picture_path , $object , $dir = '')
{
    $ossClient = getOssClient();  //实例化 oss
    $bucketName = Config::get('OSS.OSS_TEST_BUCKET');

    if(!empty($dir)) {
        $dir_exist = $ossClient->doesObjectExist($bucketName, $dir); // 判断 OSS 中虚拟目录是否存在
        if (!$dir_exist) {
            $ossClient->createObjectDir($bucketName, $dir);  // 创建虚拟目录
        }
    }

    $img_exist = $ossClient->doesObjectExist($bucketName, $object); //判断图片是否存在

    //本地文件上传
    if (!$img_exist) {
        try{
            $ossClient->multiuploadFile($bucketName, $object, $picture_path);
        } catch(OssException $e) {
            printf(__FUNCTION__ . ": FAILED\n");
            printf($e->getMessage() . "\n");
            return;
        }
        Log::write(date('Y-m-d H:i:s') . " insert video data '" . $object . "'<br>");
    }

    return $object;
}

/**
 * 删除 OSS 资源
 * @param $object
 * @return bool
 */
function delOssObject($object)
{
    $ossClient = getOssClient();  //实例化 oss
    $bucketName = Config::get('OSS.OSS_TEST_BUCKET');

    $file_exist = $ossClient->doesObjectExist($bucketName, $object); //判断图片是否存在

    //本地文件上传
    if ($file_exist) {
        try{
            $ossClient->deleteObject($bucketName, $object);
        } catch(OssException $e) {
            printf(__FUNCTION__ . ": FAILED\n");
            printf($e->getMessage() . "\n");
            return false;
        }

        Log::write(date('Y-m-d H:i:s') . " insert video data '" . $object . "'<br>");
    }

    return true;
}
