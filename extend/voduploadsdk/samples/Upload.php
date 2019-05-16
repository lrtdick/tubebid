<?php
/**
 * Created by Aliyun ApsaraVideo VoD.
 * User: https://www.aliyun.com/product/vod
 * API document: https://help.aliyun.com/document_detail/55407.html
 */
namespace voduploadsdk\samples;
require_once dirname(__DIR__) . DIRECTORY_SEPARATOR .  'Autoloader.php';

//date_default_timezone_set('PRC');


use voduploadsdk\uploader\UploadVideoRequest;
use voduploadsdk\uploader\UploadImageRequest;
use voduploadsdk\uploader\AliyunVodUploader;
use OSS\OssClient;
use OSS\Core\OssException;
// 测试上传本地视频

class Upload
{

    private static $accessKeyId = '';
    private static $accessKeySecret = '';
    private static $endpoint = '';
    private static $bucket = '';

    public function __construct()
    {
        self::$accessKeyId = config('OSS.OSS_ACCESS_ID');
        self::$accessKeySecret = config('OSS.OSS_ACCESS_KEY');
        self::$endpoint = config('OSS.OSS_ENDPOINT');
        self::$bucket = config('OSS.OSS_TEST_BUCKET');

    }

    public function uploadVideo($file)
    {
        $localFilePath = $file;
        $info = $this->uploadLocalVideo(self::$accessKeyId, self::$accessKeySecret,$localFilePath);
        return $info;
    }

    public function uploadImage($file)
    {
        $localFilePath = $file;
        $info = $this->uploadLocalImage(self::$accessKeyId, self::$accessKeySecret,self::$endpoint, $localFilePath);
        return $info;
    }

    public function getVideoInfo($videoId){
        $info = $this->getFileInfo(self::$accessKeyId, self::$accessKeySecret,$videoId);
        return $info;
    }

    public function uploadLocalVideo($accessKeyId, $accessKeySecret, $filePath)
    {
        try {
            $uploader = new AliyunVodUploader($accessKeyId, $accessKeySecret);
            $uploadVideoRequest = new UploadVideoRequest($filePath, 'UploadLocalVideo');
            $userData = array(
                "MessageCallback" => array("CallbackURL" => "https://demo.sample.com/ProcessMessageCallback"),
                "Extend" => array("localId" => "xxx", "test" => "www")
            );
            $uploadVideoRequest->setUserData(json_encode($userData));
            $res = $uploader->uploadLocalVideo($uploadVideoRequest);
            return $res;
            //return $res['playUrl'] . "&auth_key=" . $res['playAuth'];
        } catch (\Exception $e) {
            printf("testUploadLocalVideo Failed, ErrorMessage: %s\n Location: %s %s\n Trace: %s\n",
                $e->getMessage(), $e->getFile(), $e->getLine(), $e->getTraceAsString());
        }
    }

    public function getFileInfo($accessKeyId,$accessKeySecret,$videoId){
        try{
            $uploader = new AliyunVodUploader($accessKeyId, $accessKeySecret);
            $res = $uploader->getVideoInfo($videoId);
            return $res;
        }catch (\Exception $e){
            printf("testUploadLocalVideo Failed, ErrorMessage: %s\n Location: %s %s\n Trace: %s\n",
                $e->getMessage(), $e->getFile(), $e->getLine(), $e->getTraceAsString());
        }
    }


    // 测试上传本地图片
    function uploadLocalImage($accessKeyId,$accessKeySecret,$endpoint,$filePath)
    {
        try {
            $uploader = new OssClient($accessKeyId, $accessKeySecret,$endpoint);
            $fileName = date("YmdHis",time()).md5($filePath['name'] .microtime(1));
            $res = $uploader->uploadFile(self::$bucket,$fileName,realpath($filePath['url']));
            return $res;
        } catch (OssException  $e) {
            printf("UploadLocalImage Failed, ErrorMessage: %s\n", $e->getMessage());
        }

    }
}



####  执行测试代码   ####


//$localFilePath = 'C:\test\sample.mp4';


//$webFileURL = 'http://vod-test1.cn-shanghai.aliyuncs.com/b55b904bc612463b812990b7c8cc95c8/daa30814c0c340cf8199926f78aa5c0e-a0bc05ba62c3e95cc672e88b828148c9-ld.mp4?auth_key=1608774986-0-0-c56acd302bea0c331370d8ed686502fe';
//testUploadWebVideo($accessKeyId, $accessKeySecret, $webFileURL);
//
//$localM3u8FilePath = '/opt/video/m3u8/sample.m3u8';
////testUploadLocalM3u8($accessKeyId, $accessKeySecret, $localM3u8FilePath);
//
//$webM3u8FileURL = 'http://vod-test1.cn-shanghai.aliyuncs.com/b55b904bc612463b812990b7c8cc95c8/daa30814c0c340cf8199926f78aa5c0e-195a25af366b5edae324c47e99a03f04-ld.m3u8?auth_key=1608775606-0-0-9fb038deaecd009dadd86721c5855629';
//testUploadWebM3u8($accessKeyId, $accessKeySecret, $webM3u8FileURL);