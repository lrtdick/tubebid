<?php

namespace app\admin\controller;

use app\admin\model\ArticlesModel;
use app\admin\model\AuthorModel;
use app\admin\model\CommentsModel;
use app\admin\model\ControlModel;
use app\admin\model\PicturesModel;
use app\admin\model\TagsModel;
use app\common\Result;
use app\common\Util;
use think\Config;
use think\Request;
use think\Db;
use think\Validate;
use app\admin\model\VideoModel;
use app\common\ConstCode;
use app\admin\model\KeywordsModel;

class Markdown extends Admin
{
    public function index($where)
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


        //作者搜索
        if(!empty(input('channel_id'))) {
            $where['channel_id'] = input('channel_id');
        }

        //标签搜索
        if(!empty(input('tag'))) {
            $tag = input('tag');
            $where['tag_list'] = ['like',"%"."\"".$tag."\""."%"];
        }
        $where['id'] = ['>',0];
        //分类
        $cate_list = Db::table('video_categories')
            ->where('status', ConstCode::STATUS_SHOW)
            ->field('id,name')
            ->order('id desc')
            ->select();

        //作者列表
        $channel_list = AuthorModel::
        //->where('user_type',ConstCode::USER_TYPE_FICT)
        field('id,name')
            ->order('id desc')
            ->select();

        //标签
        $tag_list = Db::table("tags")
            ->where('status', ConstCode::STATUS_SHOW)
            ->field('id,name')
            ->order('id desc')
            ->select();

        $lists = PicturesModel::where($where)
            ->order('published_at desc,id desc')
            ->paginate(10);

        $videos = $lists->toArray();

        foreach ($videos['data'] as &$video) {
            $video['cate_name'] = '分类';
            $video['channel_name'] = '频道';
            //分类
            $cate = \think\Db::table('video_categories')
                ->where('id', $video['cate_id'])
                ->field('name')
                ->find();
            $video['cate_name'] = $cate['name'];

            //作者
            if (!empty($video['channel_id'])) {
                $cate = AuthorModel::where('id', $video['channel_id'])
                    ->field('name')
                    ->find();
                $video['channel_name'] = $cate['name'];
            }

            //单一控件
            if (!empty($video['control_id'])) {
                $cate = ControlModel::where('id', $video['control_id'])
                    ->field('control_name')
                    ->find();
                $video['control_name'] = $cate['control_name'];
            }

            //标签
            $tags = explode(',', $video['tag_list']);
            $video['tag_lists'] = $tags;
        }
        unset($course);

        $page = $lists->render();
        $total = $lists->total();
        $data = [];

        foreach ($videos['data'] as $v) {
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
                'shares_count' => $v['shares_count'],
                'played_count' => $v['played_count'],
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
                'control_name' => $v['control_name'],
                'control_id' => $v['control_id'],
                'fabulou_count' => $v['fabulou_count'],
                'commentsNum' => count(KeyWordsModel::getShenPingByVideoId($v['id'])['commentList'])
            ];
        }

        $viewData = [
            'type' => $where['type'],
            'lists' => $data,
            'cates' => $cate_list,
            'channels' => $channel_list,
            'tag_list' => $tag_list,
            'page' => $page,
            'total' => $total
        ];
