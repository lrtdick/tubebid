<?php

namespace app\admin\controller;

use app\admin\model\AuthorModel;
use app\admin\model\ControlModel;
use app\admin\model\TagsModel;
use app\common\Result;
use app\common\Util;
use think\Config;
use think\Request;
use think\Validate;
use app\admin\model\VideoModel;
use app\admin\job\Common;
use think\Db;
use app\common\ConstCode;
use app\admin\model\KeywordsModel;

class Video extends Admin
{
    //TODO 视频管理

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

       //状态搜索 还有不显示逻辑删除的
       if(!empty(input('status'))) {
           $where['status'] = input('status');
       }else{
           $where['status'] = ['gt',-1];
       }

       //免费搜索
       if(!empty(input('is_free'))) {
           $where['is_free'] = input('is_free');
       }

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
       //关键词搜索
//       if(!empty(input('keyWords'))) {
//           $keyWords = input('keyWords');
//           $where['key_words'] = ['like',"%"."\"".$keyWords."\""."%"];
//       }

       //分类
       $cate_list = Db::table('video_categories')
           ->where('status',ConstCode::STATUS_SHOW)
           ->field('id,name')
           ->order('id desc')
           ->select();

       //作者
       $authorWhere['user_type']=ConstCode::USER_TYPE_FICT;
       $channel_list = AuthorModel::where($authorWhere)
           ->field('id,name')
           ->order('id desc')
           ->select();

       //标签
       $tag_list = Db::table("tags")
           ->where('status',ConstCode::STATUS_SHOW)
           ->field('id,name')
           ->order('id desc')
           ->select();

