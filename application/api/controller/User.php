<?php
/**
 *
 * api (http:json)
 *
 */
namespace app\api\controller;
use app\admin\model\ResourcesModel;
use app\admin\model\SuggestionsModel;
use app\admin\model\VideoModel;
use app\api\apiabstract\BaseAbstract;
use app\api\model\ProductModel;
use app\common\ConstCode;
use app\api\model\KeyWordsModel;
use app\api\model\UserModel;
use app\common\Util;
use app\common\Result;
use think\Validate;
use think\Db;

class User extends BaseAbstract
{
    /**
     * 个人中心页面接口
     * @return false|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function userCenter(){
        //return Result::getResultSuccess($this->data);
        $user_info = Db::table('users')->where('id',$this->userId)->find();
        $userInfo['user_id'] = $user_info['id'];
        $userInfo['avatar'] = $user_info['avatar'];
        $userInfo['nickname'] = $user_info['name'];

//        var_dump($user_info);


        return Result::getResultSuccess($userInfo);
    }

    /**
     * 个人产品列表接口
     * @return false|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function myProduct(){


        $userInfo = KeyWordsModel::getUserHeadImg($this->userId);
        $userProductsList=UserModel::getUserProduct($userInfo['id']);

        $data['user_id'] = $userInfo['id'];
        $data['avatar'] = $userInfo['avatar'];
        $data['nickname'] = $userInfo['name'];
        $data['signature'] = $userInfo['signature'];
        $data['product_num'] = count($userProductsList);
        $data['follow_num'] = count(UserModel::getUserFocusList($userInfo['id'],'focus'));
        $data['fans_num'] = count(UserModel::getUserFocusList($userInfo['id'],'fans'));
        $data['like_num_total'] = UserModel::getUserFocusList($userInfo['id'],'zan');
        $data['share_num_total'] = Util::getRand(0);
        $data['resources_list'] = $userProductsList;
        return Result::getResultSuccess($data);
    }

    /**
     * 我的关注列表（用户及关键词）
     * 根据关注的类型不同 返回不同的信息列表  存疑 这里方法是只返回一种列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function myFollow(){
        $data=[];
        $pageNum=$this->data['pageNum'];
        $pageSize=10;

        $where['user_id'] = $this->userId;
        $where['focus_type'] = $this->data['type'];
        $where['is_valid'] = ConstCode::ZAN_YES;

        switch ($this->data['type']){
            //关注类型为用户
            case ConstCode::TYPE_FOCUS_USER:
                $focusInfo = Db::table("user_focus_channels")->where($where)->select();
                $focusList = [];
                foreach ($focusInfo as $info){
                        $focusList[] = [
                            'userId' => $info['channel_id'],
                            'avatar' => KeyWordsModel::getUserHeadImg($info['channel_id'])['avatar'],
                            'nickName' => KeyWordsModel::getUserHeadImg($info['channel_id'])['name'],
                            'signature' => KeyWordsModel::getUserHeadImg($info['channel_id'])['signature'],
                            'focusStatus' => UserModel::userIsFocusMe($info['channel_id'],$this->userId),
                        ];
                }
                break;
            case ConstCode::TYPE_FOCUS_KEYWORDS:
                $focusInfo = Db::table("user_focus_channels")->where($where)->select();
                $focusList = [];
                foreach($focusInfo as $info){
                    $keywordsInfo= KeyWordsModel::getKeywordsById($info['key_words_id']);
                    $focusList[] = [
                        'is_follow_this_keywords' => ProductModel::userIsFocusKeywords($this->userId,$info['key_words_id'],ConstCode::TYPE_FOCUS_KEYWORDS),
                        'keywords_id' => $info['key_words_id'],
                        'keywords_name' => $keywordsInfo['name'],
                        'keywords_poster' => $keywordsInfo['poster'],
                        'keywords_desc' => $keywordsInfo['desc'],
                    ];
                }
                break;
        }

        /**
         * 瀑布流加载
         */
        $total_page_num=ceil(count($focusList)/$pageSize);
        $resContent=[];
        if ($pageNum > 1) {
            $limit = ($pageNum - 1) * $pageSize;
            foreach ($focusList as $k => $v) {
                if ($k >= $limit && $k < ($pageNum * $pageSize)) {
                    $resContent[] = $v;
                }
            }
        }
        elseif($pageNum == 1){
            $limit =  $pageSize;
            foreach ($focusList as $k => $v) {
                if ($k < $limit) {
                    $resContent[] = $v;
                }
            }

        }
        $data=['content_list'=>$resContent,'total_page_num'=>$total_page_num];

