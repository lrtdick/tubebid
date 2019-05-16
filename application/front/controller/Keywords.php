<?php

namespace app\admin\controller;

use app\admin\model\UserViewHistoriesModel;
use app\api\model\NewreplyModel;
use app\common\Result;
use think\Config;
use think\Db;
use think\Request;
use think\Validate;
use app\admin\model\VideoModel;
use app\common\ConstCode;

class Keywords extends Admin
{
    //TODO 关键词管理

    /**
     * 关键词列表
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index(){
        $keyWords_list = Db::table("key_words")->order('sort desc,id desc')->paginate(20);
        $control_list = Db::table('control_cms')->where('control_type',ConstCode::CONTROL_ACTIVITY_TRANSVERSE_ADVERTISING_SLIDING)->select();
        $this->assign('lists',$keyWords_list);
        $this->assign('control_list',$control_list);
        return $this->fetch();
    }

    /**
     * 添加关键词表单提交
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function addKeyWordsPost(Request $request){
        $post_data = $request->post();
        //return $post_data;
        $validate = new Validate([
            'name| 名称' => 'require',
            'sort| 排序' => 'require',
            'desc| 描述' => 'require',
            'poster| 封面图片' => 'require',
        ]);
        if (!$validate->check($post_data)) {
            return error($validate->getError());
        }
        $res = Db::table('key_words')->where('name',$post_data['name'])->find();
        if($res){
            return error('数据已存在');
        }
        Db::table("key_words")->insert($post_data);
        writeAdminLog(session('VideoAdmin.name'),' 添加关键词 ' . $post_data['name']); //后台管理日志
        return success('关键词添加成功！');
    }

    /**
     * 编辑关键词数据
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function editKeyWords(Request $request){
        $validate = new Validate([
            'id| ID' => 'require',
        ]);
        $post_data = $request->post();
        if (!$validate->check($post_data)) {
            return error($validate->getError());
        }

        $info = Db::table("key_words")->where('id',$post_data['id'])->find();
        return success('编辑分类！',$info);
    }


    /**
     * 编辑关键词表单提交
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function editKeyWordsPost(Request $request){
        $post_data = $request->post();
        //return Result::getResultSuccess($post_data);
        $validate = new Validate([
            'id| ID' => 'require',
            'name| 名称' => 'require',
            'sort| 排序' => 'require',
            'desc| 简介' => 'require',
            'poster| 封面图' => 'require',
            'content| 描述' => 'require',
        ]);

        if (!$validate->check($post_data)) {
            return error($validate->getError());
        }
        $res = Db::table('key_words')->where('id','<>',$post_data['id'])->where('name',$post_data['name'])->find();
        if($res){
            return error('数据已存在');
        }
        $data = [
            'name' => $post_data['name'],
            'sort' => $post_data['sort'],
            'desc' => $post_data['desc'],
            'content' => $post_data['content'],
            'status' => $post_data['status'],
            'poster' => $post_data['poster']
        ];
        Db::table('key_words')->where('id',$post_data['id'])->update($data);
        writeAdminLog(session('VideoAdmin.name'),' 编辑关键词 ' . $post_data['name']); //后台管理日志
        return success('成功编辑关键词！');
    }
}
