<?php

namespace app\admin\controller;
use think\Config;
use think\Exception;
use think\Db;
use think\Validate;
use think\Request;
use app\common\ConstCode;
class User extends Admin
{
    /**
     * 显示用户列表
     *
     * @return \think\Response
     */
    public function index()
    {

        //用户名搜索
        $title = input('title');
        if(!empty($title)) {
            $where['name'] = ['like',"%$title%"];
        }

        $where['id'] = ['>',0];
        $where['user_type'] = ConstCode::USER_TYPE_REAL;
        $where['status'] = ['gt',-1];
        $lists = Db::table('users')
            ->where($where)
            ->order('id desc')
            ->paginate(20,false,[
                'query'     => [
                    'title' => $title
                ],
            ]);

        $users = $lists->toArray();

        $page = $lists->render();
        $total = $lists->total();

        return view('index',['lists' => $users['data'],'page' => $page,'total' => $total]);
    }

    /**
     * 添加页面
     * @return \think\response\View
     */
    public function add()
    {
        $time = date('Y-m-d',time());
        return view('add',['time' => $time]);
    }

    /**
     * 页面表单提交
     */
    public function addPost()
    {
        $validate = new Validate([
            'name| 名字' => 'require',
        ]);
        $request_data = input();

        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }

        try {
            $data = [
                'birthday' => $request_data['birthday'],
                'fake_password' => md5($request_data['password']),
                'fake_pwd_text' => $request_data['password'],
                'gender' => $request_data['gender'],
                'name' => $request_data['name'],
                'mobile' => $request_data['mobile'],
                'avatar' => $request_data['file_url'],
                'is_fake' => 1,
                'created_at' => date('Y-m-d H:i:s',time()),
                'updated_at' => date('Y-m-d H:i:s',time()),
            ];
            Db::table('users')->insert($data);
            writeAdminLog(session('VideoAdmin.name'),' 新增用户 ' . $request_data['name']); //后台管理日志
            return success('添加成功！');
        } catch(Exception $e) {
            return error('添加失败，请确认手机号不重复！');
        }
    }

    /**
     * 编辑页面
     * @param $id
     * @return \think\response\View
     */
    public function edit($id)
    {
        $info = Db::table('users')->where('id',$id)->find();

        return view('edit',['info' => $info]);
    }

    /**
     * 编辑数据提交
     */
    public function editPost()
    {
        $validate = new Validate([
            'name| 名字' => 'require',
        ]);
        $request_data = input();

        if (!$validate->check($request_data)) {
            return error($validate->getError());
        }
        $info = \think\Db::table('users')->where('id',$request_data['id'])->find();

        $data = [
            'birthday' => $request_data['birthday'],
            'gender' => $request_data['gender'],
            'name' => $request_data['name'],
            'mobile' => $request_data['mobile'],
            'avatar' => $request_data['file_url'],
            'created_at' => date('Y-m-d H:i:s',time()),
            'updated_at' => date('Y-m-d H:i:s',time()),
        ];
        if($info['is_fake'] == 1) {
            $data['fake_pwd_text'] = $request_data['password'];
            $data['fake_password'] = md5($request_data['password']);
        }
        Db::table('users')->where('id',$request_data['id'])->update($data);

        writeAdminLog(session('VideoAdmin.name'),' 编辑用户 ' . $request_data['name']); //后台管理日志
        return success('编辑成功！');
    }

    /**
     * 用户的历史记录
     * @param $id
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function history($id)
    {
        $where['user_id'] = $id;
        $where['status'] = ['gt',-1];
        $lists = Db::table('user_histories')->where($where)->paginate(20);
        $histories = $lists->toArray();
        foreach ($histories['data'] as &$value){
            $info = Db::table('videos')->where('id',$value['video_id'])->find();
            $value['url'] = $info['poster'];
            $value['title'] = $info['name'];
            $value['read'] = $info['played_count'];
            if(empty($value['update_time'])){
                $value['last_visit_time'] = $value['create_time'];
            }else{
                $value['last_visit_time'] = $value['update_time'];
            }
        }
        unset($value);
        $page = $lists->render();
        $total = $lists->total();

        return view('history',['lists' => $histories['data'],'page' => $page,'total' => $total]);
    }

    /**
     * 用户的收藏
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function collection($id)
    {

        $where['user_id'] = $id;
        $where['status'] = ['gt',-1];

        $lists = Db::table('user_favorite_videos')->where($where)->paginate(20);
        $favorite = $lists->toArray();
        foreach ($favorite['data'] as &$value){ //注意地址指针
            $info = Db::table('videos')->where('id',$value['video_id'])->find();
            if($info && $info['status']>0){

            }
            $value['image'] = $info['poster'];
            $value['title'] = $info['name'];
            $value['share'] = $info['shares_count'];
            $value['play'] = $info['played_count'];
        }
        unset($value); // 使用地址指针来赋值 为了省资源?

        $page = $lists->render();
        $total = $lists->total();

        return view('collection',['lists' => $favorite['data'],'page' => $page,'total' => $total]);
    }

    /**
     * 上传头像
     */
    public function uploadFile()
    {
        $file = request()->file('file');
        if (empty($file)) {
            return "图片错误！";
        } else {
            $info = $file->getInfo();
            if ($info) {
                $object = 'userAvatar/' . $info['name'];
                $pictureName = getOssUrl($info['tmp_name'],$object,'userAvatar',2);
            } else {
                echo $file->getError();
            }
        }
        return success('上传成功',['url' => "https://".Config::get('OSS.OSS_URL').'/'.$pictureName]);
    }

    /**
     * 删除
     */
    public function deleted()
    {
        $type = input('type');
        $id = input('id');

        switch ($type) {
            case 'user': //用户
                Db::table('users')
                    ->where('id',$id)
                    ->setField('status',-1);
                writeAdminLog(session('VideoAdmin.name'),' 设置用户ID：' . $id.'为删除状态'); //后台管理日志
                break;
            case 'history': //用户历史记录
                Db::table('user_histories')
                    ->where('id',$id)
                    ->setField('status',-1);
                writeAdminLog(session('VideoAdmin.name'),' 设置用户历史记录ID：' . $id.'为删除状态'); //后台管理日志
                break;
            case 'collection': //用户收藏记录
                Db::table('user_favorite_videos')
                    ->where('id',$id)
                    ->setField('status',-1);
                writeAdminLog(session('VideoAdmin.name'),' 删除用户收藏记录ID：' . $id.'为删除状态'); //后台管理日志
                break;

        }
        return success('成功删除');
    }
}
