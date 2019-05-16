<?php

namespace app\admin\controller;

use app\admin\model\AuthorModel;
use app\admin\model\CommentsModel;
use app\admin\model\ControlModel;
use app\common\Result;
use app\common\Util;
use think\Config;
use think\Request;
use think\Validate;
use app\admin\model\VideoModel;
use app\admin\job\Common;
use think\Db;
use app\common\ConstCode;
use app\api\model\KeyWordsModel;

class Comments extends Admin
{

    public function insertComments(){

        $comments_contents=txtToComment();
        $video_id=156;
        $is_reported=1;
        $status=1;
//        dump($comments_contents);
//        EXIT();
        Db::startTrans();
        foreach($comments_contents as $K=>$content){
            $user_id=random_int(11,20)*1000+random_int(0,999);
            $like_num=random_int(20,100);
            $ctime=date('Y-m-d H:i:s',(time()-(random_int(1,30)*84600)+random_int(0,3600*8)));//一天是86400s 1小时是360
            $data=[
                'video_id'=>$video_id,'user_id'=>$user_id,'content'=>$content, 'like_num'=>$like_num, 'is_reported'=>$is_reported, 'status'=>$status,'created_at'=>$ctime//一天是86400s 1小时是3600
            ];
            $sql = "INSERT user_comments1(video_id,user_id,content,like_num,is_reported,status,created_at) values(:video_id,:user_id,:content,:like_num,:is_reported,:status,:created_ta);";
            $result = Db::table('user_comments1')->insert($data);
            if(!$result){
                Db::rollback();
            }
        }
        Db::commit();
        echo '完成'.$video_id.$content;
    }


    /**
     * 视频评论 与 视频相关
     * @param Request $request
     * @return \think\response\View
     * @throws \think\exception\DbException
     */
    public function index(Request $request)
    {
        $list=new CommentsModel();
        $listColumnInfo=$list->getColumnInfo();
        foreach($listColumnInfo AS $col){
            $columnList['Field'][]=$col["Field"];
            $columnList['Type'][]=$col["Type"];
            $columnList['Collation'][]=$col["Collation"];
            $columnList['Null'][]=$col["NO"];
            $columnList['Key'][]=$col["Key"];
            $columnList['Default'][]=$col["Default"];
            $columnList['Extra'][]=$col["Extra"];
            $columnList['Privileges'][]=$col["Privileges"];
            $columnList['Comment'][]=$col["Comment"];

//            dump($col);

        };

        $video_id = $request->param('id');
        $where['is_show'] = ConstCode::STATUS_SHOW;
        $where['video_id'] = $video_id;
        $lists = Db::table('user_comments')
            ->where($where)
            ->order('updated_at desc')
            ->paginate(6)->each(function ($item, $key) {
                $video = Db::table('videos')
                    ->where('id', $item['video_id'])
                    ->field('name')
                    ->find();

                $user = Db::table('users')
                    ->where('id', $item['user_id'])
                    ->field('name,avatar')
                    ->find();

                $item['video_name'] = $video['name'];
                $item['user_name'] = $user['name'];
                $item['user_avatar'] = $user['avatar'];
                $item['replies_count'] = Db::table('user_replies')
                    ->where('comment_id', $item['id'])
                    ->where('is_show', ConstCode::STATUS_SHOW)
                    ->where('reply_user_id', 0)
                    ->count();

                $item['lists'] = Db::table('user_replies')
                    ->where('comment_id', $item['id'])
                    ->where('is_show', ConstCode::STATUS_SHOW)
                    ->where('reply_user_id', 0)
                    ->select();

                foreach ($item['lists'] as &$list) {
                    $info = Db::table('users')
                        ->where('id', $list['user_id'])
                        ->field('name,avatar')
                        ->find();
                    $list['user_name'] = $info['name'];
                    $list['user_avatar'] = $info['avatar'];
                    $list['replies_count'] = Db::table('user_replies')
                        ->where('is_show', ConstCode::STATUS_SHOW)
                        ->where('reply_user_id', $list['user_id'])
                        ->where('comment_id', $list['comment_id'])
                        ->count();
                    $list['replies_lists'] = Db::table('user_replies')
                        ->where('reply_user_id', $list['user_id'])
                        ->where('comment_id', $list['comment_id'])
                        ->where('is_show', ConstCode::STATUS_SHOW)
                        ->select();

                    foreach ($list['replies_lists'] as &$replies_list) {
                        $user_info = Db::table('users')
                            ->where('id', $replies_list['user_id'])
                            ->field('name,avatar')
                            ->find();
                        $replies_list['user_name'] = $user_info['name'];
                        $replies_list['user_avatar'] = $user_info['avatar'];
                    }

                }

                return $item;
            });
        //print_r($lists);die;
//        dd($video_id);
        return view('index', compact('lists'));
    }






