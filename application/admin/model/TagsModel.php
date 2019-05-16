<?php

namespace app\admin\model;

use AlibabaCloud\Ess\V20140828\ExitStandby;
use app\common\ConstCode;
use app\common\Util;
use think\Db;
use think\Model;

class TagsModel extends BaseModel {
    //表名
    protected $table = 'tags';
    //主键
    protected $pk = 'id';

    //id转name

    /**
     * 把标签ID数组换成名称数组
     * @param $tag_str
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getTagNameList(array $tag_str)
    {
        $tagList = [];
        $tags =$tag_str;
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
        $res = self::where('id', $tagId)->find();
        return $res;
    }

    public function resourcesMappings()
    {
        return $this->hasMany('TagsResourcesMappingModel','tag_id','id')->order('id');
    }
}