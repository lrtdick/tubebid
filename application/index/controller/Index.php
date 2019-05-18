<?php
namespace app\index\controller;
//导入路由类
use app\index\model\ProductCategoriesModel;
use app\index\model\ProductsModel;
use think\Controller;
use think\Request;

class Index extends Controller
{
    public function index()
    {

        $catesInfo=ProductCategoriesModel::where(['status'=>1])->select();
        $lists=ProductsModel::where(['status'=>1])->paginate(10);
            foreach ($lists as $list)
            {
                $list['audiences']=calcK($list['audiences']);
                $list['username']='*****'.substr($list['username'],-3);
            }
        $page = $lists->render();
        $total = $lists->total();

            $data=[
                'lists'=>$lists,
                'categories'=>$catesInfo,
                'page' => $page,
                'total' => $total ,

            ];



        $this->assign($data);
        return $this->fetch('Index');
        return $this->fetch('Inside_t_bootstrap');
    }

    public function indexTable(Request $request){

        $post_data = $request->post()['data'];

        $where['type']=['in',$post_data['social']];
//
        if($post_data['filter']){
            foreach ($post_data['filter'] as $k=>$v){
                $where[$k]=$v;
            }
        }
        $where['category_id']=['in',$post_data['categories']];
        $where['status']=1;


        $catesInfo=ProductCategoriesModel::where(['status'=>1])->select();
        $lists=ProductsModel::where($where)->order($post_data['order_by'])->paginate(10);
        $total = $lists->total();
        foreach ($lists as $list)
        {
            $list['audiences']=calcK($list['audiences']);
            $list['username']='*****'.substr($list['username'],-3);
        }

        $data=[
            'lists'=>$lists,
            'total' => $total ,
        ];
        $this->assign($data);
        return $this->fetch('table_info');

    }

    public function makeProducts()
    {
        //取随机10位字符串
    $strs="QWERTYUIOPASDFGHJKLZXCVBNM1234567890qwertyuiopasdfghjklzxcvbnm";

        for ($i = 1; $i < 10; $i++) {
            $username=substr(str_shuffle($strs),mt_rand(0,strlen($strs)-11),4);
            $data=[
                    'username'=> $username,
                    'type'=> random_int(1,2),
                    'audiences'=> random_int(10000,500000000),
                    'price'=> rand(10.50,5000),
                    'status'=> 1,
                    'created_at'=> date('Y-m-d H:i:s',time()),
                ];
            $product=new ProductsModel();
            $product->save($data);
        }

    }

    public function makeCates()
    {

        $name_list=[
            "Humor & Memes",
            "Quotes & Sayings",
            "Cars & Bikes",
            "Fitness & Sports",
            "Fashion & Style",
            "Food & Nutrition",
            "Luxury & Motivation",
            "Outdoor & Travel",
            "Pets & Animals",
            "Models & Celebrities",
            "Movies TV & Fanpages",
            "Educational & QA",
            "Gaming & Entertainment",
            "Reviews & How-to",
        ];

        foreach($name_list as $name){

            $data=[
                'category_name'=> $name,
                'type'=> 1,
                'status'=>1,
                'created_at'=> date('Y-m-d H:i:s',time()),
            ];
            $product=new ProductCategoriesModel();
            $product->save($data);
        }

    }


}