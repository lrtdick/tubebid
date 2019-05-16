<?php
/**
 *
 * api (http:json)
 *
 */
namespace app\api\controller;
use app\api\apiabstract\BaseAbstract;
use app\api\model\UserModel;
use app\common\ConstCode;
use app\common\Util;
use app\common\Result;
use think\Db;
use weixinPay\WxPayApi;
use weixinPay\WxPayConfig;
use weixinPay\WxPayUnifiedOrder;
use weixinPay\WxPayException;
use weixinPay\WxPayJsApiPay;

class Pay extends BaseAbstract
{
    protected $config;
    protected $amountPayable =  0;
    public function index(){
        $where['user_id'] = $this->userId;
        $where['product_id'] = $this->data['productId'];
        $where['status'] = ConstCode::ORDER_STATUS_PAID;
        $where['product_type'] = $this->data['type'];
        $isPaid = Db::table("orders")->where($where)->find();
        if($isPaid){
            return Result::getResultError('您已购买过该产品，无需重复购买！');
        }
        if($this->data['type'] == ConstCode::PRODUCT_TYPE_VIDEO){
            $productInfo = Db::table("videos")->where('id',$this->data['productId'])->find();
            if(!$productInfo){
                return Result::getResultError('商品信息有误！');
            }
            if($productInfo['is_free'] != ConstCode::IS_FREE_NO){
                return Result::getResultError('商品为免费，无需支付！');
            }
            $this->amountPayable = $productInfo['price']*100;
            $data['product_id'] = $productInfo['id'];
            $data['order_desc'] = '用户点播付费视频';
        }else{
            $data['order_desc'] = '用户购买优惠券';
        }
        $data['amount_payable'] = $this->amountPayable/100;
        $data['user_id'] = $this->userId;
        $data['out_trade_no'] = Util::createOrder();
        $data['create_time'] = date("Y-m-d H:i:s",time());
        $data['product_type'] = Util::toNumber($this->data['type']);
        //return Result::getResultSuccess($data);
        $orderId = Db::table("orders")->insertGetId($data);
        if($orderId){
            $openid = UserModel::getUserInfoById($this->userId)['openid'];
            $this->config = new WxPayConfig();
            $input = new WxPayUnifiedOrder();
            //         文档提及的参数规范：商家名称-销售商品类目
            $input->SetBody($data['order_desc']);
            //         订单号应该是由小程序端传给服务端的，在用户下单时即生成，demo中取值是一个生成的时间戳
            $input->SetOut_trade_no($data['out_trade_no']);
            //         费用应该是由小程序端传给服务端的，在用户下单时告知服务端应付金额，demo中取值是1，即1分钱
            $input->SetTotal_fee($this->amountPayable);
            //$input->SetNotify_url("");//需要自己写的notify.php
            $input->SetTrade_type("JSAPI");
            //         由小程序端传给后端或者后端自己获取，写自己获取到的，
            $input->SetOpenid($openid);
            //$input->SetOpenid($this->getSession()->openid);
            //         向微信统一下单，并返回order，它是一个array数组
            $order = WxPayApi::unifiedOrder($this->config,$input);
            //         json化返回给小程序端
            header("Content-Type: application/json");
            $res =  $this->getJsApiParameters($order);
        }else{
            $res = [];
        }
        return $res;
    }

    private function getJsApiParameters($UnifiedOrderResult)
    {    //判断是否统一下单返回了prepay_id
        if (!array_key_exists("appid", $UnifiedOrderResult)
            || !array_key_exists("prepay_id", $UnifiedOrderResult)
            || $UnifiedOrderResult['prepay_id'] == "") {
            throw new WxPayException("参数错误");
        }
        $jsapi = new WxPayJsApiPay();
        $jsapi->SetAppid($UnifiedOrderResult["appid"]);
        $timeStamp = time();
        $jsapi->SetTimeStamp("$timeStamp");
        $jsapi->SetNonceStr(WxPayApi::getNonceStr());
        $jsapi->SetPackage("prepay_id=" . $UnifiedOrderResult['prepay_id']);
        $jsapi->SetSignType("MD5");
        $jsapi->SetPaySign($jsapi->MakeSign($this->config));
        $parameters = json_encode($jsapi->GetValues());
        return $parameters;
    }
}
