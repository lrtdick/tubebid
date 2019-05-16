<?php

namespace app\admin\controller;

use app\admin\model\ResourcesModel;
use app\common\Result;
use app\common\Util;
use app\common\ConstCode;
use think\Request;
use think\Validate;
use think\Db;
use app\admin\model\SystemModel;
class System extends Admin
{
    /**
     * 前端页面布局设置
     * @param Request $request
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function front(){
        //页面分类
        $page_list = Db::table("page_cate")->select();
        //控件分类
        $control_type = Db::table("control_type")->select();
//        关键词
        $keyWords = Db::table("key_words")->where(['is_rel'=>ConstCode::IS_REL_NO,'status'=>1])->select();


        $this->assign('page_list',$page_list);
        $this->assign("control_type",$control_type);
        $this->assign('key_words',$keyWords);
        return $this->fetch();
    }

    /**
     * 控件添加提交
     * @param Request $request
     * @return false|string
     */

    public function addControlPost(Request $request){
        $post_data = $request->post();
        $validate = new Validate([
            'page_id| 页面ID' => 'require',
            'control_name| 组件名' => 'require',
            'control_type| 类型' => 'require',
            'sort| 排序' => 'require',
            'control_desc| 标题描述' => 'require',
        ]);
        if (!$validate->check($post_data)) {
            return error($validate->getError());
        }
        $data = [
            'page_id' =>$post_data['page_id'],
            'control_name' => $post_data['control_name'],
            'control_type' => $post_data['control_type'],
            'sort' => $post_data['sort'],
            'control_desc' => $post_data['control_desc'],
            'key_words' => $post_data['keyWords'] ? $post_data['keyWords']:null,
            'advertising_id' => $post_data['advertising_id'] ? $post_data['advertising_id'] :null,
            'data_role_id' => $post_data['data_role_id'] ?$post_data['data_role_id']:null,
            'data_count' => $post_data['data_count'] ?$post_data['data_count']:null,
            'is_fixed' => $post_data['is_fixed']
        ];
        Db::startTrans();
        try{
            $controle_id = Db::table("control_cms")->insertGetId($data);
            if($data['key_words']){
                Db::table("key_words")->where('id',$data['key_words'])->update(['is_rel'=>ConstCode::IS_REL_YES,'control_id'=>$controle_id]);
            }
            // 提交事务
            Db::commit();
            writeAdminLog(session('VideoAdmin.name'),' 添加控件 ' . $data['control_name'] . ' 类型: '.SystemModel::getControlTypeByTypeId($data['control_type'])['type_name'] . ' 位置: '.SystemModel::getPageNameById($data['page_id'])['page_name']); //后台管理日志
            return success('添加完成');
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return error('添加失败');
        }
    }

