<?php

namespace app\admin\controller;

use app\common\Util;
use think\Request;
use think\Validate;
use app\common\ConstCode;
use app\admin\job\Common;
use think\Db;

class Advertising extends Admin
{
    //TODO 广告管理

    /**
     * 视频列表
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
   public function index()
   {
       //标题搜索
       $name = input('name');
       if(!empty($name)) {
           $where['name'] = ['like',"%$name%"];
       }

       //状态搜索
       if(!empty(input('status'))) {
           $where['status'] = input('status');
       }else{
           $where['status'] = ['gt',-1];
       }
       $where['id'] = ['>',0];

       $lists = Db::table('advertising_cms')
           ->where($where)
           ->order('create_time desc,id desc')
           ->paginate(20,false,[
               'query'     => [
                   'name' => $name,
                   'status' => input('status'),
               ],
           ]);

       $videos = $lists->toArray();

       $page = $lists->render();
       $total = $lists->total();
       $data = [];

       foreach ($videos['data'] as $v){
           $data[] = [
               'id' => $v['id'],
               'poster' => $v['poster'],
               'name' => $v['name'],
               'is_top' => $v['is_top'],
               'status' => $v['status'],
               'published_at' => $v['published_at'],
               'create_time' => $v['create_time'],
           ];
       }
       return view('index',[
           'lists' => $data,
           'page' => $page,
           'total' => $total
       ]);
   }

    /**
     * 添加广告
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
   public function add()
   {
       return $this->fetch('advertising_add');
   }

    /**
     * 广告添加提交
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
   public function addPost(Request $request)
   {
       $request_data = $request->post();
       $validate = new Validate([
           'name| 标题' => 'require',
           'content| 内容' => 'require',
       ]);
       if (!$validate->check($request_data)) {
           return error($validate->getError());
       }
       $content = Util::replaceImg($request_data['content']);
       $images_url = [];

       if($content['cover']){
           foreach ($content['cover'] as $images){
               if(isset($images['ImageURL'])){
                   $images_url[] = $images['ImageURL']."&ImageId=".$images['ImageId'];
               }else{
                   $images_url[] = $images;
               }
           }
           $type = ConstCode:: ADVERTISING_TYPE_IMG;
       }else{
           $type = ConstCode::ADVERTISING_TYPE_TXT;
       }

       $time = strtotime($request_data['date'].' '.$request_data['time']);
       $data = [
           'name' =>$request_data['name'],
           'is_top' =>$request_data['is_top'],
           'status' =>$request_data['status'],
           'poster' => $images_url[0],
           'content' => $content['content'],
           'published_at' => date('Y-m-d H:i:s',time()),
           'type' =>$type,
       ];

       $video_id = Db::table('advertising_cms')->insertGetId($data);
       writeAdminLog(session('VideoAdmin.name'),' 添加广告 ' . $request_data['name']); //后台管理日志
       return success('添加成功！');
   }
    /**
     * 编辑广告
     * @param $id
     * @return \think\response\View
     */
   public function edit($id)
   {
       $info = Db::table('advertising_cms')->where('id',$id)->find();
       $info['date'] = date('Y-m-d',strtotime($info['published_at']));
       $info['time'] = date('H:i:s',strtotime($info['published_at']));
       $this->assign('info',$info);
       return $this->fetch('advertising_edit');
   }

    /**
     * 提交编辑数据
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
   public function editPost(Request $request)
   {
       $validate = new Validate([
           'name| 标题' => 'require',
           'content| 内容' => 'require',
       ]);
       $request_data = $request->post();
       if (!$validate->check($request_data)) {
           return error($validate->getError());
       }
       $content = Util::replaceImg($request_data['content']);
       $images_url = [];
       if($content['cover']){
           foreach ($content['cover'] as $images){
               if(isset($images['ImageURL'])){
                   $images_url[] = $images['ImageURL']."&ImageId=".$images['ImageId'];
               }else{
                   $images_url[] = $images;
               }
           }
           $type = ConstCode::ADVERTISING_TYPE_TXT;
       }else{
           $type = ConstCode::ADVERTISING_TYPE_IMG;
       }

       $time = strtotime($request_data['date'].' '.$request_data['time']);
       $data = [
           'name' =>$request_data['name'],
           'is_top' =>$request_data['is_top'],
           'status' =>$request_data['status'],
           'poster' => $images_url[0],
           'content' => $content['content'],
           'published_at' => date('Y-m-d H:i:s',$time),
           'update_time' => date('Y-m-d H:i:s',time()),
           'type' => $type
       ];

       Db::table('advertising_cms')->where('id',$request_data['id'])->update($data);
       writeAdminLog(session('VideoAdmin.name'),' 编辑广告 ' . $request_data['name']); //后台管理日志
       return success('编辑成功！');
   }
    /**
     * 组件类型选择下拉框接口
     * @param Request $request
     * @return mixed|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function advertisingSelectApi(Request $request){
        $post_data = $request->post();
        $res = Db::table("control_type")->where("id",$post_data['type_id'])->find();
        if($post_data['type_id'] == ConstCode::CONTROL_ACTIVITY_TEXT_ADVERTISING){
            $advertisingList = Db::table("advertising_cms")->where('status',ConstCode::STATUS_SHOW)->where('type',ConstCode::ADVERTISING_TYPE_TXT)->select();
            $this->assign('advertisingList',$advertisingList);
        }elseif($post_data['type_id'] == ConstCode::CONTROL_ACTIVITY_PICTURE_ADVERTISING){
            $advertisingList = Db::table("advertising_cms")->where('status',ConstCode::STATUS_SHOW)->where('type',ConstCode::ADVERTISING_TYPE_IMG)->select();
            $this->assign('advertisingList',$advertisingList);
        }elseif($post_data['type_id'] == ConstCode::CONTROL_ACTIVITY_VERTICAL_SLIDING || $post_data['type_id'] == ConstCode::CONTROL_ACTIVITY_LIST || $post_data['type_id'] == ConstCode::CONTROL_ACTIVITY_TRANSVERSE_SLIDING){
            $data_role_list = Db::table("data_role")->select();
            $this->assign('data_role',$data_role_list);
        }elseif($post_data['type_id'] == ConstCode::CONTROL_FIXED_SLIDING || $post_data['type_id'] == ConstCode::CONTROL_ACTIVITY_ADVERTISING_SLIDING ){
            $keyWords = Db::table("key_words")->select();
            $this->assign("keyWords",$keyWords);
        }
        $this->assign('type',$post_data['type_id']);
        $data = [
            'demoImg' => $res['demo_img'],
            'selectTemp' => $this->fetch('advertising_select'),
        ];
       // return $this->fetch('advertising_select');
        return $data;
    }

}