//        dd($viewData);
        $this->assign($viewData);

    }

    public function articles()
    {
        $where['type'] = ConstCode::VIDEO_TYPE_ARTICLE;

        $this->index($where);
        return $this->fetch('index');
    }

    public function pictures()
    {

        $where['type'] = ConstCode::VIDEO_TYPE_PICTURE;
        $this->index($where);
        return $this->fetch('index');

    }

    /**
     * 添加图集
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add()
    {
        //分类
        $cate = Db::table('video_categories')
            ->where('status', ConstCode::STATUS_SHOW)
            ->order('id desc')
            ->select();


        //作者
        $channel = AuthorModel::where('user_type', ConstCode::USER_TYPE_FICT)
            ->order('id desc')
            ->select();//作者

        //控件列表
        $control_list = ControlModel::where('status', ConstCode::STATUS_SHOW)
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

        return view('add', [
            'cates' => $cate,
            'channels' => $channel,
            'control_list' => $control_list,
            'tags' => $tag,
            'keywords_list' => $keywords_list,
        ]);

    }

    /**
     * 图集添加提交
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function addPost(Request $request)
    {

        $validate = new Validate([
            'name| 标题' => 'require',
            'desc| 描述' => 'require',
            'imageInfo| 图集' => 'require',
            'tag| 标签' => 'require',
            'keywords_ids| 关键字' => 'require',
            'channel_id| 所属作者' => 'require',
        ]);
        $request_data = $request->post();
        /**
         * 验证
         */
        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        /**
         * 封面信息
         */
        $image_info = Util::fromJson($request_data['imageInfo']);
        if ($request_data['poster']) {
            $poster = $request_data['poster'];
        } else {
            $poster = $image_info[1]['imageUrl'];
        }

        /**
         * 存储数据库 单一存储
         */
        $data = [
            'channel_id' => $request_data['channel_id'],
            'control_id' => $request_data['control_id'] ? $request_data['control_id'] : 0,
            'is_advertising' => $request_data['is_advertising'],
            'name' => $request_data['name'],
            'desc' => $request_data['desc'],
            'played_count' => Util::getRand($request_data['played_count']),
            'sort_by' => $request_data['sort_by'],
            'is_top' => $request_data['is_top'],
            'status' => 1,
            'poster' => $poster,
            'image_url' => $request_data['imageInfo'],
            'published_at' => date('Y-m-d H:i:s', time()),
            'tag_list' => Util::toJson($request_data['tag']),
            'fabulou_count' => Util::getRand(0),
            'type' => $request_data['type'],
            'image_text_json' => $request_data['imageInfo'],//保存图文数组json 使用时先解码
            'update_time' => date('Y-m-d H:i:s', time()),

        ];
        $video_id = Db::table('videos')->insertGetId($data);

        /**
         * 资源映射关系
         * 传入 资源id 映射数组ids
         * 查询映射表中的关系 没有的就添加
         * 再按照新的ids打开或关闭关系
         */
        PicturesModel::updateVideoTags($video_id, $request_data['tag']);
        PicturesModel::updateVideoKeywords($video_id, $request_data['keywords_ids']);

        writeAdminLog(session('VideoAdmin.name'), ' 添加图集 ' . $request_data['name']); //后台管理日志
        //$this->push_message($video_id); //新增图集触发极光推送
        return success('添加成功！');
    }

    /**
     * 编辑图文
     * @param $id
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit($id)
    {

        $info = PicturesModel::where('id', $id)->find();

        if($info['type']==2){
            $info['image_url'] = Util::fromJson($info['image_url']);
        }elseif($info['type']==3)
        {
            $info['image_url'] = Util::fromJson($info['image_text_json']);
        }

        $info['date'] = date('Y-m-d', strtotime($info['published_at']));
        $info['time'] = date('H:i:s', strtotime($info['published_at']));

        /**
         * 获取本身keywords和tags信息
         */
        //keywords 关键字的 对应video关系 resourcesMappings
        $keywordsInfo = collection(KeywordsModel::hasWhere('resourcesMappings', ['status' => 1, 'resource_id' => $id])->select());
        $keywords_list = [];
        foreach ($keywordsInfo as $item) {
            $keywords_list[] = $item['id'];
        }
        $info['keywords_list'] = json_encode($keywords_list);

        //keywords 关键字的 对应video关系 resourcesMappings
        $TagsInfo = collection(TagsModel::hasWhere('resourcesMappings', ['status' => 1, 'resource_id' => $id])->select());
        $tag_list = [];
        foreach ($TagsInfo as $item) {
            $tag_list[] = $item['id'];
        }
        $info['tag_list'] = json_encode($tag_list);

        //作者
        $channel = Db::table('users')
            ->where('user_type', ConstCode::USER_TYPE_FICT)
            ->order('id desc')
            ->select();

        //控件列表
        $control_list = ControlModel::where('status', ConstCode::STATUS_SHOW)
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

        return view('edit', [
            'info' => $info,
            'channels' => $channel,
            'control_list' => $control_list,
            'tags' => $tag,
            'keywords_list' => $keywords_list

        ]);

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
         * 验证
         */
        $request_data = $request->post();
        $validate = new Validate([
            'name| 标题' => 'require',
            'desc| 描述' => 'require',
            'imageInfo| 图集' => 'require',
            'tag| 标签' => 'require',
            'type| 资源类型' => 'require',
            'keywords_ids| 关键字' => 'require',
            'channel_id| 所属作者' => 'require',
        ]);
        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        /**
         * 封面
         */
        $image_info = Util::fromJson($request_data['imageInfo']);
        if ($request_data['poster']) {
            $poster = $request_data['poster'];
        } else {
            $poster = $image_info[0]['imageUrl'];
        }

        /**
         * 存储信息
         */
        $data = [
            'channel_id' => $request_data['channel_id'],
            'control_id' => $request_data['control_id'] ? $request_data['control_id'] : 0,
            'is_advertising' => $request_data['is_advertising'],
            'name' => $request_data['name'],
            'desc' => $request_data['desc'],
            'played_count' => $request_data['played_count'],
            'sort_by' => $request_data['sort_by'],
            'is_top' => $request_data['is_top'],
            'status' => $request_data['status'],
            'poster' => $poster,
            'type' => $request_data['type'],
            'image_url' => $request_data['imageInfo'],//以前保存图集或者图文的全文本的字段以后可能没用了
            'image_text_json' => $request_data['imageInfo'],//保存图文数组json 使用时先解码
            'update_time' => date('Y-m-d H:i:s', time()),
            'tag_list' => Util::toJson($request_data['tag']),
        ];

        Db::table('videos')->where('id', $request_data['id'])->update($data);
        /**
         * 资源映射关系
         * 传入 资源id 映射数组ids
         * 查询映射表中的关系 没有的就添加
         * 再按照新的ids打开或关闭关系
         */
        PicturesModel::updateVideoTags($request_data['id'], $request_data['tag']);
        PicturesModel::updateVideoKeywords($request_data['id'], $request_data['keywords_ids']);
        writeAdminLog(session('VideoAdmin.name'), ' 编辑图集 ' . $request_data['name']); //后台管理日志
        return success('编辑成功！');
    }

}
