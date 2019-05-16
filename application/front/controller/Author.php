<?php

namespace app\admin\controller;
use app\admin\model\AuthorModel;
use think\Request;
use think\Config;
use think\Db;
use think\Validate;
use app\common\ConstCode;

class Author extends Admin
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //标题搜索
        $name = input('name');
        if(!empty($name)) {
            $where['name'] = ['like',"%$name%"];
        }

        $is_show = input('is_show');
        if(!empty($is_show)) {
            $where['is_show'] = $is_show;
        }

        $where['id'] = ['>',0];
        $where['user_type'] = ConstCode::USER_TYPE_FICT;

//        $lists = Db::table('users')
//            ->where($where)
//            ->order('id desc')
//            ->paginate(20,false,[
//                'query'     => [
//                    'name' => $name,
//                    'status' => $is_show
//                ],
//            ]);
        $lists=AuthorModel::getDatesByWhere($where);
        $experts = $lists->toArray();

        $page = $lists->render();
        $total = $lists->total();

        return view('index',['lists' => $experts['data'],'page' => $page,'total' => $total]);
    }

    /**
     * 添加作者
     * @return \think\response\View
     */
    public function add()
    {
        return view('add');
    }

    /**
     * 作者添加提交
     * @return \think\response\Json
     */
    public function addPost(Request $request)
    {
        $request_data = $request->post();
        $validate = new Validate([
            'name| 名字' => 'require',
            'desc| 简介' => 'require',
            'file_url| 头像' => 'require',
        ]);
        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        $info = Db::table('users')
            ->where('name', $request_data['name'])
            ->find();
        if(!empty($info)) {
            return error('作者名字重复');
        }

        if(empty($request_data['cover_url'])){
            $poster = config('coverUrl');
        }else{
            $poster = $request_data['cover_url'];
        }
        $data = [
            'name' => $request_data['name'],
            'signature' => $request_data['desc'],//个性化签名 描述
            'avatar' => $request_data['file_url'],
            'gender' => $request_data['gender'],
            'poster' => $poster,
            'user_type' =>ConstCode::USER_TYPE_FICT
        ];
        Db::table('users')->insert($data);
        writeAdminLog(session('VideoAdmin.name'),' 新增作者 ' . $request_data['name']); //后台管理日志
        return success('添加成功！');
    }

    /**
     * 编辑作者
     * @param $id
     * @return \think\response\View
     */
    public function edit($id)
    {
        $info = Db::table('users')->where('id',$id)->find();
        return view('edit',['info' => $info]);
    }

    /**
     * 提交编辑资料
     * @return \think\response\Json
     */
    public function editPost(Request $request)
    {
        $request_data = $request->post();
        $validate = new Validate([
            'name| 名字' => 'require',
            'desc| 简介' => 'require',
            'file_url| 头像' => 'require',
        ]);
        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }
        $data = [
            'name' => $request_data['name'],
            'signature' => $request_data['desc'],
            'avatar' => $request_data['file_url'],
            'poster' => $request_data['cover_url'],
            'status' => $request_data['status'],
            'update_time' => date('Y-m-d H:i:s',time()),
        ];
        Db::table('users')->where('id',$request_data['id'])->update($data);

        writeAdminLog(session('VideoAdmin.name'),' 编辑作者 ' . $request_data['name']); //后台管理日志
        return success('编辑成功！');
    }

    public function delete()
    {
        $id = input('id');
        $ids = input('ids');
        //作者是虚拟用户 user_type==0
        $where['user_type']=ConstCode::USER_TYPE_FICT;
        // 批量删除
        if(empty($ids)) {
            $where=['id',$id];
            AuthorModel::logicDelete($where);
        }else{
            $ids = explode(',',$ids);
            foreach ($ids as $id) {
                $where=['id',$id];
                AuthorModel::logicDelete($where);
            }
        }
        writeAdminLog(session('VideoAdmin.name'),' 设置作者ID：' . $id.'为删除状态'); //后台管理日志
        return success('删除成功，如需恢复请联系程序员');
    }
}
