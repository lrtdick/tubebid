<?php

namespace app\admin\controller;

use app\common\Util;
use think\Config;
use think\Request;
use app\admin\model\VideoModel;
use app\common\ConstCode;
use think\Validate;
use think\Db;
use app\api\model\KeyWordsModel;

class Control extends Admin
{
    //TODO 图文管理

    /**
     * 图文列表
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

       //状态搜索 还有不显示逻辑删除的
       if(!empty(input('status'))) {
           $where['status'] = input('status');
       }else{
           $where['status'] = ['gt',-1];
       }

       //免费搜索
//       if(!empty(input('is_free'))) {
//           $where['is_free'] = input('is_free');
//       }

       //下载搜索
//       if(!empty(input('downloadable'))) {
//           $where['downloadable'] = input('downloadable');
//       }

       //分类搜索
//       $cate_id = input('cate_id');
//       if(!empty($cate_id)) {
//           $where['cate_id'] = $cate_id;
//       }

       //作者搜索
       if(!empty(input('channel_id'))) {
           $where['channel_id'] = input('channel_id');
       }

       //标签搜索
       if(!empty(input('tag'))) {
           $tag = input('tag');
           $where['tag_list'] = ['like',"%"."\"".$tag."\""."%"];
       }

       //分类
       $cate_list = Db::table('video_categories')
           ->where('status',ConstCode::STATUS_SHOW)
           ->field('id,name')
           ->order('id desc')
           ->select();



       //作者
       $channel_list = \think\Db::table('users')
           ->where('user_type',ConstCode::USER_TYPE_FICT)
           ->field('id,name')
           ->order('id desc')
           ->select();

       //标签
       $tag_list = Db::table("tags")
           ->where('status',ConstCode::STATUS_SHOW)
           ->field('id,name')
           ->order('id desc')
           ->select();

       //控件
       $control_list = Db::table("control_cms")
           ->where('status',ConstCode::STATUS_SHOW)
           ->field('id,name')
           ->order('id desc')
           ->select();

       $where['id'] = ['>',0];
       $where['type'] = ConstCode::VIDEO_TYPE_ARTICLE;

       $lists = Db::table('videos')
           ->where($where)
           ->order('published_at desc,id desc')
           ->paginate(10,false,[
               'query'     => [
                   'name' => $name,
                   'status' => input('status'),
                   'is_free' => input('is_free'),
                   'downloadable' => input('downloadable'),
                   'cate_id' => input('cate_id'),
                   'channel_id' => input('channel_id'),
                   'tag' => input('tag'),
               ],
           ]);

       $videos = $lists->toArray();

       foreach ($videos['data'] as &$video){
           $video['cate_name'] = '待定';
           $video['channel_name'] = '待定';
           //分类
           $cate = \think\Db::table('video_categories')
               ->where('id',$video['cate_id'])
               ->field('name')
               ->find();
           $video['cate_name'] = $cate['name'];

           //作者
           if(!empty($video['channel_id'])) {
               $cate = \think\Db::table('users')
                   ->where('id',$video['channel_id'])
                   ->field('name')
                   ->find();
               $video['channel_name'] = $cate['name'];
           }
           //标签
           $tags = explode(',',$video['tag_list']);
           $video['tag_lists'] = $tags;
       }
       unset($course);

       $page = $lists->render();
       $total = $lists->total();
       $data = [];

       foreach ($videos['data'] as $v){
           $data[] = [
               'id' => $v['id'],
               'cate_id' => $v['cate_id'],
               'channel_id' => $v['channel_id'],
               'poster' => $v['poster'],
               'name' => $v['name'],
               'desc' => $v['desc'],
               'is_free' => $v['is_free'],
               'is_top' => $v['is_top'],
               'price' => $v['price'],
               'demo_url' => $v['demo_url'],
               'url' => $v['url'],
               'shares_count' => $v['shares_count'],
               'played_count' => $v['played_count'],
               'download_count' => $v['download_count'],
               'downloadable' => $v['downloadable'],
               'share_name' => $v['share_name'],
               'share_url' => $v['share_url'],
               'tag_lists' => VideoModel::getTagNameList($v['tag_list']),
               'status' => $v['status'],
               'published_at' => $v['published_at'],
               'cate_name' => $v['cate_name'],
               'create_time' => $v['create_time'],
               'channel_name' => $v['channel_name'],
               'fabulou_count' => $v['fabulou_count'],
               'commentsNum' => count(KeyWordsModel::getShenPingByVideoId($v['id'])['commentList'])
           ];
       }
       return view('index',[
           'lists' => $data,
           'cates' => $cate_list,
           'channels' => $channel_list,
           'tag_list' => $tag_list,
           'control_list' => $control_list,
           'page' => $page,
           'total' => $total
       ]);
   }

    /**
     * 添加图文
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
   public function add()
   {
       //分类
       $cate = Db::table('video_categories')
           ->where('status',ConstCode::STATUS_SHOW)
           ->order('id desc')
           ->select();

       //作者
       $channel = Db::table('users')
           ->where('user_type',ConstCode::USER_TYPE_FICT)
           ->order('id desc')
           ->select();

       //标签
       $tag = Db::table('tags')
           ->where('status',ConstCode::STATUS_SHOW)
           ->order('sort desc,id desc')
           ->field('id,name')
           ->select();


       return view('article_add',['cates' => $cate,'channels' => $channel,'tags' => $tag]);
   }

    /**
     * 图文添加提交
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
   public function addPost(Request $request)
   {
       $validate = new Validate([
           'name| 标题' => 'require',
           'desc| 描述' => 'require',
           'tag| 标签' => 'require',
           'content| 内容' => 'require',
           'channel_id| 所属作者' => 'require',
       ]);
       $request_data = $request->post();
       $content = Util::replaceImg($request_data['content']);
       $image_text_jsor=Util::toJson($content['images_html_chars']);//图文数组封装

//       var_dump($content['cover']);
//       exit();
//       foreach ($content['cover'] as $images){
//           $images_url[] = $images['oss-request-url'];
//       }

       //构建图片数组
       $images_url = [];
       foreach ($content['cover'] as $images){
           if(isset($images['ImageURL'])){
               $images_url[] = $images['ImageURL']."&ImageId=".$images['ImageId'];
           }else{
               $images_url[] = $images;
           }
       }

       //有封面就用封面没有就用第一张图
       if($request_data['poster']){
           $poster = $request_data['poster'];
       }else{
           $poster = $images_url[0];
       }
       if (!$validate->check($request_data)) {
           return error($validate->getError());
       }

       if (!$validate->check($request_data)) {
           return error($validate->getError());
       }
       if($request_data['poster']){
           $poster = $request_data['poster'];
       }else{
           $poster = $images_url[0];
       }
       $time = strtotime($request_data['date'].' '.$request_data['time']);
       $data = [
           'channel_id' =>$request_data['channel_id'],
           'name' =>$request_data['name'],
           'desc' =>$request_data['desc'],
           'played_count' =>Util::getRand($request_data['played_count']),
           'image_url' => Util::toJson($images_url),
           'is_top' =>$request_data['is_top'],
           'status' =>$request_data['status'],
           'poster' => $poster,
           'url' => $content['content'],
           'content_txt' => $request_data['contentTxt'],
           'published_at' => date('Y-m-d H:i:s',time()),
           'tag_list' => Util::toJson($request_data['tag']),
           'fabulou_count' => Util::getRand(0),
           'type' => ConstCode::VIDEO_TYPE_ARTICLE,
             'image_text_json' => $image_text_jsor,//保存图文数组json 使用时先解码
       ];
       $video_id = Db::table('videos')->insertGetId($data);
       writeAdminLog(session('VideoAdmin.name'),' 添加图文 ' . $request_data['name']); //后台管理日志
       //$this->push_message($video_id); //新增图文触发极光推送
       return success('添加成功！');
   }

    /**
     * 编辑图文
     * @param $id
     * @return \think\response\View
     */
   public function edit($id)
   {
       $info = Db::table('videos')->where('id',$id)->find();
       $info['date'] = date('Y-m-d',strtotime($info['published_at']));
       $info['time'] = date('H:i:s',strtotime($info['published_at']));


       //分类
       $cate = Db::table('video_categories')
           ->where('status',ConstCode::STATUS_SHOW)
           ->order('id desc')
           ->select();

       //作者
       $channel = Db::table('users')
           ->where('user_type',ConstCode::USER_TYPE_FICT)
           ->order('id desc')
           ->select();

       //标签
       $tag = Db::table('tags')
           ->where('status',ConstCode::STATUS_SHOW)
           ->order('sort desc,id desc')
           ->select();
       return view('article_edit',['info' => $info,'cates' => $cate,'channels' => $channel,'tags' => $tag]);
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
           'desc| 描述' => 'require',
           'tag| 标签' => 'require',
           'content| 内容' => 'require',
           'channel_id| 所属作者' => 'require',
       ]);
       $request_data = $request->post();

       /**
        * 图片转码部分
        */
       $content = Util::replaceImg($request_data['content']);
       $image_text_jsor=Util::toJson($content['images_html_chars']);

       //构建图片数组
       $images_url = [];
       foreach ($content['cover'] as $images){
           if(isset($images['ImageURL'])){
               $images_url[] = $images['ImageURL']."&ImageId=".$images['ImageId'];
           }else{
               $images_url[] = $images;
            }
       }

       //有封面就用封面没有就用第一张图
       if($request_data['poster']){
           $poster = $request_data['poster'];
       }else{
           $poster = $images_url[0];
       }
       if (!$validate->check($request_data)) {
           return error($validate->getError());
       }

//       存储图文信息
       $data = [
           'channel_id' =>$request_data['channel_id'],//这是作者id
           'name' =>$request_data['name'],
           'desc' =>$request_data['desc'],
           'played_count' =>$request_data['played_count'],
           'image_url' => Util::toJson($images_url),//用json存储图的地址李彪
           'is_top' =>$request_data['is_top'],
           'status' =>$request_data['status'],
           'poster' => $poster,
           'url' => $content['content'],
           'content_txt' => $request_data['contentTxt'],
           'update_time' => date('Y-m-d H:i:s',time()),
           'tag_list' => Util::toJson($request_data['tag']),
           'image_text_json' => $image_text_jsor,//保存图文数组json 使用时先解码
       ];
       Db::table('videos')->where('id',$request_data['id'])->update($data);

       writeAdminLog(session('VideoAdmin.name'),' 编辑图文 ' . $request_data['name']); //后台管理日志
       return success('编辑成功！','/admin/article/index');
   }

}