       $where['id'] = ['>',0];
       $where['type'] = ConstCode::VIDEO_TYPE_VIDEO;

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
                   'key_words' => input('keyWords'),
                   'tag' => input('tag'),
               ],
           ]);

       $videos = $lists->toArray();
       foreach ($videos['data'] as &$video){
           $video['cate_name'] = '待定';
           $video['channel_name'] = '待定';
           //分类
           $cate = Db::table('video_categories')
               ->where('id',$video['cate_id'])
               ->field('name')
               ->find();
           $video['cate_name'] = $cate['name'];

           //作者
           if(!empty($video['channel_id'])) {
               $cate = Db::table('users')
                   ->where('id',$video['channel_id'])
                   ->field('id,name')
                   ->find();
               $video['channel_name'] = $cate['name'];
           }

           //单一控件
           if(!empty($video['control_id'])) {
               $cate = ControlModel::where('id',$video['control_id'])
                   ->field('control_name')
                   ->find();
               $video['control_name'] = $cate['control_name'];
           }

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
               'key_words' => VideoModel::getKeyWordsList($v['key_words']),
               'is_free' => $v['is_free'],
               'is_top' => $v['is_top'],
               'price' => $v['price'],
               'demo_url' => $v['demo_url'],
               'url' => $v['url'],
               'shares_count' => $v['shares_count'],
               'played_count' => $v['played_count'],
               'sort_by' => $v['sort_by'],
               'download_count' => $v['download_count'],
               'downloadable' => $v['downloadable'],
               'share_name' => $v['share_name'],
               'share_url' => $v['share_url'],
               'tag_lists' => VideoModel::getTagNameList($v['tag_list']),
               'status' => $v['status'],
               'published_at' => $v['published_at'],
               'create_time' => $v['create_time'],
               'cate_name' => $v['cate_name'],
               'channel_name' => $v['channel_name'],
               'control_name' =>$v['control_name'],
               'control_id' =>$v['control_id'],
               'fabulou_count' => $v['fabulou_count'],
               'commentsNum' => count(KeyWordsModel::getShenPingByVideoId($v['id'])['commentList'])
           ];
       }
       return view('index',[
           'lists' => $data,
           'cates' => $cate_list,
           'channels' => $channel_list,
           'tag_list' => $tag_list,
           'page' => $page,
           'total' => $total
       ]);
   }

    /**
     * 添加视频
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
       $channel = AuthorModel::where('user_type',ConstCode::USER_TYPE_FICT)
           ->order('id desc')
           ->select();

       //控件列表
       $control_list = ControlModel::where('status',ConstCode::STATUS_SHOW)
           ->order('id desc')
           ->select();

       //标签
       $tag = TagsModel::where('status', ConstCode::STATUS_SHOW)
           ->order('sort desc,id desc')
           ->select();

       //关键字
       $keywords_list = KeywordsModel::where('status', ConstCode::STATUS_SHOW)
           ->order('sort desc,id desc')
           ->select();

       return view('video_add',[
           'cates' => $cate,
           'channels' => $channel,
           'tags' => $tag,
           'control_list' => $control_list,
           'keywords_list' => $keywords_list,
       ]);
   }

    /**
     * 视频添加提交
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
   public function addPost(Request $request)
   {
       /**
        * 验证信息
        */
       $validate = new Validate([
           'name| 标题' => 'require',
           'desc| 描述' => 'require',
           'video_url| 播放地址' => 'require',
           'poster_url| 封面图片' => 'require',
           'tag| 标签' => 'require',
           'channel_id| 所属作者' => 'require',
           'keywords_ids| 关键字' => 'require',
       ]);
       $request_data = $request->post();
       if (!$validate->check($request_data)) {
           return error($validate->getError());
       }

       /**
        * 视频信息
        */
       if($request_data['is_free'] == ConstCode::IS_FREE_NO){
           $demo_url = $request_data['demo_video_url'];
           $demo_video_play_auth = $request_data['demo_video_play_auth'];
           $demo_vod_video_id = $request_data['demo_vod_video_id'];
           $price = $request_data['price'];
       }else{
           $demo_url = null;
           $demo_video_play_auth = null;
           $demo_vod_video_id = null;
           $price = 0;
       }

       /**
        * 存储信息
        */
       $data = [
           'channel_id' =>$request_data['channel_id'],
           'control_id' => $request_data['control_id']?$request_data['control_id']:0,
           'is_advertising' => $request_data['is_advertising'],
           'name' =>$request_data['name'],
           'desc' =>$request_data['desc'],
           'played_count' =>Util::getRand($request_data['played_count']),
           'sort_by' => $request_data['sort_by'],
           'is_free' =>$request_data['is_free'],
           'is_top' =>$request_data['is_top'],
           'status' =>$request_data['status'],
           'price' => $price,
           'poster' => $request_data['poster_url'],
           'demo_url' => $demo_url,
           'demo_video_play_auth' => $demo_video_play_auth,
           'demo_vod_video_id' => $demo_vod_video_id,
           'url' => $request_data['video_url'],
           'video_play_auth' => $request_data['video_play_auth'],
           'vod_video_id' => $request_data['vod_video_id'],
           'published_at' => date('Y-m-d H:i:s', time()),
           'tag_list' => Util::toJson($request_data['tag']),
           'fabulou_count' => Util::getRand(0),
           'url_expires_time' =>time()+config("vod_expires_time"),
           'type' => ConstCode::VIDEO_TYPE_VIDEO
       ];

       $video_id = Db::table('videos')->insertGetId($data);
       /**
        * 资源映射关系
        * 传入 资源id 映射数组ids
        * 查询映射表中的关系 没有的就添加
        * 再按照新的ids打开或关闭关系
        */
       VideoModel::updateVideoTags($video_id,$request_data['tag']);
       VideoModel::updateVideoKeywords($video_id,$request_data['keywords_ids']);

       writeAdminLog(session('VideoAdmin.name'),' 添加视频 ' . $request_data['name']); //后台管理日志
       //$this->push_message($video_id); //新增视频触发极光推送
       return success('添加成功！');
   }


    /**
     * 编辑视频
     * @param $id
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
   public function edit($id)
   {
       $info = Db::table('videos')->where('id',$id)->find();
       $info['date'] = date('Y-m-d',strtotime($info['published_at']));
       $info['time'] = date('H:i:s',strtotime($info['published_at']));

       /**
        * 获取本身keywords和tags信息
        */
       //keywords 关键字的 对应video关系 resourcesMappings
       $keywordsInfo=collection(KeywordsModel::hasWhere('resourcesMappings',['status'=>1,'resource_id'=>$id])->select());
       $keywords_list=[];
       foreach ($keywordsInfo as $item){
           $keywords_list[]=$item['id'];
       }
       $info['keywords_list']=json_encode($keywords_list);

       //keywords 关键字的 对应video关系 resourcesMappings
       $TagsInfo=collection(TagsModel::hasWhere('resourcesMappings',['status'=>1,'resource_id'=>$id])->select());
       $tag_list=[];
       foreach ($TagsInfo as $item){
           $tag_list[]=$item['id'];
       }
       $info['tag_list']=json_encode($tag_list);

       //分类
       $cate = Db::table('video_categories')
           ->where('status',ConstCode::STATUS_SHOW)
           ->order('id desc')
           ->select();

       //作者
       $channel = AuthorModel::where('user_type',ConstCode::USER_TYPE_FICT)
           ->order('id desc')
           ->select();

       //控件列表
       $control_list = ControlModel::where('status',ConstCode::STATUS_SHOW)
           ->order('id desc')
           ->select();

       //标签
       $tag = TagsModel::where('status', ConstCode::STATUS_SHOW)
           ->order('sort desc,id desc')
           ->select();

       //关键词
       $keywords_list = KeywordsModel::where('status', ConstCode::STATUS_SHOW)
           ->order('sort desc,id desc')
           ->select();
       return view('video_edit', [
           'info' => $info,
           'cates' => $cate,
           'channels' => $channel,
           'control_list' => $control_list,
           'tags' => $tag,
            'keywords_list'=>$keywords_list
       ]
       );
   }

    /**
     * 提交编辑数据
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
   public function editPost(Request $request)
   {
       /**
        * 验证数据
        */
       $request_data = $request->post();
       $validate = new Validate([
           'name| 标题' => 'require',
           'desc| 描述' => 'require',
           'video_url| 播放地址' => 'require',
           'tag| 标签' => 'require',
           'channel_id| 所属作者' => 'require',
           'keywords_ids| 关键字' => 'require',
       ]);
       if (!$validate->check($request_data)) {
           return error($validate->getError());
       }

       /**
        * 视频地址处理
        */
       if($request_data['is_free'] == ConstCode::IS_FREE_NO){
           $demo_url = $request_data['demo_video_url'];
           $demo_video_play_auth = $request_data['demo_video_play_auth'];
           $demo_vod_video_id = $request_data['demo_vod_video_id'];
           $price = $request_data['price'];
       }else{
           $demo_url = null;
           $demo_video_play_auth = null;
           $demo_vod_video_id = null;
           $price = 0;
       }

       /**
        * 存储信息
        */
       $data = [
           'channel_id' =>$request_data['channel_id'],
           'control_id' => $request_data['control_id']?$request_data['control_id']:0,
           'is_advertising' => $request_data['is_advertising'],
           'name' =>$request_data['name'],
           'desc' =>$request_data['desc'],
           'played_count' =>Util::getRand($request_data['played_count']),
           'sort_by' => $request_data['sort_by'],
           'is_free' =>$request_data['is_free'],
           'price' => $price,
           'demo_url' => $demo_url,
           'demo_video_play_auth' => $demo_video_play_auth,
           'demo_vod_video_id' => $demo_vod_video_id,
           'is_top' =>$request_data['is_top'],
           'status' =>$request_data['status'],
           'poster' => $request_data['poster_url'],
           'url' => $request_data['video_url'],
           'update_time' => date("Y-m-d H:i:s",time()),
           'video_play_auth' => $request_data['video_play_auth'],
           'vod_video_id' => $request_data['vod_video_id'],
           'url_expires_time' =>time()+config("vod_expires_time"),
           'tag_list' => Util::toJson($request_data['tag'])
       ];

       Db::table('videos')->where('id',$request_data['id'])->update($data);
       /**
        * 资源映射关系
        * 传入 资源id 映射数组ids
        * 查询映射表中的关系 没有的就添加
        * 再按照新的ids打开或关闭关系
        */
       VideoModel::updateVideoTags($request_data['id'],$request_data['tag']);
       VideoModel::updateVideoKeywords($request_data['id'],$request_data['keywords_ids']);

       writeAdminLog(session('VideoAdmin.name'),' 编辑视频 ' . $request_data['title']); //后台管理日志
       return success('编辑成功！');
   }


   //TODO 分类管理

    /**
     * 分类页
     */
    public function cate()
    {
        $lists = Db::table('video_categories')
            ->order("id desc")
            ->paginate(20);

        return view('cate',['lists' => $lists]);
    }

    /**
     * 添加分类
     * @return \think\response\Json
     */
    public function addCate()
    {
        $validate = new Validate([
            'name| 分类名' => 'require',
        ]);
        $request_data = input();

        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        $info = Db::table('video_categories')
            ->where('name', $request_data['name'])
            ->find();
        if(!empty($info)) {
            return error('数据已存在');
        }

        $data = [
            'name' => $request_data['name'],
            'status' => $request_data['status'],
        ];

        Db::table('video_categories')->insert($data);
        writeAdminLog(session('VideoAdmin.name'),' 添加视频分类 ' . $request_data['name']); //后台管理日志
        return success('成功添加分类！');
    }

    /**
     * 获取编辑的分类
     * @return \think\response\Json
     */
    public function editCate()
    {
        $validate = new Validate([
            'id| ID' => 'require',
        ]);
        $request_data = input();

        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        $info = \think\Db::table('video_categories')
            ->where('id',$request_data['id'])
            ->find();

        return success('编辑分类！',$info);
    }

    /**
     * 编辑数据提交
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editCatePost()
    {
        $validate = new Validate([
            'id| ID' => 'require',
            'name| 分类名' => 'require',
        ]);
        $request_data = input();

        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        $info = Db::table('video_categories')
            ->where('name', $request_data['name'])
            ->find();
        if(!empty($info)) {
            return error('数据已存在');
        }

        $data = [
            'name' => $request_data['name'],
            'status' => $request_data['status'],
        ];

        \think\Db::table('video_categories')
            ->where('id',$request_data['id'])
            ->update($data);

        writeAdminLog(session('VideoAdmin.name'),' 编辑视频分类 ' . $request_data['name']); //后台管理日志
        return success('成功编辑分类！');
    }


   //TODO 标签管理
    /**
     * 标签列表
     */
    public function tag()
    {
        $lists = \think\Db::table('tags')
            ->order("sort desc,id desc")
            ->paginate(20);

        return view('tag',['lists' => $lists]);
    }

    /**
     * 添加标签
     * @return \think\response\Json
     */
    public function addTagPost(Request $request)
    {
        $request_data = $request->post();
        $validate = new Validate([
            'name| 标签名' => 'require',
        ]);
        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        $info = Db::table('tags')
            ->where('name', $request_data['name'])
            ->find();
        if(!empty($info)) {
            return error('该标签已存在');
        }

        $data = [
            'sort' => $request_data['sort'],
            'name' => $request_data['name'],
            'status' => $request_data['status'],
        ];

        Db::table('tags')->insert($data);
        writeAdminLog(session('VideoAdmin.name'),' 添加标签 ' . $request_data['name']); //后台管理日志
        return success('成功添加！');
    }

    /**
     * 获取编辑的标签
     * @return \think\response\Json
     */
    public function editTag(Request $request)
    {
        $request_data = $request->post();
        $validate = new Validate([
            'id| ID' => 'require',
        ]);
        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        $info = Db::table('tags')
            ->where('id',$request_data['id'])
            ->find();

        return success('编辑标签！',$info);
    }

    /**
     * 编辑数据提交
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editTagPost(Request $request)
    {
        $request_data = $request->post();
        $validate = new Validate([
            'id| ID' => 'require',
            'name| 分类名' => 'require',
        ]);
        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        $info = Db::table('tags')
            ->where('id','<>',$request_data['id'])
            ->where('name', $request_data['name'])
            ->find();
        if(!empty($info)) {
            return error('该标签已存在');
        }

        $data = [
            'name' => $request_data['name'],
            'sort' => $request_data['sort'],
            'status' => $request_data['status'],
        ];

        Db::table('tags')
            ->where('id',$request_data['id'])
            ->update($data);

        writeAdminLog(session('VideoAdmin.name'),' 编辑标签 ' . $request_data['name']); //后台管理日志
        return success('成功编辑标签！');
    }


    /**
     * 更改状态
     */
    public function changeStatus()
    {
        $field = input('field');
        $id = input('id');
        $type = input('type');

        switch ($type){
            case 'cate': //视频分类
                $info = Db::table('video_categories')
                    ->where('id',$id)
                    ->field("$field,name")
                    ->find();

                $status = $info[$field] == ConstCode::STATUS_SHOW? ConstCode::STATUS_HIDE : ConstCode::STATUS_SHOW;

                Db::table('video_categories')
                    ->where('id',$id)
                    ->update(["$field" => "$status"]);

                writeAdminLog(session('VideoAdmin.name'),' 编辑视频分类 ' . $info['name'] . ' 状态'); //后台管理日志
                break;
            case 'tag'://视频专栏
                $info = Db::table('tags')
                    ->where('id',$id)
                    ->field("$field,name")
                    ->find();

                $status = $info[$field] == ConstCode::STATUS_SHOW? ConstCode::STATUS_HIDE : ConstCode::STATUS_SHOW;

                Db::table('tags')
                    ->where('id',$id)
                    ->update(["$field" => "$status"]);

                writeAdminLog(session('VideoAdmin.name'),' 编辑标签 ' . $info['name'] . ' 状态'); //后台管理日志
                break;
            case 'video'://视频专栏
                $info = Db::table('videos')
                    ->where('id',$id)
                    ->field("$field,name")
                    ->find();

                $status = $info[$field] == ConstCode::STATUS_SHOW? ConstCode::STATUS_HIDE : ConstCode::STATUS_SHOW;

                Db::table('videos')
                    ->where('id',$id)
                    ->update(["$field" => "$status"]);

                writeAdminLog(session('VideoAdmin.name'),' 编辑视频 ' . $info['name'] . ' 状态'); //后台管理日志
                break;
            case 'keyWords'://关键词
                $info = Db::table('key_words')
                    ->where('id',$id)
                    ->field("$field,name")
                    ->find();

                $status = $info[$field] == ConstCode::STATUS_SHOW? ConstCode::STATUS_HIDE : ConstCode::STATUS_SHOW;

                Db::table('key_words')
                    ->where('id',$id)
                    ->update(["$field" => "$status"]);
                writeAdminLog(session('VideoAdmin.name'),' 编辑关键词 ' . $info['name'] . ' 状态'); //后台管理日志
                break;
            case 'expert'://关键词
                $info = Db::table('users')
                    ->where('id',$id)
                    ->field("$field,name")
                    ->find();

                $status = $info[$field] == ConstCode::STATUS_SHOW? ConstCode::STATUS_HIDE : ConstCode::STATUS_SHOW;

                Db::table('users')
                    ->where('id',$id)
                    ->update(["$field" => "$status"]);
                writeAdminLog(session('VideoAdmin.name'),' 编辑作者 ' . $info['name'] . ' 状态'); //后台管理日志
                break;
            case 'advertising'://广告
                $info = Db::table('advertising_cms')
                    ->where('id',$id)
                    ->field("$field,name")
                    ->find();

                $status = $info[$field] == ConstCode::STATUS_SHOW? ConstCode::STATUS_HIDE : ConstCode::STATUS_SHOW;

                Db::table('advertising_cms')
                    ->where('id',$id)
                    ->update(["$field" => "$status"]);
                writeAdminLog(session('VideoAdmin.name'),' 编辑广告 ' . $info['name'] . ' 状态'); //后台管理日志
                break;
        }
        return success('更改状态');
    }


    /**
     * 删除视频
     */
    public function deleted()
    {
        $type = input('type');
        $id = input('id');
        $ids = input('ids');

        switch ($type) {
            //视频分类
            case 'cate':
                if(empty($ids)) {
                    Db::table('video_categories')
                        ->where('id',$id)
                        ->setField('status',-1);
                }else{
                    $ids = explode(',',$ids);
                    foreach ($ids as $id) {
                        Db::table('video_categories')
                            ->where('id',$id)
                            ->setField('status',-1);
                    }
                }
                writeAdminLog(session('VideoAdmin.name'),' 设置视频分类ID：' . $id.'为删除状态'); //后台管理日志
                break;
            //标签管理
            case 'tag':
                if(empty($ids)) {
                    Db::table('tags')
                        ->where('id',$id)
                        ->setField('status',-1);
                }else{
                    $ids = explode(',',$ids);
                    foreach ($ids as $id) {
                        Db::table('tags')
                            ->where('id',$id)
                            ->setField('status',-1);
                    }
                }
                writeAdminLog(session('VideoAdmin.name'),' 设置标签ID：' . $id.'为删除状态'); //后台管理日志
                break;
            //视频管理
            case 'video':
                if(empty($ids)) {
                    Db::table('videos')
                        ->where('id',$id)
                        ->setField('status',-1);
                }else{
                    $ids = explode(',',$ids);
                    foreach ($ids as $id) {
                        Db::table('videos')
                            ->where('id',$id)
                            ->setField('status',-1);
                    }
                }
                writeAdminLog(session('VideoAdmin.name'),' 设置视频ID：' . $id.'为删除状态'); //后台管理日志
                break;
            //关键词管理
            case 'keyWords':
                if(empty($ids)) {
                    Db::table('key_words')
                        ->where('id',$id)
                        ->setField('status',-1);
                }else{
                    $ids = explode(',',$ids);
                    foreach ($ids as $id) {
                        Db::table('key_words')
                            ->where('id',$id)
                            ->setField('status',-1);
                    }
                }
                writeAdminLog(session('VideoAdmin.name'),' 设置关键词ID：' . $id.'为删除状态'); //后台管理日志
                break;
            //作者管理 已经整合到authorcontroller


            //广告管理
            case 'advertising':
                if(empty($ids)) {
                    Db::table('advertising_cms')
                        ->where('id',$id)
                        ->setField('status',-1);
                }else{
                    $ids = explode(',',$ids);
                    foreach ($ids as $id) {
                        Db::table('advertising_cms')
                            ->where('id',$id)
                            ->setField('status',-1);
                    }
                }
                writeAdminLog(session('VideoAdmin.name'),' 设置广告ID：' . $id.'为删除状态'); //后台管理日志
                break;
        }
        return success('删除成功，如需恢复请联系程序员');
    }

    /**
     * 添加回复点赞数
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function replies_zan(Request $request)
    {
        $validate = new \think\Validate([
            'id| ID' => 'require',
            'zan| 点赞数' => 'require',
        ]);
        $request_data = input();

        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }
        $id = $request->param('id');
        $zan = $request->param('zan');
        $info = \think\Db::table('user_replies')->where('id',$id)->field('zan')->find();
        $result = \think\Db::table('user_replies')->where('id',$id)->update(['zan' => $info['zan'] + $zan]);
        if($result) {
            return success('操作成功');
        }
        return error('操作失败');
    }

    /**
     * 推送新视频消息
     * @param $video_id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function push_message($video_id)
    {
        //实例化极光推送类
        $push_config = ['push_app_key','push_master_secret'];
        foreach ($push_config as $config) {
            $item = \think\Db::table('system')->where(['key' => $config])->field('value')->find();
            $configs[$config] = $item['value'];
        }

        $pushmodel = new \JPush\Client($configs['push_app_key'],$configs['push_master_secret']);

        $video = \think\Db::table('videos')->where('id',$video_id)->field('name,channel_id')->find();
        $channel = \think\Db::table('channels')->where('id',$video['channel_id'])->field('name')->find();

        $users[] = '191e35f7e01136ae714';
        //别名推送方法
        $user_lists = \think\Db::table('user_focus_channels')->where('channel_id',$video['channel_id'])->select();

        foreach ($user_lists as $list) {
            $user = \think\Db::table('users')->where('id',$list['user_id'])->find('device_token');
            if(!empty($user['device_token'])) {
                $users[] = $user['device_token'];
            }
        }

        $data = $pushmodel->push()
            ->setPlatform('ios')
            ->addRegistrationId($users)
            ->message('视频更新：' . $video['name'] . ' >>', [
                'title' => '特别关注 ' . $channel['name'],
                'content_type' => 'text',
            ])
            ->send();

        return $data;
    }

}
