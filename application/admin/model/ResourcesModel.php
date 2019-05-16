<?php

namespace app\admin\model;

use app\api\model\KeyWordsModel;
use app\common\ConstCode;
use app\common\Util;
use think\Model;
use think\Db;

/**
 * 资源模型
 * 预期在结构上区分传值和返回方法 $where获取数据方法 封装数据方法
 * Class ResourcesModel
 * @package app\admin\model
 */
class ResourcesModel extends BaseModel
{

//表名
    protected $table = 'videos';
    //主键
    protected $pk = 'id';


    /**
     * 通过where获取单一数据
     * @param $where
     * @param string $order
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getOneDataByWhere($where){
        $contents = self::where($where)
            ->find();
        return $contents;
    }

    public static function getOneResourceById($id){
        $where['id'] = $id;
        $where['status'] = ['>', -1];

        /**
         * 获取数据
         */
        $content=self::getOneDataByWhere($where);

        /**
         * 封装数据
         */


        return $content;
    }


    /**
     * 通用where order获取数据列表方法
     * @param $where
     * @param string $order
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getDataListByWhere($where,$order=''){
        $order='sort_by asc,'.$order.',published_at desc';

        $contents = self::where($where)
            ->order($order)
            ->select();

        return $contents;
    }

    public static function getDataListByWhereAndKeywords($where,$keywords_id,$order=''){
        $order='sort_by asc,'.$order.'published_at desc';

        //字段混淆 所以用数组排序

        $contents = self::hasWhere('keywordsMappings', ['status' => 1, 'keywords_id' =>$keywords_id])
            ->order($order)
            ->select();
        $contents_list=[];
        foreach ($contents as $content) {
            if($content['status']>-1) {

                if($content['control_id']==$where['control_id']){


                    $contents_list[]=$content;
                }

            }
        }


        return $contents_list;
    }

    /**
     * 用于封装数据为列表的方法
     */
    public static function dataToResourcesList($contents,$user_id){

        $resContent = [];
        /**
         * 封装数据包
         * 重命名
         */
        foreach ($contents AS $val) {

            /**
             * 根据资源类型获取不同的数据字段 但是都放入url字段
             */
            if ($val['type'] == ConstCode::VIDEO_TYPE_VIDEO) {
                $url = $val['url'];
                $isFree = ConstCode::IS_FREE_YES;
                if ($val['is_free'] == ConstCode::IS_FREE_NO) {
                    $url = $val['demo_url'];
                    $isFree = ConstCode::IS_FREE_NO;
                }
            } else {
//                $url = Util::fromJson(domain_replace($val['image_url']));
                $url = '非视频资源';
                $isFree = ConstCode::IS_FREE_YES;
            }
            //封装一个content
            $content = [
                'id' => $val['id'],
                'avatar' => domain_replace(KeyWordsModel::getUserHeadImg($val['channel_id'])['avatar']),
                'nickname' => KeyWordsModel::getUserHeadImg($val['channel_id'])['name'],
                'title' => $val['name'],
                'price' => $val['price'],
                'url' => domain_replace($url),
                'is_free' => $isFree,
                'duration' => $val['duration'],
                'poster' => domain_replace($val['poster']),
                'type' => $val['type'],
                'desc' => $val['desc'],
//                'publishat' => $val['create_time'],
                'publish_at' => $val['published_at'],
                'is_like' =>  UserModel::userJudgeZan($user_id,$val['id'],ConstCode::TYPE_ZAN_VIDEO),
                'like_num' => calcK($val['fabulou_count']),
                'played_num' => calcK($val['played_count']),
                'is_top' => $val['is_top'],
                'is_vertical' => $val['is_vertical'],
                'is_advertising' => $val['is_advertising'],
                'ad_url'=>$val['ad_url'],
                'tags' => VideoModel::getTagNameList($val['tag_list']),
                'comments_num' => count(KeyWordsModel::getShenPingByVideoId($val['id'])['commentList']),
            ];

            $resContent[] = $content;
        }

        return $resContent;

}
    /**
     * 瀑布流加载办法 传值返回方法
     * @param $control_id
     * @param int $pageNum
     * @param null $pageSize
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getAllResourceByContolId($where=[],$keywords_id,$user_id ,$pageNum = 1, $pageSize=10)
    {

        $where['status'] = ['>', -1];

        /**
         * 获取数据
         */
        $content=self::getDataListByWhereAndKeywords($where,$keywords_id);

        /**
         * 封装数据
         */
        $res=self::dataToResourcesList($content,$user_id);

        $total_page_num=ceil(count($res)/$pageSize);

        /**
         * 瀑布流加载
         */
        $resContent=[];
        if ($pageNum > 1) {
            $limit = ($pageNum - 1) * $pageSize;
            foreach ($res as $k => $v) {
                if ($k >= $limit && $k < ($pageNum * $pageSize)) {
                    $resContent[] = $v;
                }
            }
            return  $data=['content_list'=>$resContent,'total_page_num'=>$total_page_num];
        }
        elseif($pageNum == 1){
            $limit =  $pageSize;
            foreach ($res as $k => $v) {
                if ($k < $limit) {
                    $resContent[] = $v;
                }
            }
            return  $data=['content_list'=>$resContent,'total_page_num'=>$total_page_num];
        }

    }



    public static function getVieoList($val, $userId)
    {
        if ($val['type'] == ConstCode::VIDEO_TYPE_VIDEO) {
            $url = $val['url'];
            $isFree = ConstCode::IS_FREE_YES;
            if ($val['is_free'] == ConstCode::IS_FREE_NO) {
                $url = $val['demo_url'];
                $isFree = ConstCode::IS_FREE_NO;
                if ($userId) {
                    $where['user_id'] = $userId;
                    $where['product_id'] = $val['id'];
                    $where['product_type'] = ConstCode::PRODUCT_TYPE_VIDEO;
                    $where['status'] = ConstCode::ORDER_STATUS_PAID;
                    $order = Db::table("orders")->where($where)->find();
                    if ($order) {
                        $url = $val['url'];
                        $isFree = ConstCode::IS_FREE_PAID;
                    }
                }
            }
        } else {
            $url = Util::fromJson($val['image_url']);
            $isFree = ConstCode::IS_FREE_YES;
        }
        $list = [
            'id' => $val['id'],
            'avatar' => domain_replace(KeyWordsModel::getUserHeadImg($val['channel_id'])['avatar']),
            'nickName' => KeyWordsModel::getUserHeadImg($val['channel_id'])['name'],
            'title' => $val['name'],
            'price' => $val['price'],
            'url' => domain_replace($url),
            'isFree' => $isFree,
            'duration' => $val['duration'],
            'poster' => domain_replace($val['poster']),
            'type' => $val['type'],
            'desc' => $val['desc'],
            'publishat' => $val['create_time'],
            'zanNum' => $val['fabulou_count'],
            'playedNum' => $val['played_count'],
            'isTop' => $val['is_top'],
            'isVertical' => $val['is_vertical'],
            'tags' => VideoModel::getTagNameList($val['tag_list']),
            'comments' => count(KeyWordsModel::getShenPingByVideoId($val['id'])['commentList']),
        ];
        return $list;
    }


    /**
     * 把标签ID数组换成名称数组
     * @param $tag_str
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getTagNameList($tag_str)
    {
        $tagList = [];
        $tags = Util::fromJson($tag_str);
        if ($tags) {
            foreach ($tags as $tag) {
                $tagList[] = self::getTagName($tag)['name'];
            }
        }
        return $tagList;
    }

    /**
     * 根据id获取标签名称
     * @param $tagId
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getTagName($tagId)
    {
        $res = Db::table("tags")->where('id', $tagId)->find();
        return $res;
    }


    /**
     * 把关键词ID数组换成名称数组
     * @param $keyWordsStr
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getKeyWordsList($keyWordsStr)
    {
        $keyWords = Util::fromJson($keyWordsStr);
        $keyWordsList = [];
        if ($keyWords) {
            foreach ($keyWords as $key) {
                $keyWordsList[] = self::getKeyWordsName($key)['name'];
            }
        }
        return $keyWordsList;
    }


    /**
     * 添加或修改tags方法
     */
    public static function updateVideoTags($video_id,array $tag_ids,$field='status')
    {
        Db::startTrans();
        //先添加或修改映射表
        $result=0;
        $data=['status'=>1];
        foreach ($tag_ids as $tag_id){
            //
            $where=['tag_id'=>$tag_id,'resource_id'=>$video_id];
            TagsResourcesMappingModel::firstOrCreate($where);
            TagsResourcesMappingModel::update($data,$where,$field);

        }

        //再重新遍历映射表 把resource的其他tags关系改为隐藏
        $allTagsResoucesMappingInfo=TagsResourcesMappingModel::where(['resource_id'=>$video_id])->select();
        foreach ($allTagsResoucesMappingInfo as $info){
            //映射表内关系 不再本次修改内的需要改为隐藏
            if(!in_array($info->tag_id,$tag_ids)){
                TagsResourcesMappingModel::update(['status'=>0],['tag_id'=>$info->tag_id,'resource_id'=>$video_id],$field);
                }
        }
        Db::commit();
        return $result;
    }

    /**
     * 添加或修改keywords方法
     */
    public static function updateVideoKeywords($video_id,array $keywords_ids,$field='status')
    {
        Db::startTrans();
        //先添加或修改映射表
        $result=0;
        $data=['status'=>1];
        foreach ($keywords_ids as $keywords_id){
            //
            $where=['keywords_id'=>$keywords_id,'resource_id'=>$video_id];
            KeywordsResourcesMappingModel::firstOrCreate($where);
            KeywordsResourcesMappingModel::update($data,$where,$field);

        }

        //再重新遍历映射表 把resource的其他tags关系改为隐藏
        $allKeywordsResoucesMappingInfo=KeywordsResourcesMappingModel::where(['resource_id'=>$video_id])->select();
        foreach ($allKeywordsResoucesMappingInfo as $info){
            //映射表内关系 不再本次修改内的需要改为隐藏
            if(!in_array($info->keywords_id,$keywords_ids)){
                KeywordsResourcesMappingModel::update(['status'=>0],['keywords_id'=>$info->keywords_id,'resource_id'=>$video_id],$field);
            }
        }
        Db::commit();
        return $result;
    }

    /**
     * 关联关系 关键字
     */
    public function keywordsMappings()
    {
        $res=$this->hasMany('KeywordsResourcesMappingModel','resource_id','id')->order('id');
        return $res;
    }


    /**
     * 关联关系 标签
     */
    public function tagsMappings()
    {
        return $this->hasMany('TagsResourcesMapping','resource_id','id')->order('id');
    }

    /**
     * 关联关系 评论
     */
    public function comments()
    {
        return $this->hasMany('Comments','video_id','id')->order('id');
    }
}