<?php
/**
 * 项目 消息推送模型
 *
 * @copyright   Copyright 2010-2018 XXX有限公司(www.XXX.cn)
 * @package     Common
 * @version     20180715
 * @link        http://www.XXX.cn
 */

namespace extend\JPush2;

require_once("jpush/JPush.php");
class MsgPush{

    //appkey
    private $_app_key;

    //master_secret,
    private $_master_secret;

    //$_push_client
    private $_push_client = null;

    //构造函数
    public function __construct($_app_key,$_master_secret){
        $this ->_app_key = $_app_key;
        $this ->_master_secret = $_master_secret;
        $this ->_push_client = new JPush($this ->_app_key,$this ->_master_secret );
    }

    //将json格式转换成数组格式
    function json_array($result){
        $result_json = json_encode($result);
        return json_decode($result_json,true);
    }

    //获取alias和tags
    public function getDevices($registrationID){

        $result =$this ->_push_client->device()->getDevices($registrationID);

        return $result;

    }

    //添加tags
    public function addTags($registrationID,$tags){

        $result = $this ->_push_client->device()->addTags($registrationID,$tags);

        return $result;

    }

    //移除tags
    public function removeTags($registrationID,$tags){

        $result = $this ->_push_client->device()->removeTags($registrationID,$tags);

        return $result;

    }

    //标签推送
    public function pushTag($tag,$content){

        $tags = implode(",",$tag);

        $result = $this ->_push_client->push()
            ->setPlatform(array('ios', 'android'))
            ->addTag($tags)                          //标签
            ->setNotificationAlert($content)           //内容
            ->send();

        return json_array($result);

    }

    //别名推送
    public function pushAlias($userids,$content){
        $alias = implode(",",$userids);

        $result = $this ->_push_client->push()
            ->setPlatform(array('ios', 'android'))
            ->addAlias($alias)                      //别名
            ->setNotificationAlert($content)        //内容
            ->send();

        return json_array($result);

    }

    //向所有设备推送消息（用于开发阶段的测试）
    function sendNotifyAll($message){
        $result = $this ->_push_client->push()
            ->setPlatform('all')
            ->addAllAudience()                      //别名
            ->setNotificationAlert($message)        //内容
            ->send();
        return json_array($result);
    }
}
?>