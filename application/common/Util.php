<?php

namespace app\common;

use voduploadsdk\samples\Upload;

/**
 * 公共类 包含一些公共方法 可以实例化的
 * 好像TP5已经不使用util这种方法了
 * 逐步全部用helpers助手函数代替
 * Class Util
 * @package app\common
 */
class Util
{
    /**
     * 返回json的公共方法
     * 判断如果是对象
     * 判断如果是数组
     * 用不同方式返回json
     * @param $data
     * @return string
     */
    public static function toJson($data)
    {
        return json_encode($data);
    }

    public static function fromJson($data)
    {
        return json_decode($data, true);
    }

    public static function toNumber($number)
    {
        return (int)$number;
    }

    public static function creatToken($data)
    {
        return md5($data . time() . rand(10000, 99999));
    }

    public static function delFile($filePath)
    {
        return unlink($filePath);
    }

    public static function getRand($number)
    {
        if ($number <= 0) {
            $number = rand(10, 1000);
        }
        return $number;
    }

    public static function replaceImg($content)
    {
        $reg = '#<img src=[\'"]([^"]+)[\'"].+>#isU';
        preg_match_all($reg, $content, $results);  //保留图片地址

        $reg2 = '#<img src=[\'"]([^"]+)[\'"].+>#isU';  //用图片地址切片
        $html_chars = preg_split($reg2, $content); //用图片地址切片

        $oss_url = [];
        if ($results[1]) {
            $img_arr = $results[1];
            /// $img_arr array(1) {[0] => string(37) "/upload/image/20190505/1557057828.jpg"
            $obj = new Upload();
            foreach ($img_arr as $k => $v) {

                ///upload/image/20190505/1557057828.jpg 临时目录 拼接成词盒目录
                if (substr($v, 0, 4) != 'http') {
                    $img_info = $obj->uploadImage(['url' => realpath(substr($v, 1)), 'name' => basename($v)]);
                    $content = str_replace($results[0][$k], "<img src=\"" . $img_info['oss-request-url'] . "\">", $content); //替换图片地址为oss地址

                    if (file_exists($v)) {
                        self::delFile(substr($v, 1));
                    }
                    $img_txt=$img_info['info']['url'];
                } else {
                    $img_txt = $v;
                }
                $oss_url[] = $img_txt; //图片url加入数组
            }
        }

        //调用组合图文的方法
        $images_html = [$oss_url, $html_chars];//图文数组
        $images_html_chars = Util::mergeImagesHtmlChars($images_html);

        $arr = [
            'content' => $content, //替换了图片地址的全文本txt
            'cover' => $oss_url, //图片地址集
            'images_html_chars' => $images_html_chars//图文数组
        ];
        return $arr;
    }

    public static function createOrder()
    {
        $str = date('YmdHis') . substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
        return 'LN' . $str;
    }


    public static function mergeImagesHtmlChars(array $images_html)
    {
        //比对数组长度 如果文字比图片多1 第一个子数组图片字段为0
        //暂时不考虑两张图连续发的情况统一格式图后面必须有文 第一段可以是文
        $images_html_chars = [];

        //第一段是文 文比图多1
        if (count($images_html[0]) + 1 == count($images_html[1])) {
            foreach ($images_html[1] as $k => $v) {
                if($k==0){
                    $images_html_chars[] = ['imageUrl' => '', 'imageDesc' => $images_html[1][$k]];
                }else{
                    $images_html_chars[] = ['imageUrl' => $images_html[0][$k-1], 'imageDesc' => $images_html[1][$k]];
                }
            }
        } //第一段是图 图文相等
        elseif (count($images_html[0]) == count($images_html[1])) {
            foreach ($images_html[1] as $k => $v) {
                $images_html_chars[] = ['imageUrl' => $images_html[0][$k], 'imageDesc' => $images_html[1][$k],'imageDescMarkdown'];
            }
        }

        return $images_html_chars;

    }


}