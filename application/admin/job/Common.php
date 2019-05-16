<?php
namespace app\admin\job;

class Common{

    private static $imageType = [
        'image/gif','image/jpeg','image/pjpeg','image/png'
    ];

    private static $path = "";

    public static function uploadFiles($file){
        if(in_array($file['type'],self::$imageType)){
            self::$path = "upload/images/";
            $new_type = strstr($file['name'],".");     //截取文件后缀名
            if(!file_exists(self::$path)){
                return "存储目录不存在";
            }
            $newupload = self::$path.date("YmdHis",time()).md5($file['name'] .microtime(1)).$new_type;     //存储路径
            //echo $newupload;die;
            if( $file["error"] > 0 ){
                return "文件上传错误";
            }
            if( move_uploaded_file($file['tmp_name'],$newupload) ){   //转存文件到新的目录
                $newPath = $newupload;                                     //返回文件目录
            }
            $arr = [
                'url' => $newPath,
                'name' => $file['name']
            ];
        }elseif ($file['type'] == "video/mp4"){
            self::$path = "upload/video/";
            $newUpload = self::$path.date("YmdHis",time()).md5($file['name'] .microtime(1)).".mp4";       //设置存储路径

            if( $file["error"] > 0 ){
                return "文件上传错误";
            }
            if( move_uploaded_file($file['tmp_name'],$newUpload) ){    //将文件转存到新的目录
                $newPath = $newUpload;                                       //返回文件存储后的目录
            }

            $arr = [
                'url' => $newPath
            ];
        }else{
            return "图片格式错误";
        }
        return $arr;
    }


}