    /**
     * 编辑组件信息提交
     * @param Request $request
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function editControlPost(Request $request){
        $post_data = $request->post();
        $validate = new Validate([
            'control_name| 组件名' => 'require',
            'control_type| 类型' => 'require',
            'control_desc| 标题描述' => 'require',
        ]);
        if (!$validate->check($post_data)) {
            return error($validate->getError());
        }

        $data = [
            'id' => Util::toNumber($post_data['control_id']),
            'control_type' => Util::toNumber($post_data['control_type']),
            'control_name' => $post_data['control_name'],
            'control_desc' => $post_data['control_desc'],
            'key_words' => $post_data['keyWords'] ?$post_data['keyWords']:NULL,
            'advertising_id' => $post_data['advertising_id'] ? $post_data['advertising_id']:null,
            'data_role_id' => $post_data['data_role_id'] ?$post_data['data_role_id'] : null,
            'data_count' => $post_data['data_count'] ? $post_data['data_count']: null,
            'status' => $post_data['status'],
            'sort' => Util::toNumber($post_data['sort'])
        ];
        $res = Db::table("control_cms")->where('id',$post_data['control_id'])->find();
        if($res){
            $re = Db::table("control_cms")->update($data);
            if($re){
                writeAdminLog(session('VideoAdmin.name'),' 编辑组件信息 name:' . $data['control_name'] .' type:'.SystemModel::getControlTypeByTypeId($data['control_type'])['type_name'] .' 排序：'.$data['sort']); //后台管理日志

                return success("保存完成");
            }else{
                return error('保存失败');
            }
        }else{
            return error('组件不存在');
        }
    }

    public function controlDel(Request $request){
        $post_data = $request->post();
        $validate = new Validate([
            'id| 组件ID' => 'require',
        ]);
        if (!$validate->check($post_data)) {
            return error($validate->getError());
        }
        Db::table("control_cms")->where("id",$post_data['id'])->delete();
        return $post_data;
    }

    /**
     * 页面选择下拉框接口
     * @param Request $request
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function pageSelectApi(Request $request){
        $post_data = $request->post();
        $controlList = [];
        if(!empty($post_data['page_id'])){
            $controlInfo = Db::table("control_cms")->order('sort asc')->where('page_id',$post_data['page_id'])->select();
            foreach ($controlInfo as $info){
                $controlList[] = [
                    'id' => $info['id'],
                    'control_type' => $info['control_type'],
                    'exam_img' => SystemModel::getControlTypeByTypeId($info['control_type'])['demo_img']
                ];
            }
            $code = 1;
        }else{
            $code = 404;
        }
        $control_list = [
            'control' => $controlList,
            'code' => $code
        ];
        $this->assign('control_list',$control_list);
        return $this->fetch("front_exmp");
    }


    /**
     * 点击事件接口
     * @param Request $request
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function controlClickApi(Request $request){

        $post_data = $request->post();

        //控件属性信息
        $control_info = SystemModel::getControlInfoById($post_data['control_id']);
        $control_type = Db::table("control_type")->select();
        $control_info['exam_img'] = $control_type[$control_info['control_type']-1]['demo_img'];

        $keyWords_list = Db::table('key_words')->select();

        $this->assign('keyWords_list',$keyWords_list);

        $this->assign('keywords_id',$post_data['keywords_id']);

        $this->assign("control_type",$control_type);
        $this->assign('control_info',$control_info);

        //内容列表
        //keywords 关键字的 对应video关系 resourcesMappings
        $resourcesInfo = ResourcesModel::hasWhere('keywordsMappings', ['status' => 1,'keywords_id'=>$post_data['keywords_id']])
            ->where(['control_id'=>$post_data['control_id']])
            ->order('sort_by asc,id desc')
            ->select();

        //页面信息
        $pageInfo=SystemModel::getPageNameById($control_info['page_id']);
        $resource_list = [];
        foreach($resourcesInfo as $info){
            $resource_list[] = [
                'id' => $info['id'],
                'image' => $info['poster'],
                'control' => $control_info['control_name'],
                'position' => $pageInfo['page_name'],
//                'position' => SystemModel::getPageNameById(SystemModel::getControlInfoById($info['control_id'])['page_id'])['page_name'],
                'type' => $info['type'],
                'status' =>$info['status'],
                'url' => $info['desc'],
                'sort' => $info['sort_by'],
                'is_advertising' => $info['is_advertising'],
                'ad_url' => $info['ad_url'],
            ];
        }
        $this->assign('banner_list',$resource_list);
        $this->assign('total',count($resource_list));

        //添加用的数据 没有contorl的资源列表 control_id==0
        $NoneControlResourcesInfo = ResourcesModel::hasWhere('keywordsMappings', ['status' => 1,'keywords_id'=>$post_data['keywords_id']])
            ->where(['control_id'=>0])
            ->order('type asc,id desc')
            ->select();



        $this->assign('no_control_resources_list',$NoneControlResourcesInfo);
        $this->assign('no_control_resources_list_total_num',count($NoneControlResourcesInfo));



        if($post_data['control_type'] == ConstCode::CONTROL_ACTIVITY_TRANSVERSE_ADVERTISING_SLIDING){
        }elseif($post_data['control_type'] == ConstCode::CONTROL_ACTIVITY_TEXT_ADVERTISING){

//            $advertisingList = Db::table("advertising_cms")->where('status',ConstCode::STATUS_SHOW)->where("type",ConstCode::ADVERTISING_TYPE_TXT)->select();
            $advertisingList = ResourcesModel::where(['control_id'=>$post_data['control_id']])->select();
            $this->assign('advertisingList',$advertisingList);

        }elseif($post_data['control_type'] == ConstCode::CONTROL_ACTIVITY_PICTURE_ADVERTISING){
//            $advertisingList = Db::table("advertising_cms")->where('status',ConstCode::STATUS_SHOW)->where("type",ConstCode::ADVERTISING_TYPE_IMG)->select();

            $advertisingList = ResourcesModel::where(['control_id'=>$post_data['control_id']])->select();
            $this->assign('advertisingList',$advertisingList);
        }elseif($post_data['control_type'] == ConstCode::CONTROL_ACTIVITY_VERTICAL_SLIDING || $post_data['control_type'] == ConstCode::CONTROL_ACTIVITY_TRANSVERSE_SLIDING || $post_data['control_type'] == ConstCode::CONTROL_ACTIVITY_LIST ){

            //排序规则
            $data_role_list = Db::table("data_role")->select();
            $this->assign('data_role',$data_role_list);

        }elseif($post_data['control_type'] == ConstCode::CONTROL_ACTIVITY_VERTICAL_ADVERTISING_SLIDING){

        }

        return $this->fetch('table_info');

    }


    /**
     * 添加轮播图
     * @return \think\response\Json
     */
    public function addResourcesPost(Request $request)
    {
        $request_data = $request->post();
        $validate = new Validate([
            'sort_by| 排序' => 'require',
            'control_id| 控件id',
            'resource_id| 资源id',
        ]);
        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        if($request_data['ad_url']==''){
            $request_data['is_advertising']=0;
        }

          $data=[
              'ad_url'=>$request_data['ad_url'],
              'is_advertising'=>  $request_data['is_advertising'],
              'sort_by'=>  $request_data['sort_by'],
              'control_id'=>  $request_data['control_id'],
          ];
        ResourcesModel::update($data,['id'=>$request_data['resource_id']]);
        writeAdminLog(session('VideoAdmin.name'),' 添加资源 ' . $request_data['resource_id'].'到控件' .$request_data['control_id']); //后台管理日志
        return Result::getResultSuccess($data);
    }

