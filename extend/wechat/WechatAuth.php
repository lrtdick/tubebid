<?php
namespace wechat;

class WechatAuth{
    private $wechat_config = [
        'appid' => '',
        'appsecret' => ''
    ];

    public function __construct()
    {
        $this->wechat_config = $this->getWechatConfig();
    }

    public function getWechatConfig(){
        $wechat_config = array_merge($this->wechat_config,config('auth'));
        return $wechat_config;
    }

    /**
     * 获取openid
     * @param string $code
     * @return array|mixed
     */
    public function getUserAccessUserInfo($code = "")
    {
        if (empty($code)) {
            $baseUrl = request()->url(true);
            $url = $this->getSingleAuthorizeUrl($baseUrl, "123");
            Header("Location: $url");
            exit();
        } else {
            $access_token = $this->getSingleAccessToken($code);
            $open_id = $this->getSingleOpenid($code);
            $arr = [
                'access_token' => $access_token['access_token'],
                'expires_in' => $access_token['expires_in'],
                'openid' => $open_id['openid'],
                'session_key' => $open_id['session_key'],
            ];
            //return $arr;
            return $this->getUserInfo($arr);
        }
    }
    public function getSingleAuthorizeUrl($redirect_url = "",$state = '1') {
        $redirect_url = urlencode($redirect_url);
        return "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" . $this->wechat_config['appid'] . "&redirect_uri=".$redirect_url."&response_type=code&scope=snsapi_userinfo&state={$state}#wechat_redirect";
    }

    /**
     * 获取token
     * @param $code
     * @return mixed
     */
    public function getSingleAccessToken($code) {
        //
        $url = sprintf($this->wechat_config['access_token_api'],$this->wechat_config['appid'],$this->wechat_config['appsecret']);
        //return $url;
        $access_token = $this->https_request($url);
        return $access_token;
    }


    public function getSingleOpenid($code){
        $url = sprintf($this->wechat_config['session_api'],$this->wechat_config['appid'],$this->wechat_config['appsecret'],$code);
        $openId = $this->https_request($url);
        return $openId;
    }

    /**
     * 发送curl请求
     * @param $url string
     * @param return array|mixed
     */
    public function https_request($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $AjaxReturn = curl_exec($curl);
        //获取access_token和openid,转换为数组
        $data = json_decode($AjaxReturn,true);
        curl_close($curl);
        return $data;
    }
    /**
     * @explain
     * 通过code获取用户openid以及用户的微信号信息
     * @return array|mixed
     * @remark
     * 获取到用户的openid之后可以判断用户是否有数据，可以直接跳过获取access_token,也可以继续获取access_token
     * access_token每日获取次数是有限制的，access_token有时间限制，可以存储到数据库7200s. 7200s后access_token失效
     **/
    public function getUserInfo($access_token = [])
    {
        if(!$access_token){
            return [
                'code' => 0,
                'msg' => '微信授权失败',
            ];
        }
        $userinfo_url = sprintf($this->wechat_config['userinfo_api'],$access_token['access_token'],$access_token['openid']);
        //return $userinfo_url;
        $userinfo_json = $this->https_request($userinfo_url);

        //获取用户的基本信息，并将用户的唯一标识保存在session中
        if(!$userinfo_json){
            return [
                'code' => 0,
                'msg' => '获取用户信息失败！',
            ];
        }
        return $userinfo_json;
    }
}
