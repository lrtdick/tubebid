<?php
/**
 *
 * api (http:json)
 *
 */
namespace app\api\controller;
use app\api\apiabstract\BaseAbstract;
use app\common\Util;
use app\common\Result;
use think\Db;
use wechat\WxBizDataCrypt;

class Login extends BaseAbstract
{
    public function index(){
        $openid = $this->app->auth->session($this->data['code']);
        $decryptor = new WxBizDataCrypt(config("auth.appid"),$openid['session_key']);
        //$decryptedData = $this->app->encryptor->decryptData($openid['session_key'],$this->data['iv'],$this->data['encryptedData']);
        $info = [];
        $errorCode = $decryptor->decryptData($this->data['encryptedData'],$this->data['iv'],$info);
        if($errorCode != 0){
            return Result::getLoginResultError($errorCode);
        }
        $decryptedData = json_decode($info,true);
        //return Result::getResultSuccess(strlen($decryptedData['unionId']));
        $time = time();
        $data['name'] = $decryptedData['nickName'];
        $data['avatar'] = $decryptedData['avatarUrl'];
        $data['area'] = $decryptedData['country']."/".$decryptedData['province']."/".$decryptedData['city'];
        $data['gender'] = $decryptedData['gender'];
        $data['last_login_time'] = date("Y-m-d H:i:s",$decryptedData['watermark']['timestamp']);
        $data['token'] = Util::creatToken($openid['openid']);
        $res = Db::table("users")->where('unionid',$decryptedData['unionId'])->find();
        Db::startTrans();
        if(!$res){
            $data['create_time'] = date("Y-m-d H:i:s",$time);
            $data['openid'] = $decryptedData['openId'];
            $data['unionid'] = $decryptedData['unionId'];
            try{
                $user_id = Db::table("users")->insertGetId($data);
                // 提交事务
                Db::commit();
                return Result::getResultSuccess(['userId'=>$user_id,'token'=>$data['token'],'head_img'=>$data['avatar'],'nickName' => $data['name']]);
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return Result::getResultError($e->getMessage());
            }
        }else{
            try{
                Db::table("users")->where('openid',$openid['openid'])->update($data);
                // 提交事务
                Db::commit();
                return Result::getResultSuccess(['userId'=>$res['id'],'token'=>$data['token'],'head_img'=>$data['avatar'],'nickName' => $data['name']]);
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return Result::getResultError($e->getMessage());
            }
        }
    }
}
