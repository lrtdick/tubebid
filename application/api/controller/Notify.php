<?php

namespace app\api\controller;
use weixinPay\WxPayDataBase;
use weixinPay\WxPayApi;
use weixinPay\WxPayOrderQuery;
use weixinPay\WxPayConfig;
use think\Db;
use app\common\ConstCode;
class Notify
{
    public function notifyUrl(){
        $post = file_get_contents("php://input");
        $obj = new WxPayDataBase();
        $config = new WxPayConfig();
        $post_data = $obj->FromXml($post);   //微信支付成功，返回回调地址url的数据：XML转数组Array
        //file_put_contents('return.txt',json_encode($post_data));
        $postSign = $post_data['sign'];
        //file_put_contents('sign.txt',$postSign);
        unset($post_data['sign']);

        /* 微信官方提醒：
         *  商户系统对于支付结果通知的内容一定要做【签名验证】,
         *  并校验返回的【订单金额是否与商户侧的订单金额】一致，
         *  防止数据泄漏导致出现“假通知”，造成资金损失。
         */

        ksort($post_data);// 对数据进行排序
        if($post_data['key']){

            $str = $this->ToUrlParams($post_data);//对数组数据拼接成key=value字符串
        }else{
            $str = $this->ToUrlParams($post_data)."&key=".$config->GetKey();
        }
        $user_sign = strtoupper(md5($str));   //再次生成签名，与$postSign比较
        //file_put_contents('user_sign.txt',$user_sign);
        $where['out_trade_no'] = $post_data['out_trade_no'];
        if($postSign != $user_sign){
            Db::table("orders")->where($where)->update(['msg'=>'订单信息验证失败!']);
            return '订单信息验证失败！';
        }
        $order_status = Db::table("orders")->where($where)->find();
        if(($order_status['amount_payable']*100) != $post_data['total_fee']){
            Db::table("orders")->where($where)->update(['msg'=>'支付金额异常!']);
            return '支付金额异常！';
        }
        if($post_data['return_code']=='SUCCESS' && $postSign == $user_sign && ($order_status['amount_payable']*100) == $post_data['total_fee']){
            /*
            * 首先判断，订单是否已经更新为ok，因为微信会总共发送8次回调确认
            * 其次，订单已经为ok的，直接返回SUCCESS
            * 最后，订单没有为ok的，更新状态为ok，返回SUCCESS
            */
            if($order_status['status']== ConstCode::ORDER_STATUS_PAID){
                $this->return_success();
            }else{
                $update['status'] = ConstCode::ORDER_STATUS_PAID;
                $update['payment_end_time'] = $post_data['time_end'];
                $update['transaction_id'] = $post_data['transaction_id'];
                $update['amount_paid'] = $post_data['total_fee']/100;
                $update['msg'] = '支付成功！';
                $res = Db::table("orders")->where($where)->update($update);
                if($res){
                    $this->return_success();
                }
            }
        }else{
            Db::table("orders")->where($where)->update(['msg'=>'支付失败!']);
            return '支付失败！';
        }
    }

    /**
     * 给微信发送确认订单金额和签名正确，SUCCESS信息 -xzz0521
     */
    private function return_success(){
        $return['return_code'] = 'SUCCESS';
        $return['return_msg'] = 'OK';
        $xml_post = '<xml>
                    <return_code>'.$return['return_code'].'</return_code>
                    <return_msg>'.$return['return_msg'].'</return_msg>
                    </xml>';
        echo $xml_post;exit;
    }

    /**
     * 将参数拼接为url: key=value&key=value
     * @param $params
     * @return string
     */
    public function ToUrlParams( $params ){
        $string = '';
        if( !empty($params) ){
            $array = array();
            foreach( $params as $key => $value ){
                $array[] = $key.'='.$value;
            }
            $string = implode("&",$array);
        }
        return $string;
    }

    //查询订单
    public function Queryorder($transaction_id)
    {
        $input = new WxPayOrderQuery();
        $input->SetTransaction_id($transaction_id);
        $result = WxPayApi::orderQuery($input);
        if(array_key_exists("return_code", $result)
            && array_key_exists("result_code", $result)
            && $result["return_code"] == "SUCCESS"
            && $result["result_code"] == "SUCCESS")
        {
            return true;
        }
        return false;
    }

    //重写回调处理函数
    public function NotifyProcess($data, &$msg)
    {
        $notfiyOutput = array();

        if(!array_key_exists("transaction_id", $data)){
            $msg = "输入参数不正确";
            return false;
        }
        //查询订单，判断订单真实性
        if(!$this->Queryorder($data["transaction_id"])){
            $msg = "订单查询失败";
            return false;
        }
        return true;
    }
}