<?php
/**
 * Created by PhpStorm.
 * User: lizhicheng
 * Date: 2018/4/3
 * Time: 17:57
 */

namespace app\admin\job;

use think\queue\Job;
use think\Log;

class pushMessage {

    /**
     * fire方法是消息队列默认调用的方法
     * @param Job $job
     * @param $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function fire(Job $job,$data){

        // 如有必要,可以根据业务需求和数据库中的最新数据,判断该任务是否仍有必要执行.
        $isJobStillNeedToBeDone = $this->checkDatabaseToSeeIfJobNeedToBeDone($data);
        if(!$isJobStillNeedToBeDone){
            $job->delete();
            return;
        }
        $isJobDone = $this->doKeywordJob($data);

        Log::write(date('Y-m-d H:i:s') .  $isJobDone . " Job status");

        $job_data = json_decode($data,true);
        $video = \think\Db::table('videos')->where('id',$job_data['video_id'])->field('name')->find();

        if ($isJobDone) {
            //如果任务执行成功， 记得删除任务
            $job->delete();
            Log::write(date('Y-m-d H:i:s') .  $video['name'] . " Job has been done and deleted");

        }else{

            if ($job->attempts() > 3) {
                //通过这个方法可以检查这个任务已经重试了几次了
                Log::write(date('Y-m-d H:i:s') .  $video['name'] . " Job has been retried more than 3 times");

                $job->delete();
                // 也可以重新发布这个任务
                //print("<info>Hello Job will be availabe again after 2s."."</info>\n");
                //$job->release(2); //$delay为延迟时间，表示该任务延迟2秒后再执行
            }
        }
    }



    /**
     * 有些消息在到达消费者时,可能已经不再需要执行了
     * @param array|mixed    $data     发布任务时自定义的数据
     * @return boolean                 任务执行的结果
     */
    private function checkDatabaseToSeeIfJobNeedToBeDone($data){
        return true;
    }

    /**
     * 推送消息
     * @param $data
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function doKeywordJob($data) {

        $job_data = json_decode($data,true);

        //实例化极光推送类
        $push_config = ['push_app_key','push_master_secret'];
        foreach ($push_config as $config) {
            $item = \think\Db::table('system')->where(['key' => $config])->field('value')->find();
            $configs[$config] = $item['value'];
        }

        $pushmodel = new \JPush\Client($configs['push_app_key'],$configs['push_master_secret']);

        $video = \think\Db::table('videos')->where('id',$job_data['video_id'])->field('name,channel_id')->find();
        $channel = \think\Db::table('channels')->where('id',$video['channel_id'])->field('name')->find();

        $users[] = '191e35f7e01136ae714';
        //别名推送方法
        $user_lists = \think\Db::table('user_focus_channels')->where('channel_id',$video['channel_id'])->select();

        foreach ($user_lists as $list) {
            $user = \think\Db::table('users')->where('id',$list['user_id'])->find('device_token');
            $users[] = $user['device_token'];
        }

        $data = $pushmodel->push()
            ->setPlatform('ios')
            ->addRegistrationId($users)
            ->message('内容', [
                'title' => '特别关注 ' . $channel['name'],
                'content_type' => '视频更新：' . $video['name'],
            ])
            ->send();

        return true;
    }

}