    /**
     * 视频评论 与 视频相关
     * @param Request $request
     * @return \think\response\View
     * @throws \think\exception\DbException
     */
    public function comment(Request $request)
    {
        $video_id = $request->param('id');
        $where['is_show'] = ConstCode::STATUS_SHOW;
        $where['video_id'] = $video_id;
        $lists = Db::table('user_comments')
            ->where($where)
            ->order('updated_at desc')
            ->paginate(6)->each(function ($item, $key) {
                $video = Db::table('videos')
                    ->where('id', $item['video_id'])
                    ->field('name')
                    ->find();

                $user = Db::table('users')
                    ->where('id', $item['user_id'])
                    ->field('name,avatar')
                    ->find();

                $item['video_name'] = $video['name'];
                $item['user_name'] = $user['name'];
                $item['user_avatar'] = $user['avatar'];
                $item['replies_count'] = Db::table('user_replies')
                    ->where('comment_id', $item['id'])
                    ->where('is_show', ConstCode::STATUS_SHOW)
                    ->where('reply_user_id', 0)
                    ->count();

                $item['lists'] = Db::table('user_replies')
                    ->where('comment_id', $item['id'])
                    ->where('is_show', ConstCode::STATUS_SHOW)
                    ->where('reply_user_id', 0)
                    ->select();

                foreach ($item['lists'] as &$list) {
                    $info = Db::table('users')
                        ->where('id', $list['user_id'])
                        ->field('name,avatar')
                        ->find();
                    $list['user_name'] = $info['name'];
                    $list['user_avatar'] = $info['avatar'];
                    $list['replies_count'] = Db::table('user_replies')
                        ->where('is_show', ConstCode::STATUS_SHOW)
                        ->where('reply_user_id', $list['user_id'])
                        ->where('comment_id', $list['comment_id'])
                        ->count();
                    $list['replies_lists'] = Db::table('user_replies')
                        ->where('reply_user_id', $list['user_id'])
                        ->where('comment_id', $list['comment_id'])
                        ->where('is_show', ConstCode::STATUS_SHOW)
                        ->select();

                    foreach ($list['replies_lists'] as &$replies_list) {
                        $user_info = Db::table('users')
                            ->where('id', $replies_list['user_id'])
                            ->field('name,avatar')
                            ->find();
                        $replies_list['user_name'] = $user_info['name'];
                        $replies_list['user_avatar'] = $user_info['avatar'];
                    }

                }

                return $item;
            });
        //print_r($lists);die;
//        dd($video_id);
        return view('comment', compact('lists'));
    }

    /**
     * 删除评论
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function comment_delete(Request $request)
    {
        $id = $request->param('id');
        $result = Db::table('user_comments')->where('id', $id)->update(['is_show' => ConstCode::STATUS_HIDE]);
        if ($result) {
            return success('删除成功');
        }
        return error('删除失败');
    }

    /**
     * 删除评论回复
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function replies_delete(Request $request)
    {
        $id = $request->param('id');
        $result = Db::table('user_replies')->where('id', $id)->update(['is_show' => ConstCode::STATUS_HIDE]);
        if ($result) {
            return success('删除成功');
        }
        return error('删除失败');
    }

    /**
     * 添加评论点赞数
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function comment_zan(Request $request)
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
        $info = \think\Db::table('user_comments')->where('id', $id)->field('zan')->find();
        $result = \think\Db::table('user_comments')->where('id', $id)->update(['zan' => $info['zan'] + $zan]);
        if ($result) {
            return success('操作成功');
        }
        return error('操作失败');
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
        $info = \think\Db::table('user_replies')->where('id', $id)->field('zan')->find();
        $result = \think\Db::table('user_replies')->where('id', $id)->update(['zan' => $info['zan'] + $zan]);
        if ($result) {
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
        $push_config = ['push_app_key', 'push_master_secret'];
        foreach ($push_config as $config) {
            $item = \think\Db::table('system')->where(['key' => $config])->field('value')->find();
            $configs[$config] = $item['value'];
        }

        $pushmodel = new \JPush\Client($configs['push_app_key'], $configs['push_master_secret']);

        $video = \think\Db::table('videos')->where('id', $video_id)->field('name,channel_id')->find();
        $channel = \think\Db::table('channels')->where('id', $video['channel_id'])->field('name')->find();

        $users[] = '191e35f7e01136ae714';
        //别名推送方法
        $user_lists = \think\Db::table('user_focus_channels')->where('channel_id', $video['channel_id'])->select();

        foreach ($user_lists as $list) {
            $user = \think\Db::table('users')->where('id', $list['user_id'])->find('device_token');
            if (!empty($user['device_token'])) {
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