    /**
     * 隐藏发布快速切换
     */
    public function changeStatus()
    {
        $field = input('field');
        $id = input('id');
        $type = input('type');

//        switch ($type){
//            case 'banner': //轮播图
                $info = ResourcesModel::where(['id'=>$id])
                    ->field("$field")
                    ->find();

                $status = $info[$field] == ConstCode::STATUS_SHOW? ConstCode::STATUS_HIDE : ConstCode::STATUS_SHOW;


//                Db::table('banners')
//                    ->where('id',$id)
//                    ->update(["$field" => "$status"]);

                ResourcesModel::update(['status'=>$status],['id'=>$id],$field);


                writeAdminLog(session('VideoAdmin.name'),' 更改状态：ID：' . $id); //后台管理日志
//                break;
//        }
    }


    /**
     * 移除 只是把control id 归零
     */
    public function remove()
    {
        $id = input('id');
        ResourcesModel::update(['control_id'=>0],['id'=>$id],['control_id']);
        $data=['message'=>'移除成功'];
        return Result::getResultSuccess($data);
    }

    /**
     * 分享设置
     * @param Request $request
     * @return \think\response\View
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function share(Request $request)
    {
        if ($request->isPost()) {
            $validate = new Validate([
                'share_app_url|app下载链接' => 'require',
            ]);
            if (!$validate->check($request->param())) {
                $this->error($validate->getError());
            }

            if(strpos($request->param('share_app_url'), 'http') === false) {
                $this->error('下载地址应包含http:// 或 https://');
            }

            foreach ($request->param() as $key => $value) {
                $item = Db::table('system')->where('key',$key)->find();
                if($item) {
                    Db::table('system')->where('key',$key)->update(['value' => $value]);
                }else{
                    Db::table('system')->insert([
                        'key' => $key,
                        'value' => $value
                    ]);
                }
            }

            return success('设置成功');
        }

        $share_config = ['share_app_url'];
        foreach ($share_config as $config) {
            $item = Db::table('system')->where(['key' => $config])->field('value')->find();
            $configs[$config] = $item['value'];
        }

        return view('share', compact('configs'));
    }

    /***
     * 声明设置
     * @param Request $request
     * @return \think\response\View
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function state(Request $request)
    {
        $type = $request->param('type');
        $type = empty($type) ? 'video' : $type;
        switch ($type){
            case 'video':
                $key = 'state_video';
                $title = '视频功能声明';
                break;
            case 'member':
                $key = 'state_member';
                $title = '用户协议';
                break;
            case 'copyright':
                $key = 'state_copyright';
                $title = '版权声明';
                break;
            case 'privacy':
                $key = 'state_privacy';
                $title = '隐私政策';
                break;
        }

        if ($request->isPost()) {
            $item = Db::table('system')->where('key',$key)->find();
            if($item) {
                Db::table('system')->where('key',$key)->update(['value' => $request->param($key)]);
            }else{
                Db::table('system')->insert([
                    'key' => $key,
                    'value' => $request->param($key)
                ]);
            }
            return success('设置成功');
        }

        $item = Db::table('system')->where(['key' => $key])->field('value')->find();
        $configs = $item['value'];

        return view('state', compact('configs','title'));
    }


    /**
     * 极光推送设置
     * @param Request $request
     * @return \think\response\View
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function push(Request $request)
    {
        if ($request->isPost()) {
            $validate = new Validate([
                'push_app_key|推送key' => 'require',
                'push_master_secret|推送密钥' => 'require',
            ]);
            if (!$validate->check($request->param())) {
                $this->error($validate->getError());
            }

            foreach ($request->param() as $key => $value) {
                $item = Db::table('system')->where('key',$key)->find();
                if($item) {
                    Db::table('system')->where('key',$key)->update(['value' => $value]);
                }else{
                    Db::table('system')->insert([
                        'key' => $key,
                        'value' => $value
                    ]);
                }
            }

            $this->success('设置成功');
        }

        $push_config = ['push_app_key','push_master_secret'];
        foreach ($push_config as $config) {
            $item = Db::table('system')->where(['key' => $config])->field('value')->find();
            $configs[$config] = $item['value'];
        }

        return view('push', compact('configs'));
    }
}
