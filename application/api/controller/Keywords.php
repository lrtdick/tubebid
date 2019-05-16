<?php
/**
 *
 * api (http:json)
 *
 */
namespace app\api\controller;

use app\admin\model\ResourcesModel;
use app\admin\model\UserViewHistoriesModel;
use app\api\apiabstract\LoginAbstract;
use app\api\apiabstract\BaseAbstract;
use app\api\model\KeyWordsModel;
use app\admin\model\VideoModel;
use app\api\model\ProductModel;
use app\api\model\UserModel;
use app\common\ConstCode;
use app\common\Util;
use app\common\Result;
use think\Cache;
use think\Cookie;
use think\Db;

class Keywords extends BaseAbstract
{
    public function index(){
        /**
         * 统计类功能
         * 关键字主页面访问记录
         */
        $userview=UserViewHistoriesModel::getUserViewKeywordsHistory($this->userId,null,$this->data['keyWordsId']);
        $userview->user_id=$this->userId?$this->userId:0;
        $userview->keywords_id=$this->data['keyWordsId'];
        $userview->save();

        /**
         * keywords关键字访问主页面 第一页和后面几页的控件不同
         * 第一页加载所有控件
         * 第二页开始的控件只有foot控件
         */

        //所有页面获取keywordsid
        $data['keywords_id']=$this->data['keyWordsId'];
        $keywordsinfo=KeyWordsModel::where(['status'=>1])->select();
        foreach ($keywordsinfo as $keywords){

            $data['keywords_id_list'][]=$keywords['id'];
        }
        $data['current_user']=$this->userId;
        if($this->data['pageNum'] == 1){
            //关键字关注
//            $keyWords = KeyWordsModel::getKeyWordsNameById($this->data['keyWordsId']);
            $keyWords = KeyWordsModel::getKeywordsById($this->data['keyWordsId']);
            $data['is_follow_this_keywords'] = ProductModel::userIsFocusKeywords($this->userId,$this->data['keyWordsId'],ConstCode::TYPE_FOCUS_KEYWORDS);
//            $data['is_follow_this_keywords'] = $this->data['keyWordsId'];
            //顶部标题
            $fixedTitle['keywords_name'] = $keyWords['name'];
            $fixedTitle['keywords_desc'] = $keyWords['desc'];
            $fixedTitle['keywords_content'] = $keyWords['content'];
            $fixedTitle['keywords_follow_num'] = calcK($keyWords['follow_num']);
            $fixedTitle['keywords_poster'] = domain_replace($keyWords['poster']);
            $fixedTitle['location'] = 'fixedTitle';
            $data['fixedTitle'] = $fixedTitle;
            $unique_video_ids=[];

            //主体所有活动组件
            $where=['is_fixed'=>ConstCode::IS_FIXED_OFF,'status'=>1];
            $componentInfo = Db::table("control_cms")->where($where)->order('sort asc')->select();
            $componentList = [];
            foreach ($componentInfo as $component){

                $where=[];
                $where['control_id']=$component['id'];
                $contentLists=  ResourcesModel::getAllResourceByContolId($where,$this->data['keyWordsId'],$this->userId);//获取control对应的数据


                $componentList[] = [
                    'control_id' => $component['id'],
                    'control_type' => KeyWordsModel::getControlTypeName($component['control_type'])['cn_name'],
                    'sort' => $component['sort'],
                    'desc' => $component['control_desc'],
                    'data_role' => KeyWordsModel::getDataRoleById($component['data_role_id'])['en_name'],
                    'data_count' => $component['data_count'],
                    'control_name' => $component['control_name'],
                    'bannerSetup' => [
                        'flag' => 0,
                        'interval' => 1000
                    ],
                    'contentList' => $contentLists['content_list'],

                ];
            }
            $data['activityCtrlList'] = $componentList;

            //底部固顶组件列表内容
            $footContent['page_num'] = $this->pageNum;
            $footContent['location'] = 'fixedList';

            $where=[];
            $where['keywords_id']=$this->data['keyWordsId'];
            $where['control_id']=0;
            $ContentInfo=ResourcesModel::getAllResourceByContolId($where,$this->data['keyWordsId'],$this->userId,$this->pageNum,$this->pageSize);

            $footContentInfo=$ContentInfo['content_list'];
            $data['total_page_num']=$ContentInfo['total_page_num'];

            $footContent['contentList'] = $footContentInfo;
            $data['footContent'] = $footContent;

            return Result::getResultSuccess($data);
        }elseif($this->data['pageNum'] > 1){
            $footContent['page_num'] = $this->pageNum;
            $footContent['location'] = 'fixedList';

            $where=[];
            $where['control_id']=0;
            $ContentInfo=ResourcesModel::getAllResourceByContolId($where,$this->data['keyWordsId'],$this->userId,$this->pageNum,$this->pageSize);

//            $footContentInfo=ResourcesModel::getAllResourceByContolId($control_id,$this->pageNum,$this->pageSize);
            $footContentInfo=$ContentInfo['content_list'];
//            $data['total_page_num']=floor(count($footContentInfo)/$this->pageSize);
            $data['total_page_num']=$ContentInfo['total_page_num'];
//            foreach ($footContentInfo as $content){
//                $footContentLists[] = KeyWordsModel::getVieoList($content,$this->userId);

                //视频去重
                //$footContentList = [];
              //  $unique_video_ids=Cache::get('unique_video_ids')?Cache::get('unique_video_ids'):[];
    //                foreach($footContentInfo as $k=>$content){
    //                    if(in_array($content['id'],$unique_video_ids)){
    //                    }else{
    //                        $footContentList[]=$content;
    //                        $unique_video_ids[]=$content['id'];
    //                    }

            $footContent['contentList'] = $footContentInfo;
            $data['footContent'] = $footContent;

//            Cache::set('unique_video_ids', $unique_video_ids, 360);
//            $data["uni_IDS"]=Cache::get('unique_video_ids');
            return Result::getResultSuccess($data);
        }
    }




    public function coupon(){
        $code = [];
        for ($i = 1000 ; $i <=1500; $i++){
            $code[] = [
                'code' => md5($i.rand(0,500))
            ];
        }
        $res = Db::table("coupon")->insertAll($code);
        return Result::getResultSuccess($res);
    }
}
