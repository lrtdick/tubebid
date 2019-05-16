<?php
namespace app\api\apiabstract;

use think\Controller;
use think\Request;
use wechat\WechatAuth;
use EasyWeChat\Factory;
use think\Db;
use app\common\Result;
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin,Authorization');
class BaseAbstract extends Controller{
    protected $data = [];
    protected $request;
    protected $config;
    protected $app;
    protected $userId = null;
    protected $token_timestamp = 7200;
    protected $pageNum = 1;
    protected $pageSize = 10;
    protected $wechat = null;
    protected $controllerCheckToken = [
        'Keywords','Product','Login'
    ];
    public function _initialize()
    {
        $wechat = new WechatAuth();
        $this->wechat = $wechat;
        $this->config = $this->wechat->getWechatConfig();
        $conf = [
            'app_id' => $this->config['appid'],
            'secret' => $this->config['appsecret']
        ];
        $this->app = Factory::miniProgram($conf);
        $this->request = Request::instance();
        $headers = $this->request->header();
        if (isset($headers['authorization'])) {
            $data['token'] = $headers['authorization'];
        }
//        if (isset($headers['X-Real-Ip'])) {
//            $data['realIp'] = $headers['X-Real-Ip'];
//        } else {
//            die(error( "Invalid param X-Real-Ip."));
//        }
        $this->runFactory($data);
    }

    private function runFactory($params)
    {
        try {
            $data = $this->request->post();
            if($params) {
                foreach ($params as $k => $v) {
                    $data[$k] = $v;
                }
            }
            if(isset($data['pageSize'])){
                $this->pageSize = $data['pageSize'];
            }
            if(isset($data['pageNum'])){
                $this->pageNum = $data['pageNum'];
            }
            $this->data = $data;
            $controller = $this->request->controller();
            //echo Result::getResultSuccess(!in_array($controller,$this->controllerCheckToken));
            //die;
            $token = $this->data['token'];
            if (!empty($token)) {
                $this->checkToken($token);
            }
            if(!in_array($controller,$this->controllerCheckToken)){
                if(!$this->userId){
                    Result::getLoginResultError('invalid token');
                    die;
                }
            }
        } catch (\Throwable $e) {
            die(error( $e->getMessage()));
        }
    }
    public function checkToken($token){
        $res = Db::table("users")->where('token',$token)->find();
        if($res){
            $this->userId = $res['id'];
            $this->userLoginTimeRecord($res['id']);
            return true;
        }else{
            return false;
        }
    }

    public function userLoginTimeRecord($userId){
        Db::table("users")
            ->where('id',$userId)
            ->update([
                'last_login_time'=>date("Y-m-d H:i:s",time())
            ]);
    }
}