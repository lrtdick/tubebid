<?php

namespace app\admin\controller;

use think\Config;
use think\Controller;
use app\admin\job\Common;
use app\common\ConstCode;
use app\common\Util;
use think\Db;
use app\common\Result;
use voduploadsdk\samples\Upload;
class Base extends Controller
{
    /**
     * 上传图片到本地
     */
    public function uploadImg()
    {
        $file = request()->file('file');
        if (empty($file)) {
            return  error("未能获取图片！");
        } else {
            $info = $file->getInfo();
            if ($info) {
                $pictureName = Common::uploadFiles($info);
                return success('上传成功',['url' => "/".$pictureName['url']]);
            } else {
                return  error($file->getError());
            }
        }
    }

    /**
     * 上传图片到OSS
     */
    public function uploadFile()
    {
        $files = request()->file('file');
        if (empty($files)) {
            return  error("未能获取图片！");
        }
        //return success('上传成功',['url' => $files]);
        if(is_array($files)){
            $picture = [];
            foreach ($files as $file){
                $info = $file->getInfo();
                if ($info) {
                    //return success('上传成功',['url' => $info]);
                    $object = Common::uploadFiles($info);
                    $client = new Upload();
                    $pictureInfo = $client->uploadImage($object);
                    if(file_exists($object['url'])){
                        Util::delFile($object['url']);
                    }
                    $picture[] = $pictureInfo['oss-request-url'];
                } else {
                    echo $file->getError();
                }
            }
            return success('上传成功',['url' => $picture]);
            exit;
        }else{
            $info = $files->getInfo();
            if ($info) {
                $object = Common::uploadFiles($info);
                $client = new Upload();
                $pictureInfo = $client->uploadImage($object);
                if(file_exists($object['url'])){
                    Util::delFile($object['url']);
                }
                //return success('上传成功',['url' => $pictureInfo]);
                return success('上传成功',['url' => $pictureInfo['oss-request-url']]);
            } else {
                echo $files->getError();
            }
        }
    }

    /**
     * 上传视频到OSS
     */
    public function uploadVideo()
    {
        ini_set("memory_limit","-1");
        $file = request()->file('file');
        if (empty($file)) {
            return error("视频错误,请确保 mp4的视频格式！");
        } else {
            $info = $file->getInfo();

            if ($info) {
                $object = Common::uploadFiles($info);
                //return success('上传成功',['url' => $object]);
                $client = new Upload();
                $pictureName = $client->uploadVideo(realpath($object['url']));
                if(file_exists($object['url'])){
                    Util::delFile($object['url']);
                }
                return success('上传成功',['url' => $pictureName]);
            } else {
                echo $file->getError();
            }
        }
    }

    public function getVideoInfo(){
        $videoInfo = Db::table("videos")
            ->where('type',ConstCode::VIDEO_TYPE_VIDEO)
            ->where("is_valid",ConstCode::VALID_NO)
            ->select();
        $client = new Upload();
        $code = 0;
        $errorCode = 0;
        foreach ($videoInfo as $info){
            if($info['is_free'] == ConstCode::IS_FREE_NO){
                $demo_video_info = $client->getVideoInfo($info['demo_vod_video_id']);
                $demo_duration = $demo_video_info->Mezzanine->Duration;
            }else{
                $demo_duration = null;
            }
            $vod_video_info = $client->getVideoInfo($info['vod_video_id']);
            if($vod_video_info->Mezzanine->Width > $vod_video_info->Mezzanine->Height){
                $isVertical = ConstCode::VIDEO_TRANSVERSE ;
            }elseif ($vod_video_info->Mezzanine->Width < $vod_video_info->Mezzanine->Height){
                $isVertical = ConstCode::VIDEO_VERTICAL ;
            }
            $data = [
                'demo_duration' => $demo_duration,
                'duration' => $vod_video_info->Mezzanine->Duration,
                'width' => $vod_video_info->Mezzanine->Width,
                'height' => $vod_video_info->Mezzanine->Height,
                'is_valid' => ConstCode::VALID_YES,
                'is_vertical' => $isVertical
            ];
            if($data['width'] != 0){
                $res = Db::table("videos")->where("id",$info['id'])->update($data);
                if($res){
                    $code += 1;
                }
            }else if((time() - strtotime($info['create_time'])) >1800 ){
                $res = Db::table("videos")->where('id',$info['id'])->update(['is_valid'=>ConstCode::VALID_ABNORMAL]);
                if($res){
                    $errorCode += 1;
                }
            }
        }
        $code = [
          'successNum' => $code,
          'errorNum' => $errorCode
        ];
        return Result::getResultSuccess($code);
    }
}