        return Result::getResultSuccess($data);
    }

    /**
     * 我的观看记录
     * 根据用户观看的log信息给用户一个观看记录列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function footprint(){
        $userInfo = Db::table("users")->where('id',$this->userId)->find();
        $data['avatar'] = domain_replace($userInfo['avatar']);
        $data['nickname'] = $userInfo['name'];

        $pageNum=$this->data['pageNum'];
        $pageSize=10;

//        历史记录 时间倒序
        $history_list = Db::table("user_histories")->order('create_time desc')->where("user_id",$this->userId)->select();
        //根据历史记录获取资源列表信息

        //重新封装
        $historyList = [];
        foreach ($history_list as $info){
            if(UserModel::getProductInfoById($info['video_id'])['type'] == ConstCode::VIDEO_TYPE_VIDEO){
                $historyList[] = [
                    'id' => $info['video_id'],
                    'avatar' => KeyWordsModel::getUserHeadImg(UserModel::getProductInfoById($info['video_id'])['channel_id'])['avatar'],
                    'nickname' => KeyWordsModel::getUserHeadImg(UserModel::getProductInfoById($info['video_id'])['channel_id'])['name'],
                    'userId' => UserModel::getProductInfoById($info['video_id'])['channel_id'],
                    'title' => UserModel::getProductInfoById($info['video_id'])['name'],
                    'desc' => UserModel::getProductInfoById($info['video_id'])['desc'],
                    'type' => UserModel::getProductInfoById($info['video_id'])['type'],
                    'poster' => UserModel::getProductInfoById($info['video_id'])['poster'],
                    'like_num' => UserModel::getProductInfoById($info['video_id'])['fabulou_count'],
                    'publish_at' => UserModel::getProductInfoById($info['video_id'])['create_time'],
                    'comments' => count(UserModel::getProductCommentsNum($info['video_id'])),
                ];
            }else{
                $historyList[] = [
                    'id' => $info['video_id'],
                    'userId' => UserModel::getProductInfoById($info['video_id'])['channel_id'],
                    'avatar' => KeyWordsModel::getUserHeadImg(UserModel::getProductInfoById($info['video_id'])['channel_id'])['avatar'],
                    'nickname' => KeyWordsModel::getUserHeadImg(UserModel::getProductInfoById($info['video_id'])['channel_id'])['name'],
                    'title' => UserModel::getProductInfoById($info['video_id'])['name'],
                    'desc' => UserModel::getProductInfoById($info['video_id'])['desc'],
                    'type' => UserModel::getProductInfoById($info['video_id'])['type'],
                    'poster' => UserModel::getProductInfoById($info['video_id'])['poster'],
                    'like_num' => UserModel::getProductInfoById($info['video_id'])['fabulou_count'],
                    'publish_at' => UserModel::getProductInfoById($info['video_id'])['create_time'],
                    'comments' => count(UserModel::getProductCommentsNum($info['video_id'])),
                ];
            }
        }



        /**
         * 瀑布流加载
         */
        $total_page_num=ceil(count($historyList)/$pageSize);
        $resContent=[];
        if ($pageNum > 1) {
            $limit = ($pageNum - 1) * $pageSize;
            foreach ($historyList as $k => $v) {
                if ($k >= $limit && $k < ($pageNum * $pageSize)) {
                    $resContent[] = $v;
                }
            }
        }
        elseif($pageNum == 1){
            $limit =  $pageSize;
            foreach ($historyList as $k => $v) {
                if ($k < $limit) {
                    $resContent[] = $v;
                }
            }

        }
        $data=['recodeList'=>$resContent,'total_page_num'=>$total_page_num];

        $data['recodeList'] = $historyList;
        return Result::getResultSuccess($data);
    }

    /**
     * 我的优惠券接口
     * @return false|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function myCoupon(){
        $couponRecode = Db::table("user_coupon")->where('user_id',$this->userId)->select();
        $couponList = [];
        foreach ($couponRecode as $recode){
            $couponList[] = [
                'id' => $recode['coupon_id'],
                'couponCode' => UserModel::getCouponInfoById($recode['coupon_id'])['code'],
                'createTime' => UserModel::getCouponInfoById($recode['coupon_id'])['create_time']
            ];
        }
        return Result::getResultSuccess($couponList);
    }

    /**
     * 评论回复提交接口
     */
    public function userCommentAndReply(){
        if($this->data['type'] == ConstCode::TYPE_COMMENTS){

            $request_data['id'] = $this->data['id'];
            $request_data['content'] = $this->data['content'];
            $request_data['type'] = $this->data['type'];
            $validate = new Validate([
                'id| 资源id' => 'require|number',
                'content| 评论内容' => 'require',
                'type| 评论类型' => 'require|number'
            ]);

            if (!$validate->check($request_data)) {
                return Result::getResultError($validate->getError());
            }
            $data['video_id'] = $request_data['id'];
            $data['user_id'] = $this->userId;
            $data['content'] = $request_data['content'];
            $id=Db::table("user_comments")->insertGetId($data);
            $data['new_id'] = $id;
            return Result::getResultSuccess($data);
        }elseif($this->data['type'] == ConstCode::TYPE_REPLY){
            $request_data['id'] = $this->data['id'];
            $request_data['author_id'] = $this->data['author_id'];
            $request_data['commentsId'] = $this->data['commentsId'];
            $request_data['content'] = $this->data['content'];
            $request_data['type'] = $this->data['type'];


            $validate = new Validate([
                'id| 资源id' => 'require|number',
                'author_id| 作者id' => 'require|number',
                'commentsId| 评论ID' => 'require|number',
                'content| 评论内容' => 'require',
                'type| 评论类型' => 'require|number'
            ]);
            if (!$validate->check($request_data)) {
                return Result::getResultError($validate->getError());
            }

            $data['video_id'] = $request_data['id'];
            $data['user_id'] = $this->data['author_id'];
            $data['comment_id'] = $request_data['commentsId'];
            $data['reply_user_id'] = $this->userId;
            $data['content'] = $request_data['content'];

            $id=Db::table("user_comments")->insertGetId($data);
            $data['new_id'] = $id;
            return Result::getResultSuccess($data);
        }
    }

    /**
     * 用户点赞功能提交接口
     */
    public function giveZanUp(){
        $request_data['type'] = $this->data['type'];
        $request_data['id'] = $this->data['id'];
        $valid = [
            'type| 点赞类型' => 'require|number',
            'id| 点赞对象ID' => 'require|number'
        ];
        $validate = new Validate($valid);
        if (!$validate->check($request_data)) {
            return Result::getResultError($validate->getError());
        }
        $data = [
            'object_id' => $request_data['id'],
            'type' => $request_data['type']
        ];
        //return Result::getResultSuccess($data);
        Db::startTrans();
        try{
            $where['user_id'] = $this->userId;
            $where['type'] = $data['type'];
            switch ($request_data['type']){
                case ConstCode::TYPE_ZAN_VIDEO:
                    $where['video_id'] = $data['object_id'];
                    $recordInfo = Db::table("user_zan_record")->where($where)->find();
                    if($recordInfo){
                        if($recordInfo['is_valid'] == ConstCode::ZAN_YES){
                            Db::table("user_zan_record")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_NO]);
                            Db::table("videos")->where("id",$data['object_id'])->setDec('fabulou_count');
                        }elseif($recordInfo['is_valid'] == ConstCode::ZAN_NO){
                            Db::table("user_zan_record")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_YES]);
                            Db::table("videos")->where("id",$data['object_id'])->setInc('fabulou_count');
                        }
                    }else{
                        Db::table("user_zan_record")->insert(['user_id'=>$this->userId,'video_id'=>$data['object_id'],'type'=>$data['type']]);
                        Db::table("videos")->where("id",$data['object_id'])->setInc('fabulou_count');
                    }
                    break;
                case ConstCode::TYPE_ZAN_COMMENT:
                    $where['comment_id'] = $data['object_id'];
                    $recordInfo = Db::table("user_zan_record")->where($where)->find();
                    if($recordInfo){
                        if($recordInfo['is_valid'] == ConstCode::ZAN_YES){
                            Db::table("user_zan_record")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_NO]);
                            Db::table("user_comments")->where("id",$data['object_id'])->setDec('like_num');
                        }elseif($recordInfo['is_valid'] == ConstCode::ZAN_NO){
                            Db::table("user_zan_record")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_YES]);
                            Db::table("user_comments")->where("id",$data['object_id'])->setInc('like_num');
                        }
                    }else{
                        Db::table("user_zan_record")->insert(['user_id'=>$this->userId,'comment_id'=>$data['object_id'],'type'=>$data['type']]);
                        Db::table("user_comments")->where("id",$data['object_id'])->setInc('like_num');
                    }
                    break;
                case ConstCode::TYPE_ZAN_REPLY:
                    $where['reply_id'] = $data['object_id'];
                    $recordInfo = Db::table("user_zan_record")->where($where)->find();
                    if($recordInfo){
                        if($recordInfo['is_valid'] == ConstCode::ZAN_YES){
                            Db::table("user_zan_record")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_NO]);
                            Db::table("user_comments")->where("id",$data['object_id'])->setInc('like_num');
                        }elseif($recordInfo['is_valid'] == ConstCode::ZAN_NO){
                            Db::table("user_zan_record")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_YES]);
                            Db::table("user_comments")->where("id",$data['object_id'])->setInc('like_num');
                        }
                    }else{
                        Db::table("user_zan_record")->insert(['user_id'=>$this->userId,'reply_id'=>$data['object_id'],'type'=>$data['type']]);
                        Db::table("user_comments")->where("id",$data['object_id'])->setInc('like_num');
                    }
                    break;
            }
            Db::commit();
            return Result::getResultSuccess();
        }catch (\Exception $e){
            Db::rollback();
            return Result::getResultError($e->getMessage());
        }
    }

    /**
     * 用户关注提交接口
     */
    public function userGiveFocusUp(){
        $request_data['type'] = $this->data['type'];
        $request_data['id'] = $this->data['id'];
        $valid = [
            'type| 关注类型' => 'require|number',
            'id| 关注对象ID' => 'require|number'
        ];
        $validate = new Validate($valid);
        if (!$validate->check($request_data)) {
            return Result::getResultError($validate->getError());
        }
        $data = [
            'object_id' => $request_data['id'],
            'type' => $request_data['type']
        ];
        Db::startTrans();
        try{
            $where['user_id'] = $this->userId;
            $where['focus_type'] = $data['type'];
            switch ($data['type']){
//                给作者关注
                case ConstCode::TYPE_FOCUS_USER:
                    $where['channel_id'] = $data['object_id'];
                    $recordInfo = Db::table("user_focus_channels")->where($where)->find();
                    if($recordInfo){
                        if($recordInfo['is_valid'] == ConstCode::ZAN_YES){
                            Db::table("user_focus_channels")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_NO]);
                        }elseif($recordInfo['is_valid'] == ConstCode::ZAN_NO){
                            Db::table("user_focus_channels")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_YES]);
                        }
                    }else{
                        Db::table("user_focus_channels")->insert(['user_id'=>$this->userId,'channel_id'=>$data['object_id'],'focus_type'=>$data['type']]);
                    }
                    break;
