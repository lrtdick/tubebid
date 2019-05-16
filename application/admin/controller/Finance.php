<?php

namespace app\admin\controller;
use think\Db;
use think\Validate;
use app\common\ConstCode;
class Finance extends Admin
{
    public function order()
    {
        //订单号搜索
        if(!empty(input('no'))) {
            $where['out_trade_no'] = input('no');
        }

        //订单状态搜索
        if(!empty(input('status'))) {
            $where['status'] = input('status');
        }

        //支付类型搜索
        if(!empty(input('pay_type'))) {
            $where['pay_type'] = input('pay_type');
        }

        $where['id'] = ['>',0];
        $lists = Db::table('orders')
            ->where($where)
            ->paginate(15);

        $orders = $lists->toArray();
        foreach ($orders['data'] as &$order){
            $order['user_name'] = '待定';
            if(!empty($order['user_id'])){
                $user = Db::table('users')
                    ->where('id',$order['user_id'])
                    ->field('name')
                    ->find();
                $order['user_name'] = $user['name'];
            }

            //视频信息
            if(!empty($order['product_id'])){
                $course = Db::table('videos')
                    ->where('id',$order['product_id'])
                    ->field('name')
                    ->find();

                $order['course_name'] = $course['name'];
            }

        }
        unset($order);

        $page = $lists->render();
        $total = $lists->total();
        return view('order',['lists' => $orders['data'],'page' => $page,'total' => $total]);
    }

    /**
     * 取消订单
     */
    public function orderDel()
    {
        $id = input('id');
        Db::table('orders')->where('id',$id)->update(['status' => ConstCode::ORDER_STATUS_CANCEL_ORDER]);

        return success('订单已取消！');
    }
}
