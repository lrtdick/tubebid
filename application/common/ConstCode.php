<?php
/**
 *
 * const code
 *
 */
namespace app\common;

class ConstCode
{
    const NO = 0;
    const YES = 1;



    const STATUS_SHOW = 1;  //正常
    const STATUS_HIDE = 0;  //隐藏
    const STATUS_DELETED = -1;  //删除
    //RESOURCE
    const VIDEO_TYPE_VIDEO = 1;  //视频
    const VIDEO_TYPE_PICTURE = 2;  //图集
    const VIDEO_TYPE_ARTICLE = 3;  //图文
    const IS_FREE_YES = 1;  //免费
    const IS_FREE_NO = 0;   //收费
    const IS_FREE_PAID = 3;   //已购买 存疑 没有搞清楚

    const IS_NOT_ADVERTISING = 0;  //不是广告
    const IS_ADVERTISING = 1;  //是广告

    const VIDEO_TRANSVERSE = 1;  //横版
    const VIDEO_VERTICAL = 0;    //竖版
    //视频状态
    const VALID_ABNORMAL = -1;    //异常
    const VALID_NO = 0;       //不可用
    const VALID_YES = 1;      //正常


    //广告
    const ADVERTISING_TYPE_TXT = 1;   //纯文字
    const ADVERTISING_TYPE_IMG = 2;   //图文

    //前端控件
    const CONTROL_FIXED_TITLE = 1;   //固定标题控件
    const CONTROL_ACTIVITY_TRANSVERSE_ADVERTISING_SLIDING = 2;  //横版广告轮播控件
    const CONTROL_ACTIVITY_TEXT_ADVERTISING = 3;  //可活动文字广告控件
    const CONTROL_ACTIVITY_VERTICAL_SLIDING = 4;   //可活动竖版轮播控件
    const CONTROL_ACTIVITY_TRANSVERSE_SLIDING = 6;   //可活动横版轮播控件
    const CONTROL_ACTIVITY_LIST = 5;    //可活动列表控件
    const CONTROL_FIXED_LIST = 7;       //固定列表控件
    const CONTROL_ACTIVITY_VERTICAL_ADVERTISING_SLIDING = 8 ; //竖版广告轮播组件
    const CONTROL_ACTIVITY_PICTURE_ADVERTISING = 9;  //可活动图文广告控件

    const IS_FIXED_ON = 0;      //固定
    const IS_FIXED_OFF = 1;         //活动

    //轮播图
    const BANNER_IMAGE = 2;    //轮播图为图片
    const BANNER_VIDEO = 1;    //轮播图为视频

    //关键词
    const IS_REL_NO = 0 ;  //未关联
    const IS_REL_YES = 1 ;  //已关联

    //user
    const USER_TYPE_REAL = 1;
    const USER_TYPE_FICT = 0;

    //order status
    const ORDER_STATUS_UNPAID = 1;  //未支付
    const ORDER_STATUS_PAID = 2;    //已支付
    const ORDER_STATUS_REFUNDING = 3;   //退款中
    const ORDER_STATUS_REFUNDED = 4;    //已退款
    const ORDER_STATUS_CANCEL_ORDER = 5;    //订单取消
    const PAY_TYPE_WEIXIN = 1;    //微信
    const PAY_TYPE_ALIPAY = 2;    //支付宝


    //api
    const TYPE_COMMENTS = 1;    //评论
    const TYPE_REPLY = 2;       //回复
    const TYPE_ZAN_VIDEO = 1;   //产品
    const TYPE_ZAN_COMMENT = 2;  //评论
    const TYPE_ZAN_REPLY = 3;    //回复
    const ZAN_NO = 0;    // 未赞/关注
    const ZAN_YES = 1;   // 已赞/关注

    const TYPE_FOCUS_USER = 1;   //关注类型为用户
    const TYPE_FOCUS_KEYWORDS = 2;   //关注类型为关键词

    //支付
    const PRODUCT_TYPE_VIDEO = 1;   //支付产品类型为视频
    const PRODUCT_TYPE_COUPON = 2;  //支付产品类型为优惠券


}