//                    给关键词关注
                case ConstCode::TYPE_FOCUS_KEYWORDS:
                    $where['key_words_id'] = $data['object_id'];
                    $recordInfo = Db::table("user_focus_channels")->where($where)->find();
                    if($recordInfo){
                        if($recordInfo['is_valid'] == ConstCode::ZAN_YES){
                            Db::table("user_focus_channels")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_NO]);
                            Db::table("key_words")->where("id",$data['object_id'])->setDec('follow_num');
                        }elseif($recordInfo['is_valid'] == ConstCode::ZAN_NO){
                            Db::table("user_focus_channels")->where("id",$recordInfo['id'])->update(['is_valid'=>ConstCode::ZAN_YES]);
                            Db::table("key_words")->where("id",$data['object_id'])->setInc('follow_num');
                        }
                    }else{
                        Db::table("user_focus_channels")->insert(['user_id'=>$this->userId,'key_words_id'=>$data['object_id'],'focus_type'=>$data['type']]);
                        Db::table("key_words")->where("id",$data['object_id'])->setInc('follow_num');
                    }
                    break;
            }
            Db::commit();
            return Result::getResultSuccess();
        }catch ( \Exception $e){
            Db::rollback();
            return Result::getResultError($e->getMessage());
        }
    }

    public function suggestion(){
        Db::startTrans();
        $request_data=$this->data;
        $validate = new Validate([
            'other| 其他联系方式'=>'require',
            'email| 邮箱' => 'require',
            'content| 内容' => 'require',
        ]);

        if (!$validate->check($request_data)) {
            Db::rollback();
            return Result::getResultError($validate->getError());
        }

        unset($request_data['token']);
        $request_data['user_id']=$this->userId;
        $request_data['created_at']=date('Y-m-d H:i:s',time());
        $request_data=SuggestionsModel::create($request_data);
        $request_data['message']='你的意见已反馈';
        Db::commit();
        return Result::getResultSuccess($request_data);
    }

}
