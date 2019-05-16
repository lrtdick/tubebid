<?php
/**
 *
 * api (http:json)
 *
 */
namespace app\api\controller;
use app\admin\model\ResourcesModel;
use app\api\apiabstract\BaseAbstract;
use app\api\apiabstract\ServerAbstract;
use app\api\model\KeyWordsModel;
use app\admin\model\VideoModel;
use app\api\model\ProductModel;
use app\api\model\UserModel;
use app\common\ConstCode;
use app\common\Util;
use app\common\Result;
use think\Db;
use think\Exception;
use think\Validate;

class Product extends BaseAbstract
{
    /**
     * 产品详情页接口
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function product(){
        //微信用户信息
        $currentUserInfo = UserModel::getUserInfoById($this->userId);
        $currentUser = [
            'nickname' => $currentUserInfo['name'],
            'avatar' => $currentUserInfo['avatar'],
        ];
        $data['current_user'] = $currentUser;
        //资源信息
//        $videoInfo = UserModel::getProductInfoById($this->data['id']);
        $videoInfo = ResourcesModel::getOneResourceById($this->data['id']);


        /**
         * 返回数据封装
         */
        $data['author_id'] = $videoInfo['channel_id'];
        $data['author_avatar'] = domain_replace(KeyWordsModel::getUserHeadImg($videoInfo['channel_id'])['avatar']);
        $data['author_nickname'] = KeyWordsModel::getUserHeadImg($videoInfo['channel_id'])['name'];
        $data['is_follow_this_author'] = ProductModel::userIsFocusChannel($this->userId,$videoInfo['channel_id'],ConstCode::TYPE_FOCUS_USER);
        $data['resource_id'] = $videoInfo['id'];
        $data['title'] = $videoInfo['name'];
        $data['desc'] = $videoInfo['desc'];
        $data['type'] = $videoInfo['type'];
        $data['poster'] = domain_replace($videoInfo['poster']);//添加资源封面
        switch ($videoInfo['type']){
            case ConstCode::VIDEO_TYPE_VIDEO:
                $data['play_url'] = domain_replace($videoInfo['url']);
                $data['is_free'] = ConstCode::IS_FREE_YES;
                if($videoInfo['is_free'] == ConstCode::IS_FREE_NO){
                    $data['play_url'] = domain_replace($videoInfo['demo_url']);
                    $data['is_free'] = ConstCode::IS_FREE_NO;
                    if($currentUserInfo){
                        $where['user_id'] = $currentUserInfo['id'];
                        $where['product_id'] = $videoInfo['id'];
                        $where['product_type'] = ConstCode::PRODUCT_TYPE_VIDEO;
                        $where['status'] = ConstCode::ORDER_STATUS_PAID;
                        $order = Db::table("orders")->where($where)->find();
                        if($order){
                            $data['play_url'] = domain_replace($videoInfo['url']);
                            $data['is_free'] = ConstCode::IS_FREE_PAID;
                        }
                    }
                }
                break;
            case ConstCode::VIDEO_TYPE_PICTURE:
                $image_text_array= Util::fromJson($videoInfo['image_url']);
                //cdn域名转换
                foreach($image_text_array AS $image_text){
                    $image_text['imageUrl']=domain_replace($image_text['imageUrl']);
                    $image_text_array_res[]=$image_text;
                }
                $data['content'] = $image_text_array_res;
                break;
            case ConstCode::VIDEO_TYPE_ARTICLE:
                //图文的content用图片的图和html代码替换
                $image_text_array= Util::fromJson($videoInfo['image_text_json']);
                //cdn域名转换
                foreach($image_text_array AS $image_text){
                    $image_text['imageUrl']=domain_replace($image_text['imageUrl']);
                    $image_text_array_res[]=$image_text;
                }
                $data['content'] = $image_text_array_res;
                break;
        }
        $data['like_num'] = $videoInfo['fabulou_count'];
        $data['publish_at'] = $videoInfo['published_at'];
//        $data['publish_at'] = $videoInfo['create_time'];
        $data['tags'] = VideoModel::getTagNameList($videoInfo['tag_list']);
        $data['is_top'] = $videoInfo['is_top'];
        $data['is_vertical'] = $videoInfo['is_vertical'];
        $data['is_advertising'] = $videoInfo['is_advertising'];
        $data['is_like'] = UserModel::userJudgeZan($this->userId,$videoInfo['id'],ConstCode::TYPE_ZAN_VIDEO);

        $reComments = KeyWordsModel::getShenPingByVideoId($videoInfo['id'])['shenPing'];
        $data['top_3_comments'] =$reComments;

        $commentsInfo = KeyWordsModel::getShenPingByVideoId($videoInfo['id'])['commentList'];
        $commentsList = [];
        foreach ($commentsInfo as $info){
            $userInfo=KeyWordsModel::getUserHeadImg($info['user_id']);
            $commentsList[] = [
                'id' => $info['id'],
                'user_id' => $info['user_id'],
                'avatar' => domain_replace($userInfo['avatar']),
                'nickname' => $userInfo['name'],
                'content' => $info['content'],
                'like_num' => $info['like_num']?$info['like_num']:0,
                'is_like' => UserModel::userJudgeZan($this->userId,$info['id'],ConstCode::TYPE_ZAN_COMMENT),
                'replies_num' => count(ProductModel::getCommentsReply($info['id'])),
                'created_at' => $info['created_at'],
                'replies_list' => ProductModel::getCommentsReply($info['id'],$this->userId)
            ];
        }
        $data['comments_num'] = count($commentsInfo);
        $data['comments_list'] = $commentsList;

        //获取推荐列表 每个关键词点赞数前10条的文章
        $recommendInfo=ResourcesModel::hasWhere('keywordsMappings', ['status'=>1, 'keywords_id'=>$this->data['keyWordsId']])->order('fabulou_count desc')->limit(10)->select();

        //推荐列表数据数组
        $recommendList = [];
        foreach ($recommendInfo as $info){
            $recommendList[] = [
                'id' => $info['id'],
                'title' => $info['name'],
                'tags' => VideoModel::getTagNameList($info['tag_list']),
                'poster' => domain_replace($info['poster']),
                'like_num' => $info['fabulou_count'],
//                'is_like' => UserModel::userJudgeZan($this->userId,$info['id'],ConstCode::TYPE_ZAN_VIDEO),
                'comments_num' => count(KeyWordsModel::getShenPingByVideoId($info['id'])['commentList']),
                'author_id'=>$info['channel_id'],
                'author_avatar' => domain_replace(KeyWordsModel::getUserHeadImg($info['channel_id'])['avatar']),
                'author_nickname' => KeyWordsModel::getUserHeadImg($info['channel_id'])['name'],
            ];
        }
        $data['recommend_list'] = $recommendList;

        //记录浏览历史
        if($this->userId){
            ProductModel::userPrintRecord($this->userId,$this->data['id']);
        }

        //返回数据
        return Result::getResultSuccess($data);
    }
}
