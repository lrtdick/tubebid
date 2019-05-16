/*
Navicat MySQL Data Transfer

Source Server         : server
Source Server Version : 80011
Source Host           : 10.0.0.114:3306
Source Database       : sp_video

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-04-22 10:11:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for advertising_cms
-- ----------------------------
DROP TABLE IF EXISTS `advertising_cms`;
CREATE TABLE `advertising_cms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面图',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1发布 2隐藏',
  `is_top` int(1) NOT NULL DEFAULT '1' COMMENT '1不置顶 2置顶',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1纯文字 2图文 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of advertising_cms
-- ----------------------------
INSERT INTO `advertising_cms` VALUES ('2', '成都这些高颜值美食 既好吃又好看 吃前记得发朋友圈哦', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/1555071898.jpg', '<p><br/></p><p>如果你以为成都美食口感只有麻和辣，颜色只有辣椒红，</p><p><br/></p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555071898.jpg\"></p><p>那你可能是没有吃过这种美食，夏天清凉冬天暖胃，颜值高又好吃。</p><p>这种美食是很多老成都人的心里爱，一年四季都可以吃，</p><p>几乎老少皆宜，还可以随喜好来制成咸味或者甜味。</p><p>那这种成都美食到底是什么呢？&nbsp; 其实就是豆花，来成都麻辣味吃腻了，想换换口味？豆花的百变多样或许可以满足你。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555071911.jpg\"></p><p><br/></p><p>青羊区大墙东街有一家网友评选出来的比较好吃的豆花店，他家的冰醉豆花是特色，</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555071930.jpg\"></p><p>&nbsp;</p><p>冰冰凉凉的豆花加了醪糟和枸杞吃起来清凉解暑，</p><p>吃腻了红油和麻辣，来碗冰醉豆花解腻也是不错的。</p><p><br/></p><p>还有劲道的面加绵软的豆花，浇上红油汤汁盖上肉沫就是一碗豆花面，</p><p>喜欢豆制品的人或许会喜欢这样一碗带着豆香的面。</p><p>他家还有一道比较经典的撒子豆花，是很多老成都人喜欢的味道，</p><p>脆脆的撒子伴在绵软的豆花里，看起来细腻又丰富。&nbsp; &nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555071949.jpg\"></p><p>成都豆花的特别之处在于，</p><p>它不仅可以做饭桌上低调的菜肴，还可以变成适合发朋友圈的高颜值甜品，</p><p>奎星楼街有家豆花甜品店，店里的招牌之一百利甜酒豆花，</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555071961.jpg\"></p><p>是由黑糯米、芋圆、红豆。百利甜酒加豆花制成。</p><p>还有各种水果、芋圆、麦片、坚果和豆花的混搭看起来颜值很高，</p><p>网友评价说好看又好吃。&nbsp; 喜欢豆制品的人可以来成都尝试一下，</p><p>或许会很喜欢这种美食—豆花，毕竟优点多，</p><p>可盐可甜，既能麻辣也能冰爽，颜值高又让很多人都觉得好吃。</p><p><br/></p>', '2019-04-17 13:32:57', null, '2019-04-17 13:32:57', '1', '2', '2');
INSERT INTO `advertising_cms` VALUES ('4', '最新折扣购买——“火锅圣地”香天下', null, '<p>今天的折扣，不可多得，速速购买</p>', '2019-04-19 19:06:54', null, '2019-04-03 19:15:00', '1', '2', '1');

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `control_id` int(11) NOT NULL DEFAULT '0',
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `video_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_play_auth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expires` bigint(20) DEFAULT NULL COMMENT '视频过期时间',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '跳转链接  应该是视频链接，ios给个视频id过去就好',
  `tip_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '付费视频提示图片',
  `position` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '首页' COMMENT '出现位置 例如 首页',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-发布, 2-隐藏',
  `type` int(1) DEFAULT '1' COMMENT '1->视频 2->图片',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '排序 正序排列',
  `is_free` int(1) NOT NULL DEFAULT '1' COMMENT '1免费 ，2收费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES ('8', '22', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419162730e30e72fe471b6b4d8e3e198327b358b2', null, null, null, null, '23', '', null, '1', '2', '0', '1');
INSERT INTO `banners` VALUES ('9', '22', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419162710f1836d39ff254b4abcc5598a11517650', null, null, null, null, '345345', '', null, '1', '2', '1', '1');
INSERT INTO `banners` VALUES ('10', '22', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419162634d0b001f81baf0a880aa4902a9076f620', null, null, null, null, '456546', '', null, '1', '2', '3', '1');
INSERT INTO `banners` VALUES ('11', '22', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419162559398dd04e08eba852654365c1a87204a1', null, null, null, null, '456456', '', null, '1', '2', '5', '1');
INSERT INTO `banners` VALUES ('12', '22', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041916253954ff8eed84c2b3e60c7ae6f22d3b2642', null, null, null, null, '123123', '', null, '1', '2', '10', '1');
INSERT INTO `banners` VALUES ('14', '30', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419163720e090bae46cb6dddea282ecdc35a637f8', 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/6adaf9c-16a34918db0/6adaf9c-16a34918db0.mp4?Expires=1558252115&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=eWK%2F9DgHBi4L%2FLoJEda2S5jVLHg%3D', 'f51232ae273d41ff9c0aa320a0a8ef94', 'eyJTZWN1cml0eVRva2VuIjoiQ0FJUzF3SjFxNkZ0NUIyeWZTaklyNG5DRzlQOGoreFowcStFUkhMSXZIb1JmT3hHbW9ENzFUejJJSDlJZEhWb0FPOGZ2dlUwbTJ0WTdQc1pscnNvRnNJVUdSQ2ZNNDVvNnAxR3pRU2lib3laZjFKQ0kzZEIydk9mQW1HMkowUFJMNmF3Q3J5THNicS9GOTZwYjFmYjdDd1JwWkx4YVRTbFdYRzhMSlNOa3VRSlI5OExYdzYrSHdFa1k4bFJLbGxOcGRNaU1YTEFGUENqTlh5UW5HM2NYbVZscGpSOWhXNTR3cU81ek15VGlIemJrRWFvOHVzY3RvbnJDNFc0YjZzSU9ZdGtBZSt4MWYxWGNLVEdza2hWOXdNWTJLcDlscjFjNVJUS3I2dnFZVDlyN2c2Qkx2RGYvL0IyTVFaOWZkSmFJYU5mcStYbW52QUswWTY2MWFhUGtrY1RiYkFORG42QUh0djduWkNjUWRuRWJJaHBLZXpKWEYzV3ljMktPNVhQdEFjcFhHa1dMZ3NpZWFCNmRTTWdWVVIxRldpS2UvVDRvd0NRUDF5NU40R0IwYkFyMTZSeXcyN2g5TUd4TzBPMVJMR1V3WXZIdUMyRDBaUkRHb0FCZWZZemlnSDBJQnVhNm1yM2VsQXJ3TXFScnVFdXZqamNqTU81SFJDY2dqQ1RGWHJDMHFaSG1CZzRrNVNMT2EvSnczbE9vU2hSK040VThQcUlzNW15TTFXOEZPbU1EdVc3NjNDYnFyazNmczM1RUNSTGVSaVpURU1nZzM0TTVxR3lKMWdUR3J0Ym5oS1h2dnRPa3lWci9rS1hkbVU4SzVMeDhwNWRNOGFwMUw4PSIsIkF1dGhJbmZvIjoie1wiQ0lcIjpcIjQ5VmR0VG5oTTN4MjI5NG41UnlmMEZLZEhFNWhPeHNFTnlaTGE4d1JJVEEwS2ZQeGtreHBSb2pLdDdoeDh6Sy9lQU9aNjN6d3J3L3lcXHJcXG5Fd3VOSVgyU2xnPT1cXHJcXG5cIixcIkNhbGxlclwiOlwiMVVEa3NFVWRHWkNCYTJVelZHaGYrdz09XFxyXFxuXCIsXCJFeHBpcmVUaW1lXCI6XCIyMDE5LTA0LTE5VDA3OjUwOjE1WlwiLFwiTWVkaWFJZFwiOlwiZjUxMjMyYWUyNzNkNDFmZjljMGFhMzIwYTBhOGVmOTRcIixcIlNpZ25hdHVyZVwiOlwieW52L3ppQXc5WllnRzA2YzNJUmdKcTh6NXVjPVwifSIsIlZpZGVvTWV0YSI6eyJTdGF0dXMiOiJVcGxvYWRpbmciLCJWaWRlb0lkIjoiZjUxMjMyYWUyNzNkNDFmZjljMGFhMzIwYTBhOGVmOTQiLCJUaXRsZSI6IlVwbG9hZExvY2FsVmlkZW8iLCJEdXJhdGlvbiI6MC4wfSwiQWNjZXNzS2V5SWQiOiJTVFMuTkp3UGlIYjN4ZW1vRlR5WHpEcGNqdUVQNyIsIkFjY2Vzc0tleVNlY3JldCI6IkdHb0NXQTVTaEFVQlp6Z3ZrNFdGaXAxMlZkeGZOOG1naGtOOEQzOGtWRnlnIiwiUmVnaW9uIjoiY24tYmVpamluZyIsIkN1c3RvbWVySWQiOjM1NTk0NDM2fQ==', '1558259011', 'https://item.jd.com/41814702658.html#crumb-wrap', null, null, '1', '1', '1', '1');
INSERT INTO `banners` VALUES ('15', '30', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419163741c617515cd3be9666adc3a7a4195f8467', 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/6adaf9c-16a34918db0/6adaf9c-16a34918db0.mp4?Expires=1558252115&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=eWK%2F9DgHBi4L%2FLoJEda2S5jVLHg%3D', 'f51232ae273d41ff9c0aa320a0a8ef94', 'eyJTZWN1cml0eVRva2VuIjoiQ0FJUzF3SjFxNkZ0NUIyeWZTaklyNG5DRzlQOGoreFowcStFUkhMSXZIb1JmT3hHbW9ENzFUejJJSDlJZEhWb0FPOGZ2dlUwbTJ0WTdQc1pscnNvRnNJVUdSQ2ZNNDVvNnAxR3pRU2lib3laZjFKQ0kzZEIydk9mQW1HMkowUFJMNmF3Q3J5THNicS9GOTZwYjFmYjdDd1JwWkx4YVRTbFdYRzhMSlNOa3VRSlI5OExYdzYrSHdFa1k4bFJLbGxOcGRNaU1YTEFGUENqTlh5UW5HM2NYbVZscGpSOWhXNTR3cU81ek15VGlIemJrRWFvOHVzY3RvbnJDNFc0YjZzSU9ZdGtBZSt4MWYxWGNLVEdza2hWOXdNWTJLcDlscjFjNVJUS3I2dnFZVDlyN2c2Qkx2RGYvL0IyTVFaOWZkSmFJYU5mcStYbW52QUswWTY2MWFhUGtrY1RiYkFORG42QUh0djduWkNjUWRuRWJJaHBLZXpKWEYzV3ljMktPNVhQdEFjcFhHa1dMZ3NpZWFCNmRTTWdWVVIxRldpS2UvVDRvd0NRUDF5NU40R0IwYkFyMTZSeXcyN2g5TUd4TzBPMVJMR1V3WXZIdUMyRDBaUkRHb0FCZWZZemlnSDBJQnVhNm1yM2VsQXJ3TXFScnVFdXZqamNqTU81SFJDY2dqQ1RGWHJDMHFaSG1CZzRrNVNMT2EvSnczbE9vU2hSK040VThQcUlzNW15TTFXOEZPbU1EdVc3NjNDYnFyazNmczM1RUNSTGVSaVpURU1nZzM0TTVxR3lKMWdUR3J0Ym5oS1h2dnRPa3lWci9rS1hkbVU4SzVMeDhwNWRNOGFwMUw4PSIsIkF1dGhJbmZvIjoie1wiQ0lcIjpcIjQ5VmR0VG5oTTN4MjI5NG41UnlmMEZLZEhFNWhPeHNFTnlaTGE4d1JJVEEwS2ZQeGtreHBSb2pLdDdoeDh6Sy9lQU9aNjN6d3J3L3lcXHJcXG5Fd3VOSVgyU2xnPT1cXHJcXG5cIixcIkNhbGxlclwiOlwiMVVEa3NFVWRHWkNCYTJVelZHaGYrdz09XFxyXFxuXCIsXCJFeHBpcmVUaW1lXCI6XCIyMDE5LTA0LTE5VDA3OjUwOjE1WlwiLFwiTWVkaWFJZFwiOlwiZjUxMjMyYWUyNzNkNDFmZjljMGFhMzIwYTBhOGVmOTRcIixcIlNpZ25hdHVyZVwiOlwieW52L3ppQXc5WllnRzA2YzNJUmdKcTh6NXVjPVwifSIsIlZpZGVvTWV0YSI6eyJTdGF0dXMiOiJVcGxvYWRpbmciLCJWaWRlb0lkIjoiZjUxMjMyYWUyNzNkNDFmZjljMGFhMzIwYTBhOGVmOTQiLCJUaXRsZSI6IlVwbG9hZExvY2FsVmlkZW8iLCJEdXJhdGlvbiI6MC4wfSwiQWNjZXNzS2V5SWQiOiJTVFMuTkp3UGlIYjN4ZW1vRlR5WHpEcGNqdUVQNyIsIkFjY2Vzc0tleVNlY3JldCI6IkdHb0NXQTVTaEFVQlp6Z3ZrNFdGaXAxMlZkeGZOOG1naGtOOEQzOGtWRnlnIiwiUmVnaW9uIjoiY24tYmVpamluZyIsIkN1c3RvbWVySWQiOjM1NTk0NDM2fQ==', '1558259023', 'https://item.jd.com/41814702658.html#crumb-wrap', null, null, '1', '1', '1', '1');
INSERT INTO `banners` VALUES ('16', '30', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041916364611403f4418bc09321cb148523bf8ee97', 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/f377b50-16a34962679/f377b50-16a34962679.mp4?Expires=1558252416&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=%2F%2B8OuQkOD625%2BsJcgsqKVeMo7Tg%3D', '1b7fdb63a7f348c9a5db508926684427', 'eyJTZWN1cml0eVRva2VuIjoiQ0FJUzF3SjFxNkZ0NUIyeWZTaklyNG5DRzlQOGoreFowcStFUkhMSXZIb1JmT3hHbW9ENzFUejJJSDlJZEhWb0FPOGZ2dlUwbTJ0WTdQc1pscnNvRnNJVUdSQ2ZNNDVvNnAxR3pRU2lib3laZjFKQ0kzZEIydk9mQW1HMkowUFJMNmF3Q3J5THNicS9GOTZwYjFmYjdDd1JwWkx4YVRTbFdYRzhMSlNOa3VRSlI5OExYdzYrSHdFa1k4bFJLbGxOcGRNaU1YTEFGUENqTlh5UW5HM2NYbVZscGpSOWhXNTR3cU81ek15VGlIemJrRWFvOHVzY3RvbnJDNFc0YjZzSU9ZdGtBZSt4MWYxWGNLVEdza2hWOXdNWTJLcDlscjFjNVJUS3I2dnFZVDlyN2c2Qkx2RGYvL0IyTVFaOWZkSmFJYU5mcStYbW52QUswWTY2MWFhUGtrY1RiYkFORG42QUh0djduWkNjUWRuRWJJaHBLZXpKWEYzV3ljMktPNVhQdEFjcFhHa1dMZ3NpZWFCNmRTTWdWVVIxRldpS2UvVDRvd0NRUDF5NU40R0IwYkFyMTZSeXcyN2g5TUd4TzBPMVJMR1V3WXZIdUMyRDBaUkRHb0FCZWZZemlnSDBJQnVhNm1yM2VsQXJ3TXFScnVFdXZqamNqTU81SFJDY2dqQ1RGWHJDMHFaSG1CZzRrNVNMT2EvSnczbE9vU2hSK040VThQcUlzNW15TTFXOEZPbU1EdVc3NjNDYnFyazNmczM1RUNSTGVSaVpURU1nZzM0TTVxR3lKMWdUR3J0Ym5oS1h2dnRPa3lWci9rS1hkbVU4SzVMeDhwNWRNOGFwMUw4PSIsIkF1dGhJbmZvIjoie1wiQ0lcIjpcImx0Ty9ndk16OTVQWWpaRVUrdDBMTUxXZGZLZjdUbzJuMW9MellsRytoWlBZLzA4ZUJzZ3BmRUVMdFZNUlhBWGQwV0JKaFQxakl2Z1lcXHJcXG45OGZWdHJseENRPT1cXHJcXG5cIixcIkNhbGxlclwiOlwiTkU2NHFacGY3SVBMOG5JNHYyeDNkUT09XFxyXFxuXCIsXCJFeHBpcmVUaW1lXCI6XCIyMDE5LTA0LTE5VDA3OjU1OjE3WlwiLFwiTWVkaWFJZFwiOlwiMWI3ZmRiNjNhN2YzNDhjOWE1ZGI1MDg5MjY2ODQ0MjdcIixcIlNpZ25hdHVyZVwiOlwiT01tREEvTzI3RkU5c1ZDL3NyODRiT3RJSWFjPVwifSIsIlZpZGVvTWV0YSI6eyJTdGF0dXMiOiJVcGxvYWRpbmciLCJWaWRlb0lkIjoiMWI3ZmRiNjNhN2YzNDhjOWE1ZGI1MDg5MjY2ODQ0MjciLCJUaXRsZSI6IlVwbG9hZExvY2FsVmlkZW8iLCJEdXJhdGlvbiI6MC4wfSwiQWNjZXNzS2V5SWQiOiJTVFMuTkp3UGlIYjN4ZW1vRlR5WHpEcGNqdUVQNyIsIkFjY2Vzc0tleVNlY3JldCI6IkdHb0NXQTVTaEFVQlp6Z3ZrNFdGaXAxMlZkeGZOOG1naGtOOEQzOGtWRnlnIiwiUmVnaW9uIjoiY24tYmVpamluZyIsIkN1c3RvbWVySWQiOjM1NTk0NDM2fQ==', '1558258988', 'https://search.jd.com/Search?keyword=%E9%98%BF%E7%8E%9B%E5%B0%BC%E6%89%8B%E8%A1%A8&enc=utf-8&qrst=1&rt=1&stop=1&vt=2&suggest=2.def.0.V18--12%2C20%2C&wq=aman&page=3&s=57&click=0', null, null, '1', '1', '3', '1');
INSERT INTO `banners` VALUES ('22', '22', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419162501705780b3ec39cabcac4e73c33d72e3b9', null, null, null, null, '456456', null, null, '1', '2', '55', '1');

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专家名字',
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专家头像',
  `desc` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专家介绍',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channels
-- ----------------------------
INSERT INTO `channels` VALUES ('1', '曹智明', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Nobis et sequi in rerum qui pariatur deserunt.', '2018-05-30 17:42:41', '2018-05-30 17:42:41');
INSERT INTO `channels` VALUES ('2', '简秀兰', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Non quis doloremque autem vero adipisci. Quisquam magni ullam amet enim consequuntur ratione aliquam.', '2018-05-30 17:42:41', '2018-05-30 17:42:41');
INSERT INTO `channels` VALUES ('3', '霍伦', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Esse consequuntur amet sit fugiat sunt quasi dignissimos. Nihil architecto quibusdam placeat id nemo.', '2018-05-30 17:42:41', '2018-05-30 17:42:41');
INSERT INTO `channels` VALUES ('4', '丛莹', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Harum et corporis qui.', '2018-05-30 17:42:41', '2018-05-30 17:42:41');
INSERT INTO `channels` VALUES ('5', '熊丽丽', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Optio omnis eos veniam.', '2018-05-30 17:42:41', '2018-05-30 17:42:41');
INSERT INTO `channels` VALUES ('6', '谈文', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Ab blanditiis expedita quo sit nostrum est laboriosam in.', '2018-05-30 17:42:41', '2018-05-30 17:42:41');
INSERT INTO `channels` VALUES ('7', '裴坤', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Id qui voluptatibus voluptates consequuntur culpa minus laborum voluptatum. Impedit qui eos dolore fugit aliquid explicabo quis.', '2018-05-30 17:42:41', '2018-05-30 17:42:41');
INSERT INTO `channels` VALUES ('8', '党玉梅', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Laudantium molestiae repellendus in dolorum.', '2018-05-30 17:42:41', '2018-05-30 17:42:41');
INSERT INTO `channels` VALUES ('9', '冷雪梅', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Aut vel impedit perferendis in. Quidem odit excepturi et.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('10', '史淑英', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Aut qui distinctio id et temporibus velit exercitationem. Deserunt fugit voluptatum alias eos.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('11', '阎华', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Debitis atque similique laboriosam officiis quo.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('12', '毛哲彦', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Ut magni amet id aspernatur.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('13', '谌霞', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Quasi est dolorem expedita dolorum et facilis.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('14', '彭正业', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Tempore vel incidunt ut et ipsa quos.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('15', '凌晨', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Dolores est voluptatem deserunt pariatur natus. Nisi nam sed animi qui aut temporibus qui.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('16', '莫旭', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Itaque delectus cumque quos velit. Quia eos quia ipsa cupiditate ut facilis.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('17', '牟捷', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Explicabo quo earum at non. Ullam animi maxime iure id.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('18', '乐志明', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Magnam pariatur id vero dolores modi. Vero expedita tempora quaerat atque cum aperiam quia.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('19', '窦毅', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Magni commodi magnam accusantium dignissimos itaque perspiciatis nulla. Et in voluptatem animi.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('20', '匡正豪', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Aut excepturi qui sequi officia.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('21', '覃新华', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Non eos harum veritatis voluptatum ex voluptatem.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('22', '鄢超', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Tempore ex veniam non ipsam est. A nobis maiores architecto praesentium et tenetur corporis.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('23', '木莉', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Aut expedita vitae vitae dicta et. Pariatur ab quam sint ut aut.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('24', '甄瑞', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Animi tempore dolores nihil deleniti optio quae qui. Dolores illum id id hic ut quis.', '2018-05-30 17:42:42', '2018-05-30 17:42:42');
INSERT INTO `channels` VALUES ('25', '时欢', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Id quo quia quidem dicta minus velit. Ut dolores libero sed autem.', '2018-05-30 17:42:43', '2018-05-30 17:42:43');
INSERT INTO `channels` VALUES ('26', '迟瑜', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Beatae qui hic quibusdam aut.', '2018-05-30 17:42:43', '2018-05-30 17:42:43');
INSERT INTO `channels` VALUES ('27', '许玉华', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Consectetur qui consequuntur reiciendis id sunt qui voluptas.', '2018-05-30 17:42:43', '2018-05-30 17:42:43');
INSERT INTO `channels` VALUES ('28', '景志文', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Qui quasi dolorum nihil repellendus. Officiis quia odit saepe ducimus.', '2018-05-30 17:42:43', '2018-05-30 17:42:43');
INSERT INTO `channels` VALUES ('29', '谈杨', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Libero molestiae voluptatem mollitia est ut tempora. Commodi quod aut ducimus vel ipsa similique nisi dolore.', '2018-05-30 17:42:43', '2018-05-30 17:42:43');
INSERT INTO `channels` VALUES ('30', '杜倩', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', 'Eum iure sunt et corrupti tempore sunt recusandae. Optio nam laborum ad enim.', '2018-05-30 17:42:43', '2018-05-30 17:42:43');
INSERT INTO `channels` VALUES ('31', '测试', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png', '测试简介', '2018-06-08 14:31:08', '2018-06-08 14:31:08');
INSERT INTO `channels` VALUES ('32', '测试', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG3.png', '测试机', '2018-06-12 12:06:01', '2018-06-12 12:09:25');
INSERT INTO `channels` VALUES ('33', 'MDJ', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo.jpg', 'James Douglas，美国艺术家、设计师', '2018-06-12 16:12:50', '2018-06-12 16:12:50');
INSERT INTO `channels` VALUES ('34', '盒子大师', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo1.jpg', 'Draw a Box | 盒子大师，本名Irshad Karim ，加拿大概念原画师、插画家', '2018-06-13 19:41:32', '2018-06-13 19:44:09');
INSERT INTO `channels` VALUES ('35', '工业设计师吉米', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/unnamed.jpg', 'Jimmy Huynh | 美国工业设计师，分享有关工业设计的日常', '2018-06-14 19:18:18', '2018-06-14 19:18:18');
INSERT INTO `channels` VALUES ('36', '小鲜肉比尔', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo2.jpg', 'Dan Beardshaw，英国21岁小鲜肉，5年手绘学习时间。', '2018-06-18 15:45:05', '2018-06-18 16:10:19');
INSERT INTO `channels` VALUES ('37', '大嘴猴手绘', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/TheSketchMonkeyCi-150x10.png', '设计师费莱尼的手绘频道，更新有关汽车和产品的设计手绘。\r\n', '2018-06-18 15:52:44', '2018-06-18 15:52:44');
INSERT INTO `channels` VALUES ('38', 'Scott Robertson', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo5.jpg', '手绘大师，ACCD设计中心艺术学院手绘老师，丰富的手绘教学经验。', '2018-06-18 16:09:28', '2018-06-18 16:09:28');
INSERT INTO `channels` VALUES ('39', '小黑人', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo7.jpg', 'Spencer Nugent，美国工业设计师。', '2018-06-18 17:14:03', '2018-06-18 17:14:03');
INSERT INTO `channels` VALUES ('40', '环线艺术学院', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/77.jpg', 'Tom McPherson，每周六更新，手绘透视、建筑、风景、人物和产品。', '2018-06-18 17:20:05', '2018-06-18 17:20:05');
INSERT INTO `channels` VALUES ('41', '朱峰FengZhu', 'https://sketing.oss-cn-beijing.aliyuncs.com/avatar/80cfbca6jw8expyclukoij208m05kjru.jpg', '朱峰，华裔概念设计师，新加坡FZD设计学院 创始人。', '2018-06-18 17:46:29', '2018-06-18 17:48:34');

-- ----------------------------
-- Table structure for control_cms
-- ----------------------------
DROP TABLE IF EXISTS `control_cms`;
CREATE TABLE `control_cms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `control_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `control_type` int(11) NOT NULL,
  `data_role_id` int(11) DEFAULT NULL,
  `data_count` int(11) DEFAULT NULL,
  `control_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件标题简短描述',
  `page_id` int(11) NOT NULL DEFAULT '1',
  `is_valid` int(11) NOT NULL DEFAULT '0',
  `key_words` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advertising_id` int(11) DEFAULT NULL COMMENT '广告内容ID，只有广告组件才有的字段（type==3的组件类型）',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1发布 2隐藏',
  `sort` int(11) NOT NULL,
  `is_fixed` int(1) NOT NULL DEFAULT '1' COMMENT '1活动 2固定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of control_cms
-- ----------------------------
INSERT INTO `control_cms` VALUES ('21', '关键词标题', '1', null, null, '顶部固定标题', '1', '0', null, null, '1', '0', '2');
INSERT INTO `control_cms` VALUES ('22', '最新推荐', '2', null, null, '标题下面的固定轮播', '1', '0', '20', null, '1', '0', '1');
INSERT INTO `control_cms` VALUES ('23', '数据列表', '7', null, null, '底部固定列表组件', '1', '0', null, null, '1', '999', '2');
INSERT INTO `control_cms` VALUES ('24', '文字广告', '3', null, null, '可设置的文字广告', '1', '0', null, '4', '1', '1', '1');
INSERT INTO `control_cms` VALUES ('25', '编辑精选', '5', '1', '3', '编辑精选筛选数据', '1', '0', null, null, '1', '2', '1');
INSERT INTO `control_cms` VALUES ('28', '近期最火', '5', '3', '3', '浏览最多的', '1', '0', null, null, '1', '6', '1');
INSERT INTO `control_cms` VALUES ('30', '推荐广告位', '8', null, null, '竖版视频广告轮播', '1', '0', '', null, '1', '9', '1');
INSERT INTO `control_cms` VALUES ('31', '精选图集', '6', '7', '4', '横版轮播', '1', '0', null, null, '1', '4', '1');
INSERT INTO `control_cms` VALUES ('32', '单图广告', '9', null, null, '广告位', '1', '0', null, '2', '1', '7', '1');

-- ----------------------------
-- Table structure for control_type
-- ----------------------------
DROP TABLE IF EXISTS `control_type`;
CREATE TABLE `control_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cn_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `demo_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of control_type
-- ----------------------------
INSERT INTO `control_type` VALUES ('1', '页面顶部部固定标题组件', 'fixedTitle', '/upload/ctrldemoimg/fixedTitle.jpg');
INSERT INTO `control_type` VALUES ('2', '页面活动横版广告轮播组件', 'transverseAdvertisingSliding', '/upload/ctrldemoimg/transverseAdvertisingSliding.jpg');
INSERT INTO `control_type` VALUES ('3', '页面活动文字广告组件', 'textAdvertising', '/upload/ctrldemoimg/textAdvertising.jpg');
INSERT INTO `control_type` VALUES ('4', '页面活动竖版轮播组件', 'verticalSliding', '/upload/ctrldemoimg/verticalSliding.jpg');
INSERT INTO `control_type` VALUES ('5', '页面活动列表组件', 'list', '/upload/ctrldemoimg/list.jpg');
INSERT INTO `control_type` VALUES ('6', '页面活动横版轮播组件', 'transverseSliding', '/upload/ctrldemoimg/transverseSliding.jpg');
INSERT INTO `control_type` VALUES ('7', '页面底部固定列表组件', 'fixedList', '/upload/ctrldemoimg/fixedList.jpg');
INSERT INTO `control_type` VALUES ('8', '页面活动竖版广告轮播组件', 'verticalAdvertisingSliding', '/upload/ctrldemoimg/verticalAdvertisingSliding.jpg');
INSERT INTO `control_type` VALUES ('9', '页面活动图文广告组件', 'pictureAdvertising', '/upload/ctrldemoimg/pictureAdvertising.jpg');

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1正常 2已售',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES ('1', 'b9dae7c74ce7b2502d76e9b9a2d33d8d', '2');
INSERT INTO `coupon` VALUES ('2', '920e1a04592b56a37111d90780f6c802', '2');
INSERT INTO `coupon` VALUES ('3', '3d6a3fe13e7461ab2a7b56b0191dd917', '1');
INSERT INTO `coupon` VALUES ('4', '0f12da99ea98dfaabe0ced8b54a0322c', '1');
INSERT INTO `coupon` VALUES ('5', '56c3a7397a52c7c619347e85926687cb', '1');
INSERT INTO `coupon` VALUES ('6', '4821f632d29d4aed40fdd126cec0cc41', '1');
INSERT INTO `coupon` VALUES ('7', 'dfbba96cab99aa0df752b3da6aa054ab', '1');
INSERT INTO `coupon` VALUES ('8', '03739945d5dfbc99f0cc70e8866fe243', '1');
INSERT INTO `coupon` VALUES ('9', '795b93f42468efe3c51f983fb5e5499a', '1');
INSERT INTO `coupon` VALUES ('10', 'b68a8f484c720d58e1fbd877891ae2d7', '1');
INSERT INTO `coupon` VALUES ('11', '60e748aaf34bc74617de9f212e996fae', '1');
INSERT INTO `coupon` VALUES ('12', '8822de57019e5abffb22d9893419c9c9', '1');
INSERT INTO `coupon` VALUES ('13', 'c2ad6d79f9ae21415f3fbecc3c43bc1a', '1');
INSERT INTO `coupon` VALUES ('14', 'bc3e8d77b433ea90832bd22014a66321', '1');
INSERT INTO `coupon` VALUES ('15', '13a6bae4c50d6ef098c2814c36655c54', '1');
INSERT INTO `coupon` VALUES ('16', '097c273aad6f919fe3f412544a88a3ec', '1');
INSERT INTO `coupon` VALUES ('17', '4597232aa7faf049b916642376b23ff2', '1');
INSERT INTO `coupon` VALUES ('18', '7f7c38ba948d8b60a67655ed8718e94c', '1');
INSERT INTO `coupon` VALUES ('19', '21f451becc7672fab7d8779de5f6e76c', '1');
INSERT INTO `coupon` VALUES ('20', '103dc92264040c317a9e5cf2fae0cb4a', '1');
INSERT INTO `coupon` VALUES ('21', 'de361d64ccf13ffe251f7ee919cfa68d', '1');
INSERT INTO `coupon` VALUES ('22', 'ecd9ae61269e0ef276a585cc54067d5c', '1');
INSERT INTO `coupon` VALUES ('23', 'c1daab9c2ee4bf85cc39cadac987a0a9', '1');
INSERT INTO `coupon` VALUES ('24', 'e346eaad5cbb07cd03916ee440318747', '1');
INSERT INTO `coupon` VALUES ('25', 'ab4d8e4056e56717d7fd28f5d842091e', '1');
INSERT INTO `coupon` VALUES ('26', '07af4e7e17b5c59944e52ef7dd86d661', '1');
INSERT INTO `coupon` VALUES ('27', '6f76270c7df8c6c64e7f1c5a16988c71', '1');
INSERT INTO `coupon` VALUES ('28', '7fd502bc792c889a33e1fc528fb07f25', '1');
INSERT INTO `coupon` VALUES ('29', '3c488251f8d08f575b61b1691f4edef6', '1');
INSERT INTO `coupon` VALUES ('30', 'd08a632b25801d11511266fe72da043c', '1');
INSERT INTO `coupon` VALUES ('31', '7d02fa40c7ff48ef6d1475aa9015b7b2', '1');
INSERT INTO `coupon` VALUES ('32', 'e9aa85ace92873ddc908448630b73f33', '1');
INSERT INTO `coupon` VALUES ('33', '5dfdd6df7dc4d7fa9b7ee8f13ff246ac', '1');
INSERT INTO `coupon` VALUES ('34', '2b05f9b15412f20a704dcda19705fd64', '1');
INSERT INTO `coupon` VALUES ('35', '0358a9f70b01ee750506550ce034cf60', '1');
INSERT INTO `coupon` VALUES ('36', '8668ddf3665cf580e68155b9a1e98632', '1');
INSERT INTO `coupon` VALUES ('37', '1c16a24054db1ae8b188c467f6185a2b', '1');
INSERT INTO `coupon` VALUES ('38', '8fd00c59492c1eb880068ae717f08887', '1');
INSERT INTO `coupon` VALUES ('39', '71f3b58aeb0fa6a9c9e60818c0994a85', '1');
INSERT INTO `coupon` VALUES ('40', '8292ab0d7230e1709e25081d52a4a16f', '1');
INSERT INTO `coupon` VALUES ('41', '9eaa38515737d5a0a6da8265a05a330c', '1');
INSERT INTO `coupon` VALUES ('42', '12d31f930d6fa263ca3e3f22e7a59c73', '1');
INSERT INTO `coupon` VALUES ('43', '4f02244367af4aae6cf4ad1baa048fbe', '1');
INSERT INTO `coupon` VALUES ('44', '1e5dd601a0f5df23008dce4851663b9c', '1');
INSERT INTO `coupon` VALUES ('45', '8d936df43969b1f66554909b3ded55cc', '1');
INSERT INTO `coupon` VALUES ('46', '3db4a317b548b64b6451416dc9d082b9', '1');
INSERT INTO `coupon` VALUES ('47', 'acb341ede31321298cf1afcfbb5bb78d', '1');
INSERT INTO `coupon` VALUES ('48', '2db3545a41db81329326dbb11caff449', '1');
INSERT INTO `coupon` VALUES ('49', '85cd8ed322770716622c8cae2b69ace4', '1');
INSERT INTO `coupon` VALUES ('50', 'ca429e9309ae44b448e34914d095baaa', '1');
INSERT INTO `coupon` VALUES ('51', '9992c0d57693216c3c8576ee6295b289', '1');
INSERT INTO `coupon` VALUES ('52', '724bc2c678afb413bdd38021dc610e39', '1');
INSERT INTO `coupon` VALUES ('53', 'ad940c3d298f92a6296c2a007f3f6af5', '1');
INSERT INTO `coupon` VALUES ('54', '62ac4d33eace05eadf6424ccd044d944', '1');
INSERT INTO `coupon` VALUES ('55', '1115ec15a4637bb614390d16c81ea881', '1');
INSERT INTO `coupon` VALUES ('56', 'c5480ccfa3bad3a94433186ca7dd0637', '1');
INSERT INTO `coupon` VALUES ('57', 'df48897bbe9593d5ef6eb0760720faa6', '1');
INSERT INTO `coupon` VALUES ('58', '7571fa0f769cd1f060b7ceacd9e9e130', '1');
INSERT INTO `coupon` VALUES ('59', 'e6b99028d8866456d121c08f23fcac64', '1');
INSERT INTO `coupon` VALUES ('60', '58e7f345e7ba5d6ff6a912584cc9d4a9', '1');
INSERT INTO `coupon` VALUES ('61', '985f93a0212f98c2ce81dd5103927024', '1');
INSERT INTO `coupon` VALUES ('62', '2a0430f7165cf2f81e9377df447b87d6', '1');
INSERT INTO `coupon` VALUES ('63', 'ed0f83d71af952af7f06bf8dc6495ec3', '1');
INSERT INTO `coupon` VALUES ('64', 'c41a9258ecba9a3cffe991b12399d017', '1');
INSERT INTO `coupon` VALUES ('65', '59155bef27b5df1f14e1a976075a74f6', '1');
INSERT INTO `coupon` VALUES ('66', 'ed809a753263b1c3abd80031e2e34cfa', '1');
INSERT INTO `coupon` VALUES ('67', '4e17caa31ad7b575e4c4890c2c46873c', '1');
INSERT INTO `coupon` VALUES ('68', 'bca7ba31e0ec6c37359a8c1391a4dfeb', '1');
INSERT INTO `coupon` VALUES ('69', '361f0cb48cca855b671a195c2d99400b', '1');
INSERT INTO `coupon` VALUES ('70', '3dc57719c11ef602760a2f0e96b02837', '1');
INSERT INTO `coupon` VALUES ('71', '943111a5b28c93bf995918451145f6c3', '1');
INSERT INTO `coupon` VALUES ('72', '31a75ea823a2c137214d8bd401f0c83e', '1');
INSERT INTO `coupon` VALUES ('73', '901b40a54f5b5968a4df178b459df033', '1');
INSERT INTO `coupon` VALUES ('74', 'a1b29aec221a6627071e4caa70b19cc6', '1');
INSERT INTO `coupon` VALUES ('75', 'dc944c514f12836ab4daa73164f77e20', '1');
INSERT INTO `coupon` VALUES ('76', 'e3220b887fd745b0f30b968992ed5a02', '1');
INSERT INTO `coupon` VALUES ('77', '6fcfab5563136c2f25980b72d5a756b3', '1');
INSERT INTO `coupon` VALUES ('78', '90851db013b22cedbe46f898372c428a', '1');
INSERT INTO `coupon` VALUES ('79', '5fb118206fd781294cdfddc3e7544633', '1');
INSERT INTO `coupon` VALUES ('80', '89fa6381ba826051ade4a373eba5d567', '1');
INSERT INTO `coupon` VALUES ('81', '5943ecdc1db37f698efb8ec049cef505', '1');
INSERT INTO `coupon` VALUES ('82', '442a17a3a093ada258c5416b90b3a838', '1');
INSERT INTO `coupon` VALUES ('83', '248929a20820e7f56b4e0236be19d748', '1');
INSERT INTO `coupon` VALUES ('84', '9f674e1a86b991e13262c0afc2868f63', '1');
INSERT INTO `coupon` VALUES ('85', '8b5c5f2c8ad5cd31cc06922362f7f03b', '1');
INSERT INTO `coupon` VALUES ('86', 'cbb8ace321e89224b5051c90e0f705c0', '1');
INSERT INTO `coupon` VALUES ('87', '4e179daab121f45353301919ce648155', '1');
INSERT INTO `coupon` VALUES ('88', 'f64c495d0e53078162a5d6c862f12aae', '1');
INSERT INTO `coupon` VALUES ('89', '00b1ad023bfa063059a123b8506cfd62', '1');
INSERT INTO `coupon` VALUES ('90', '3537e67ec899061fbcb8a89e654cc75e', '1');
INSERT INTO `coupon` VALUES ('91', 'f77eb26d4a319437de471b302e4cb53c', '1');
INSERT INTO `coupon` VALUES ('92', 'cbba764ce79fba0b738e3fbd1bf872c6', '1');
INSERT INTO `coupon` VALUES ('93', '153c3da77b24bcefcd3e326497d5ee32', '1');
INSERT INTO `coupon` VALUES ('94', 'ac5a362a08d505cd42c10fa84d0ff750', '1');
INSERT INTO `coupon` VALUES ('95', '9ed1bb0bb4c399dc51a567e6dffaf311', '1');
INSERT INTO `coupon` VALUES ('96', '4012084631ed69a88e83ff7cce421b8a', '1');
INSERT INTO `coupon` VALUES ('97', '06d9d5d1179f2e93af73f767580fbf7c', '1');
INSERT INTO `coupon` VALUES ('98', '789128ea64fa83933aeffd3711b5db02', '1');
INSERT INTO `coupon` VALUES ('99', '61b4e681b98b8567bf26a71f13506b13', '1');
INSERT INTO `coupon` VALUES ('100', 'bd8b97c9de6ba1903ddeefc3ffe6504a', '1');
INSERT INTO `coupon` VALUES ('101', 'b99eb8da9c171152f32af77dcec92867', '1');
INSERT INTO `coupon` VALUES ('102', 'eac59d16d381eb033694880e6fa7ae96', '1');
INSERT INTO `coupon` VALUES ('103', '0a54119f518a28f1b4d527bd6be20ca7', '1');
INSERT INTO `coupon` VALUES ('104', 'ea9f6bbe0b86ae4c80610e31aacb8358', '1');
INSERT INTO `coupon` VALUES ('105', '4c0e6039f0d6bd1cf283299886e254aa', '1');
INSERT INTO `coupon` VALUES ('106', '3a72141baf4a59d1234b176a82f0de05', '1');
INSERT INTO `coupon` VALUES ('107', '29f427c0a8832b270a3cb12515cb62d4', '1');
INSERT INTO `coupon` VALUES ('108', '804ab678a77246d676cf8901b63fbfd2', '1');
INSERT INTO `coupon` VALUES ('109', '6d49fa6a3a314dc87062b50ddd4fdea5', '1');
INSERT INTO `coupon` VALUES ('110', 'cca278afdd2734363743bd67b70bc59a', '1');
INSERT INTO `coupon` VALUES ('111', '171792e8508ee3580eef92bc343af644', '1');
INSERT INTO `coupon` VALUES ('112', 'ef2454e4df393ee4dd46b83bd8749f92', '1');
INSERT INTO `coupon` VALUES ('113', '2ce3ac7371646a24663062a1e37f2c46', '1');
INSERT INTO `coupon` VALUES ('114', '345cf86d4c9168e1ad40bde235ff34f2', '1');
INSERT INTO `coupon` VALUES ('115', '476abc45fb2f3ba8cf11a30b1ad528d3', '1');
INSERT INTO `coupon` VALUES ('116', 'bc13c787dc9491fa2829a6265e28688a', '1');
INSERT INTO `coupon` VALUES ('117', 'e33bf6ae8dd6772d6b89c3126c8a42ae', '1');
INSERT INTO `coupon` VALUES ('118', 'b25613e6fa0ba4ffaada8019a875ccf3', '1');
INSERT INTO `coupon` VALUES ('119', 'b8b3d1a4ca55e17dc063ee574a91915e', '1');
INSERT INTO `coupon` VALUES ('120', '504f3106faacd0286c1a950e3165607c', '1');
INSERT INTO `coupon` VALUES ('121', 'f3fecda1e2652aea1e8fccaf6e3fdfb0', '1');
INSERT INTO `coupon` VALUES ('122', 'd633514e32dc2d71f5fa91ee45592d03', '1');
INSERT INTO `coupon` VALUES ('123', 'd3af4699b82a1d78c9f3424706c30a4a', '1');
INSERT INTO `coupon` VALUES ('124', 'c8420335a76d748c1432b6066645ac4a', '1');
INSERT INTO `coupon` VALUES ('125', 'fcb906321ae23ca0542a23527b8e9592', '1');
INSERT INTO `coupon` VALUES ('126', '10cb3925dd6b4dd845638597e4c8da97', '1');
INSERT INTO `coupon` VALUES ('127', '8cd207015506051896c041024a39c2a5', '1');
INSERT INTO `coupon` VALUES ('128', '8a192da0524e494a14061434720c8194', '1');
INSERT INTO `coupon` VALUES ('129', '81aacc37c2cce0449ddca2ad1fe648aa', '1');
INSERT INTO `coupon` VALUES ('130', '073ce7884fe1f50c4e5719442afd1639', '1');
INSERT INTO `coupon` VALUES ('131', '74aa8fa32c6176eebba2eb081476f5df', '1');
INSERT INTO `coupon` VALUES ('132', '71167cfd2015ebbba7fc8f2f9e5b7d78', '1');
INSERT INTO `coupon` VALUES ('133', '4b6daa71c8f26f30ebef46bcc61972a7', '1');
INSERT INTO `coupon` VALUES ('134', 'f3ea4cfb5f4ca9ffdc1feb2cf9e64ac8', '1');
INSERT INTO `coupon` VALUES ('135', 'd549dfadd1d998f609f53443874f0b3d', '1');
INSERT INTO `coupon` VALUES ('136', '5ffbb3c967d3e1052fc14c4051479aeb', '1');
INSERT INTO `coupon` VALUES ('137', '98a118288425b29d573dc21aa8cb7492', '1');
INSERT INTO `coupon` VALUES ('138', 'd854be9eb03de933d8d6f7dd90c767a5', '1');
INSERT INTO `coupon` VALUES ('139', '2364cddf532b55d3fc4cc027dcc143a9', '1');
INSERT INTO `coupon` VALUES ('140', '9bfb6db3108804fac0a8c598b1dec43c', '1');
INSERT INTO `coupon` VALUES ('141', '1514622e4ab01511f3c1947e84bb584a', '1');
INSERT INTO `coupon` VALUES ('142', '93684c7694969bcf2fc0020a193ff8b0', '1');
INSERT INTO `coupon` VALUES ('143', 'ed6e2fa5a7340e0696baed5aa0a22343', '1');
INSERT INTO `coupon` VALUES ('144', '3c66008923718c7048a665e6b0fa44a7', '1');
INSERT INTO `coupon` VALUES ('145', 'd5bd9e8aff1bb635f18f87c0cdb40c76', '1');
INSERT INTO `coupon` VALUES ('146', 'de9ea04a3c1ff6f4a690493a1dfb710c', '1');
INSERT INTO `coupon` VALUES ('147', '2dd2e9f852da944518ccba55e8d7d91d', '1');
INSERT INTO `coupon` VALUES ('148', 'a2f0f53e6769090f1fbd65bc664ad0b7', '1');
INSERT INTO `coupon` VALUES ('149', '80aa995f31e6fe711636075587971def', '1');
INSERT INTO `coupon` VALUES ('150', '8e08227323cd829e449559bb381484b7', '1');
INSERT INTO `coupon` VALUES ('151', 'e3306f956c08e119815f93756a928cde', '1');
INSERT INTO `coupon` VALUES ('152', 'b55796d2dc2cb0c9aff4cf90d42f5887', '1');
INSERT INTO `coupon` VALUES ('153', '1bfc9b918f02a17145eb64c6d9b15b94', '1');
INSERT INTO `coupon` VALUES ('154', 'e093b4a712ca6dcf9c2da204c3617404', '1');
INSERT INTO `coupon` VALUES ('155', 'b0fc2ad83b924198b147eb62a5461ec8', '1');
INSERT INTO `coupon` VALUES ('156', 'a9672684c6a7118c4349e356c190f032', '1');
INSERT INTO `coupon` VALUES ('157', 'fc3be3b5506bf585feb6458b039779c5', '1');
INSERT INTO `coupon` VALUES ('158', 'f533a630e30f4e689ecf784c19e2467d', '1');
INSERT INTO `coupon` VALUES ('159', 'd9f0631b8c4e5536f5f68506f0e617ff', '1');
INSERT INTO `coupon` VALUES ('160', '2bc1ad38f76b5dca60eb62b562fe2854', '1');
INSERT INTO `coupon` VALUES ('161', 'a94a24eb35531442484861273b55d52c', '1');
INSERT INTO `coupon` VALUES ('162', 'da275992daeb14cf2d082a32527f0f3b', '1');
INSERT INTO `coupon` VALUES ('163', '4934a4abf69300b095a09318a9e4335a', '1');
INSERT INTO `coupon` VALUES ('164', 'c50bd79b152ea747e41c78db518f69a9', '1');
INSERT INTO `coupon` VALUES ('165', '10bb11bc4e75708d098ac0d513bfbd33', '1');
INSERT INTO `coupon` VALUES ('166', '5f42c290cf21ba350a611229659bff86', '1');
INSERT INTO `coupon` VALUES ('167', 'd2ac6b2498fc22f887b653a682d550ea', '1');
INSERT INTO `coupon` VALUES ('168', '801c72fd345c97e8b8798853ef2b9aba', '1');
INSERT INTO `coupon` VALUES ('169', 'c697f9cef8118d068573634eba895397', '1');
INSERT INTO `coupon` VALUES ('170', 'aab2c7006086b1989196d91fdd1c3a7a', '1');
INSERT INTO `coupon` VALUES ('171', '3160ea537590043e748710b50da0b221', '1');
INSERT INTO `coupon` VALUES ('172', '1599b0ec21f4ffb97e5abd48ce17857c', '1');
INSERT INTO `coupon` VALUES ('173', 'f3738357f5fd4414897977537657c74e', '1');
INSERT INTO `coupon` VALUES ('174', '33cc241f9c4f8236ffef75568a8d0343', '1');
INSERT INTO `coupon` VALUES ('175', 'c2ef1938fc495953968f91d2c6affa80', '1');
INSERT INTO `coupon` VALUES ('176', '382cd9dfd0536bc7679eba7c920911a1', '1');
INSERT INTO `coupon` VALUES ('177', '0dc58ffdf009c494463aff7217c616d8', '1');
INSERT INTO `coupon` VALUES ('178', 'e6da6e52375f5875c688218814345853', '1');
INSERT INTO `coupon` VALUES ('179', '508e4e8b389fde63821619ba59f7cab3', '1');
INSERT INTO `coupon` VALUES ('180', 'f3818e24699a2f892689a04ebafa8951', '1');
INSERT INTO `coupon` VALUES ('181', 'f11b15cb2edc201026ddd3032e69b473', '1');
INSERT INTO `coupon` VALUES ('182', '698b217fef3e5b6bcba1567a4c29c327', '1');
INSERT INTO `coupon` VALUES ('183', 'd9a8966fefca8823a0e85b951a882a80', '1');
INSERT INTO `coupon` VALUES ('184', '3d0da57df02dfdc67d1ec8bdc96c6b4b', '1');
INSERT INTO `coupon` VALUES ('185', 'd8ebb8983d89b0b6263c7c16c2187f16', '1');
INSERT INTO `coupon` VALUES ('186', 'bb261346a0a44ba90e20e942d4c6c55e', '1');
INSERT INTO `coupon` VALUES ('187', '5b2873960b25b7de2cac88f4f7e214bd', '1');
INSERT INTO `coupon` VALUES ('188', 'd84f23950e666a4767ddb6e99f1b3c28', '1');
INSERT INTO `coupon` VALUES ('189', 'cb3aeb33db60af90b217021af0e39153', '1');
INSERT INTO `coupon` VALUES ('190', 'a36119981112ce29ab33eccd1bf1b0f2', '1');
INSERT INTO `coupon` VALUES ('191', '6507d7c630dfdf0079df8f8e1236645d', '1');
INSERT INTO `coupon` VALUES ('192', '4d73fcab91d5eb4ff58d2b3313c62b9d', '1');
INSERT INTO `coupon` VALUES ('193', '34321398cd97857975a3adad543f4bd5', '1');
INSERT INTO `coupon` VALUES ('194', '51ae2a9f3747132aebedcde4509707e4', '1');
INSERT INTO `coupon` VALUES ('195', '0cff9152e707e81227cb5efe782db053', '1');
INSERT INTO `coupon` VALUES ('196', '76920377ef4e0cfe2c6e77079a05cbd4', '1');
INSERT INTO `coupon` VALUES ('197', 'd9ccabb39972f2c1e749edaf67eeb70f', '1');
INSERT INTO `coupon` VALUES ('198', 'b1826c59373c55fce884a9c840289cc1', '1');
INSERT INTO `coupon` VALUES ('199', '785b5cfe758da31bf9c86202f0c9d42a', '1');
INSERT INTO `coupon` VALUES ('200', '76db4c777a677ffdb70baaa3bf087d4d', '1');
INSERT INTO `coupon` VALUES ('201', 'acb90cbb8a321c14b3deeb5377f8ca5e', '1');
INSERT INTO `coupon` VALUES ('202', '593bd9e8fb6e33352353cd094b786021', '1');
INSERT INTO `coupon` VALUES ('203', 'f0db89569c40280beec92e5f5a35f9ae', '1');
INSERT INTO `coupon` VALUES ('204', '16dedd4c868aa5cf35708f6709dca11a', '1');
INSERT INTO `coupon` VALUES ('205', '0674922be61cf5c35bf06e46338dc100', '1');
INSERT INTO `coupon` VALUES ('206', 'f98e5f5a8bf4eaa09f129f686ff1fbcc', '1');
INSERT INTO `coupon` VALUES ('207', '947225ccf8aeff6ec5d1886ab4ce8bfe', '1');
INSERT INTO `coupon` VALUES ('208', 'd031bfde8d17f9583336cc114b044755', '1');
INSERT INTO `coupon` VALUES ('209', 'dd716268909ba77bbba0c56ccb5f1fef', '1');
INSERT INTO `coupon` VALUES ('210', '0597d5b43c63f973897339bf26101903', '1');
INSERT INTO `coupon` VALUES ('211', '7f6aaaeb220c3c539b7cd175a15183aa', '1');
INSERT INTO `coupon` VALUES ('212', 'e661cf321b29d9790cf8cf4792f32729', '1');
INSERT INTO `coupon` VALUES ('213', '61f5f09aa1fed1fed691df825ea1237c', '1');
INSERT INTO `coupon` VALUES ('214', '1920ac69706692366e32938a0083004f', '1');
INSERT INTO `coupon` VALUES ('215', '5839ad4dbf0927d32f507ce316bc7ac2', '1');
INSERT INTO `coupon` VALUES ('216', '4a72791420b4130dcca1e5a11bb10b8d', '1');
INSERT INTO `coupon` VALUES ('217', 'd087a42a9ac8470c0d4014f1bacfccfc', '1');
INSERT INTO `coupon` VALUES ('218', 'd6aef4919edafee535b35bfbf7d47159', '1');
INSERT INTO `coupon` VALUES ('219', '9d81de9c2f9b02cb1bef4e94237cca1f', '1');
INSERT INTO `coupon` VALUES ('220', 'ff15b30aab23b27aa2100109b0f0557c', '1');
INSERT INTO `coupon` VALUES ('221', '971273d695bb6a6f463fdfb670f8c414', '1');
INSERT INTO `coupon` VALUES ('222', '3e624282d4558b031c8e90f9298bd40b', '1');
INSERT INTO `coupon` VALUES ('223', '3095c8268d4f98749357c7bf82d216b8', '1');
INSERT INTO `coupon` VALUES ('224', '2b8d134cb623c1125671e61c8bfc1378', '1');
INSERT INTO `coupon` VALUES ('225', '7596782b402e9dfc1351638926ed7e65', '1');
INSERT INTO `coupon` VALUES ('226', '74edbb4959f8b90d1652bde5a364f522', '1');
INSERT INTO `coupon` VALUES ('227', '51b2a44f5d5b92e8bd92343c104cc2ca', '1');
INSERT INTO `coupon` VALUES ('228', 'c3ff09971aeb78b17e11ffa70fae8684', '1');
INSERT INTO `coupon` VALUES ('229', 'ee089b4c687a911523318fa9caeeb37d', '1');
INSERT INTO `coupon` VALUES ('230', '2acc7fb3040e6e4e51dcf8f54b33a366', '1');
INSERT INTO `coupon` VALUES ('231', 'bb23c9cddac0d81ec0d99383ac68e762', '1');
INSERT INTO `coupon` VALUES ('232', '67daf399818d94b08ecfc7d4ca57410e', '1');
INSERT INTO `coupon` VALUES ('233', 'b357c807bc761006d246cdc3c3744366', '1');
INSERT INTO `coupon` VALUES ('234', 'b8ab0882fcb1be5e8084273f3595daad', '1');
INSERT INTO `coupon` VALUES ('235', '6c3734b396f3b5c15716abcfa3cf65c6', '1');
INSERT INTO `coupon` VALUES ('236', '4eb4bd237f50cf706426f70b8ecc833b', '1');
INSERT INTO `coupon` VALUES ('237', '846ae00bc2572c34f34be96431accdd1', '1');
INSERT INTO `coupon` VALUES ('238', 'c75a346df244cdd3fecc481e198df2ee', '1');
INSERT INTO `coupon` VALUES ('239', '874b0e32fc16b5cdd0e37bc2961f3668', '1');
INSERT INTO `coupon` VALUES ('240', '22615fcd4d0e24a232b1cef8529b2f61', '1');
INSERT INTO `coupon` VALUES ('241', '8a79e55b8387e36d95f5a753d2d29881', '1');
INSERT INTO `coupon` VALUES ('242', '3acbb74149a2a126008f0b241623b346', '1');
INSERT INTO `coupon` VALUES ('243', '1332585ac665d18cebabce0d0a37f2cf', '1');
INSERT INTO `coupon` VALUES ('244', 'b14fb00d8778faf40bcd3abb4d55d311', '1');
INSERT INTO `coupon` VALUES ('245', '5f45688a3d4ed522be07c92e4432ed16', '1');
INSERT INTO `coupon` VALUES ('246', 'f3af7d35d795f1cfa3208551048ae1ba', '1');
INSERT INTO `coupon` VALUES ('247', 'e69ee7d53ab524fd1d4876e36d62bae5', '1');
INSERT INTO `coupon` VALUES ('248', '2f7cf29d4ffa3d8b0e775ee960ecf40d', '1');
INSERT INTO `coupon` VALUES ('249', 'afb7ba9d20450a06474a6b7ca56a5457', '1');
INSERT INTO `coupon` VALUES ('250', 'b87d65efb3ad0e8156fa98b31f6315b2', '1');
INSERT INTO `coupon` VALUES ('251', '1f127b05004c02cb8accbf3bbb1bf258', '1');
INSERT INTO `coupon` VALUES ('252', 'a8806a7fa519efb09f5e1d662957418e', '1');
INSERT INTO `coupon` VALUES ('253', '3f62d610adac92bbf2996bb4d8ff7657', '1');
INSERT INTO `coupon` VALUES ('254', '3f27b86e67b3bbcdf70aae6f81c926ca', '1');
INSERT INTO `coupon` VALUES ('255', 'abfcec716b8bab9cf1da431b18c6ae00', '1');
INSERT INTO `coupon` VALUES ('256', '6b1e66c68e84eb13778effaba01d3982', '1');
INSERT INTO `coupon` VALUES ('257', '84fbc900377f1cbd4501133b4b4e62fd', '1');
INSERT INTO `coupon` VALUES ('258', '25338a49164edb93dc7731c17ed42a68', '1');
INSERT INTO `coupon` VALUES ('259', '00f747c5c647953f65661f09f895564d', '1');
INSERT INTO `coupon` VALUES ('260', 'ca44fd8991c446ebca613e0782904efc', '1');
INSERT INTO `coupon` VALUES ('261', 'a587582dfa3f21f500a9488e4dcc7f4f', '1');
INSERT INTO `coupon` VALUES ('262', '65a6437c3b12d661bee8f833a8ae71b6', '1');
INSERT INTO `coupon` VALUES ('263', '47d6eeba8828062a8831b65a9688875d', '1');
INSERT INTO `coupon` VALUES ('264', '86e33d550dc162366a02003089ab9894', '1');
INSERT INTO `coupon` VALUES ('265', '95bdbab339c8b04be10ac23e237ce656', '1');
INSERT INTO `coupon` VALUES ('266', 'bc2684b1a8008f1213331d70ee8c50ec', '1');
INSERT INTO `coupon` VALUES ('267', '0ae4480f223036ae1929380352df7478', '1');
INSERT INTO `coupon` VALUES ('268', 'dc945e5b2f604ca2763878dc99f5251b', '1');
INSERT INTO `coupon` VALUES ('269', '2281a76e0c0651d6ab488acf31afd1e1', '1');
INSERT INTO `coupon` VALUES ('270', '7e317e1d1b994ec49d10fd72c706283f', '1');
INSERT INTO `coupon` VALUES ('271', 'a74ec5b75f90e1b0011f0909548cf69e', '1');
INSERT INTO `coupon` VALUES ('272', '929056c9442cf717bd70475249e93c60', '1');
INSERT INTO `coupon` VALUES ('273', '9b416be109adb2feb2f4ff189cfcd0f5', '1');
INSERT INTO `coupon` VALUES ('274', 'e350113047e82ceecb455c33c21ef32a', '1');
INSERT INTO `coupon` VALUES ('275', 'd1bb3ac24ae52d592e1169ca9d94d0c1', '1');
INSERT INTO `coupon` VALUES ('276', '6b493509c5c19808a77fd191eef01100', '1');
INSERT INTO `coupon` VALUES ('277', '4d60a32a1c10476a5e8a87870849987c', '1');
INSERT INTO `coupon` VALUES ('278', '569a60bc39d4a0a6f372037f9de81c4c', '1');
INSERT INTO `coupon` VALUES ('279', '50a5a1ebf3136b4deee76df47c36cca5', '1');
INSERT INTO `coupon` VALUES ('280', '906b98c1ec79c5a7d85a4e4d2b049e7d', '1');
INSERT INTO `coupon` VALUES ('281', '619d351b72d6cc382683cd8ba1e8ba4c', '1');
INSERT INTO `coupon` VALUES ('282', 'f35199c6a9216218903f02af7c7a54b0', '1');
INSERT INTO `coupon` VALUES ('283', '5b3891ae35632086ba8aa99ddfb3e796', '1');
INSERT INTO `coupon` VALUES ('284', 'e7981a94f959486043c78baba29acb98', '1');
INSERT INTO `coupon` VALUES ('285', '4d0861d3d037823761847ab4d5d0f025', '1');
INSERT INTO `coupon` VALUES ('286', 'fd38736b4c46ec0a274b1680609b6ff2', '1');
INSERT INTO `coupon` VALUES ('287', 'ece1a7679516ee4c13d32a4ca906991c', '1');
INSERT INTO `coupon` VALUES ('288', 'aa6def9949e9dd63dce20f466571081b', '1');
INSERT INTO `coupon` VALUES ('289', 'a3262b78926703b32777bf0a5420ac7c', '1');
INSERT INTO `coupon` VALUES ('290', '403aed2c83a7d7c0d1920fc4e3f5ab8b', '1');
INSERT INTO `coupon` VALUES ('291', '0a0092cc678c7bd7811aae42eb883092', '1');
INSERT INTO `coupon` VALUES ('292', '8edc3a6e98b9b6a4e7393fdb6f1d5985', '1');
INSERT INTO `coupon` VALUES ('293', '5757ff8af2959fb1913fc07a0ab19e98', '1');
INSERT INTO `coupon` VALUES ('294', '43f8c02d8dd4d43dc163ef02e9e97750', '1');
INSERT INTO `coupon` VALUES ('295', '5be25f7b2386f2e6c3246890daf66e54', '1');
INSERT INTO `coupon` VALUES ('296', 'f9562b5f93f24bfa3811bd0c8abe1b3f', '1');
INSERT INTO `coupon` VALUES ('297', 'c99c821ceb30bd08424f2808f57fe8b9', '1');
INSERT INTO `coupon` VALUES ('298', 'cfd08c83cdd911b9a9273a704293613e', '1');
INSERT INTO `coupon` VALUES ('299', '282dfde07e992748de81f1b7f8c48824', '1');
INSERT INTO `coupon` VALUES ('300', 'dd497326ba38c25c9c8d6df2cc990464', '1');
INSERT INTO `coupon` VALUES ('301', '11c8fa37a68c7600c3364aae09add36c', '1');
INSERT INTO `coupon` VALUES ('302', '2d71a09d61d3ab127bccf652b7cf7f67', '1');
INSERT INTO `coupon` VALUES ('303', '4595067408befc56f744476295a49a32', '1');
INSERT INTO `coupon` VALUES ('304', 'c46825d66bc9013cb8d98664b46cae0d', '1');
INSERT INTO `coupon` VALUES ('305', '162e48ef508a3084dfe7cb4a87718c03', '1');
INSERT INTO `coupon` VALUES ('306', 'c0d340cbd77189566a486647e876f85c', '1');
INSERT INTO `coupon` VALUES ('307', '51b832a69129797d9424fe5fceb2fd9e', '1');
INSERT INTO `coupon` VALUES ('308', 'db279ef66a29d53e9a69bd383091e26e', '1');
INSERT INTO `coupon` VALUES ('309', '647f8757e0d6bc9267f98aa9b2685d56', '1');
INSERT INTO `coupon` VALUES ('310', '97c54a3896ca4f7675c9ce11c243df1c', '1');
INSERT INTO `coupon` VALUES ('311', 'd8ad7463f4fef3742d49665bf5b72348', '1');
INSERT INTO `coupon` VALUES ('312', '958bae247be47bb7b093b3296d742772', '1');
INSERT INTO `coupon` VALUES ('313', '728b1d9e83f8aebc7e89f7484561e818', '1');
INSERT INTO `coupon` VALUES ('314', 'fb515c329552640e151fa9bc09a35431', '1');
INSERT INTO `coupon` VALUES ('315', '06df25949170ccaedc2c0c908930de64', '1');
INSERT INTO `coupon` VALUES ('316', '8f9cfedf0ae510856110d2eea841e916', '1');
INSERT INTO `coupon` VALUES ('317', '5d123b61f23f201ff9bf62856850923f', '1');
INSERT INTO `coupon` VALUES ('318', '4cb7add1af8e11b6ce39a38f96f6f169', '1');
INSERT INTO `coupon` VALUES ('319', 'e2ac919bf990b5b76fa2ad40fd861c07', '1');
INSERT INTO `coupon` VALUES ('320', 'c293e6de66b24d0757c2be20df8917ae', '1');
INSERT INTO `coupon` VALUES ('321', '2e9f63af8b1463a0e1912dd01e5e8cea', '1');
INSERT INTO `coupon` VALUES ('322', 'b901cd3b1e9cb4dba44635615908646f', '1');
INSERT INTO `coupon` VALUES ('323', '685c4f5bba8de86f902b1028aa77ec3e', '1');
INSERT INTO `coupon` VALUES ('324', '27547ca50784fdbb5a6c42f2967aa90d', '1');
INSERT INTO `coupon` VALUES ('325', '9f65076e68475526350fe68932e48cef', '1');
INSERT INTO `coupon` VALUES ('326', '25afce0a465b28b77c71aba19db9731e', '1');
INSERT INTO `coupon` VALUES ('327', '67768d933b95a379a8871b216418ee9d', '1');
INSERT INTO `coupon` VALUES ('328', '5a1c62ca5426efb7b9ea9953c8aa17c7', '1');
INSERT INTO `coupon` VALUES ('329', 'ec72e42bc72f620cf5801ef6f319809b', '1');
INSERT INTO `coupon` VALUES ('330', '2bc98c5d3cd2d7127453ae26c24b7b43', '1');
INSERT INTO `coupon` VALUES ('331', '968d1b1d2ee16f938f5823c01161e587', '1');
INSERT INTO `coupon` VALUES ('332', 'fac10946ef7806937cfd9a02ad51bafd', '1');
INSERT INTO `coupon` VALUES ('333', '04adc1e3a14eb5fa654770fc7fd077b1', '1');
INSERT INTO `coupon` VALUES ('334', '950d4f6b54c7319d533bbeb949cd1635', '1');
INSERT INTO `coupon` VALUES ('335', '69fdea932c6a10241f8aa4dff1422bb0', '1');
INSERT INTO `coupon` VALUES ('336', '37020a0b1df2f0028010acbd4f8a4672', '1');
INSERT INTO `coupon` VALUES ('337', '297e7dc1123d9cd42f61542ff6a45723', '1');
INSERT INTO `coupon` VALUES ('338', '59f93e8fe67930481b8ebf7ac071a2ff', '1');
INSERT INTO `coupon` VALUES ('339', '74f950a6f2f7a1b4ff4d04b9d0ded8dd', '1');
INSERT INTO `coupon` VALUES ('340', '5cf0b2caa72f87d196dd6b4a16b9b761', '1');
INSERT INTO `coupon` VALUES ('341', '0c35beb6d52944a2e8c4ee33517e22a0', '1');
INSERT INTO `coupon` VALUES ('342', '945bbde8a83ce9b217a342d930eb19b9', '1');
INSERT INTO `coupon` VALUES ('343', '1cb0e73b67175e743279f837a3199588', '1');
INSERT INTO `coupon` VALUES ('344', '1d06598fd4c25dd5ce4ad50b3b766e22', '1');
INSERT INTO `coupon` VALUES ('345', '73cb3907eb1dd5924282ac37dfa008fb', '1');
INSERT INTO `coupon` VALUES ('346', '3102132c7b1939025d8e50da6a9097dd', '1');
INSERT INTO `coupon` VALUES ('347', '8d4e7eab99697d70f46a556ec9f8f966', '1');
INSERT INTO `coupon` VALUES ('348', '7c421f56f3438a0a220fb6458f48b3e4', '1');
INSERT INTO `coupon` VALUES ('349', '6ab5ec04cd60019289585087d77b2ff1', '1');
INSERT INTO `coupon` VALUES ('350', 'd61692b67e04ce50b93abe5d4fdaca7b', '1');
INSERT INTO `coupon` VALUES ('351', '7ad5df9bc05e028d9caf036bae0e28c9', '1');
INSERT INTO `coupon` VALUES ('352', '3ad44bc9481ed283dcd1111df5ba776e', '1');
INSERT INTO `coupon` VALUES ('353', 'da74ac516fa6dea9f6a0fd6eba2fd54d', '1');
INSERT INTO `coupon` VALUES ('354', 'ea100c166a56166c596891f1e86300b5', '1');
INSERT INTO `coupon` VALUES ('355', '27c8b21fbb8f00e845e45ab589f0f80b', '1');
INSERT INTO `coupon` VALUES ('356', 'a5f2580bcd8d1703813c1305cac84e38', '1');
INSERT INTO `coupon` VALUES ('357', 'ba5cda2ae3f1cde26e6d30ab7106e918', '1');
INSERT INTO `coupon` VALUES ('358', '7885498388c7dceeac937df26f46fb7e', '1');
INSERT INTO `coupon` VALUES ('359', 'db002200bec17245d435814ae075c85c', '1');
INSERT INTO `coupon` VALUES ('360', '51776ecce43d7cd22a222c6b2bdce63e', '1');
INSERT INTO `coupon` VALUES ('361', 'f618e134095c2c0faec17e341378c076', '1');
INSERT INTO `coupon` VALUES ('362', '728c21abdd1f5030d535402b59e3c5b1', '1');
INSERT INTO `coupon` VALUES ('363', 'e9edc6ff41c2897543457bf4ba56ce66', '1');
INSERT INTO `coupon` VALUES ('364', '270817def41183c43f02af66890ca41f', '1');
INSERT INTO `coupon` VALUES ('365', 'cc791e8ce45a60f33531117775925672', '1');
INSERT INTO `coupon` VALUES ('366', '74d2f39ce9a3b18e2da4f12948e7828c', '1');
INSERT INTO `coupon` VALUES ('367', '3876737b951cc2ce50d19d4156b81b5d', '1');
INSERT INTO `coupon` VALUES ('368', '79a241dc93b890f04585404432a5465c', '1');
INSERT INTO `coupon` VALUES ('369', '7710bc279411eb345a85edb3f14d09f9', '1');
INSERT INTO `coupon` VALUES ('370', '6aff6f94257445e0e86ecd32089f910c', '1');
INSERT INTO `coupon` VALUES ('371', 'dce863f93e875f1c0f8a1b10d05075b7', '1');
INSERT INTO `coupon` VALUES ('372', 'e7e0cc9219199053ade97bc887d4723f', '1');
INSERT INTO `coupon` VALUES ('373', '08b5fa3494cd7b155fe66f48801c6890', '1');
INSERT INTO `coupon` VALUES ('374', '331a2164f460e3e1d41bf75969e64ce5', '1');
INSERT INTO `coupon` VALUES ('375', 'f1b6d8b848f43ca2c1449fa31f4805df', '1');
INSERT INTO `coupon` VALUES ('376', 'd46465ae26ffcb537d2a55b5174652cd', '1');
INSERT INTO `coupon` VALUES ('377', 'b0ac065b62a5e8261a0ceaf76c332f58', '1');
INSERT INTO `coupon` VALUES ('378', '1a5a87b3c5a98758b442717361323d6c', '1');
INSERT INTO `coupon` VALUES ('379', '19e85d3330c19f5c666f2eae60408d26', '1');
INSERT INTO `coupon` VALUES ('380', 'be3cd815b274f5aeffa2562794b5a470', '1');
INSERT INTO `coupon` VALUES ('381', 'f54f037021d4fc5b8a716093619237c0', '1');
INSERT INTO `coupon` VALUES ('382', '9b063c8252645fe2430a0552ac619261', '1');
INSERT INTO `coupon` VALUES ('383', '0b48a5e57822b3037d86eef326cfc827', '1');
INSERT INTO `coupon` VALUES ('384', 'a46052419e2a7d6ff7d2530a7021e034', '1');
INSERT INTO `coupon` VALUES ('385', 'c134671227ff5a2e7c2dd44f8199cb4d', '1');
INSERT INTO `coupon` VALUES ('386', 'c4ed6269a3e3fb17df875d11e08e2e14', '1');
INSERT INTO `coupon` VALUES ('387', 'f80e987258af648e9a7a74a9f071798c', '1');
INSERT INTO `coupon` VALUES ('388', 'd25f8bdaec9406848823a2c41f92af2d', '1');
INSERT INTO `coupon` VALUES ('389', '987f6657f616c2e014daca682f58f6d2', '1');
INSERT INTO `coupon` VALUES ('390', '88d9e23128ca882f065b37f2cb21643f', '1');
INSERT INTO `coupon` VALUES ('391', 'ef409cbec154f98363f81a540a59344a', '1');
INSERT INTO `coupon` VALUES ('392', '937d843a4d1d995de240d87eaa7bd1cf', '1');
INSERT INTO `coupon` VALUES ('393', '484f57872186efdb7940fbc6c8cd8992', '1');
INSERT INTO `coupon` VALUES ('394', '8177898ca27f04a831c427856cb260a6', '1');
INSERT INTO `coupon` VALUES ('395', '5766782fbeaf5e95c12ad7c9e7f49eac', '1');
INSERT INTO `coupon` VALUES ('396', 'c5114c309d5ca86dac2135b88a0a7725', '1');
INSERT INTO `coupon` VALUES ('397', 'f8c98cdba2e14a9f25e4953e78048249', '1');
INSERT INTO `coupon` VALUES ('398', '6939b88196a92070e8051a285a3a1895', '1');
INSERT INTO `coupon` VALUES ('399', 'f8581777c2d013f2678fd597929d5123', '1');
INSERT INTO `coupon` VALUES ('400', '6dd534e38d10f3037e0df2f62d2dc152', '1');
INSERT INTO `coupon` VALUES ('401', '87787d07caef42bd9be3ba5c938632ca', '1');
INSERT INTO `coupon` VALUES ('402', '54a81c027b980c472818f06b8e9790e9', '1');
INSERT INTO `coupon` VALUES ('403', '7842d4a60dbca6dec56646271680f8cf', '1');
INSERT INTO `coupon` VALUES ('404', 'e34ab70fa7b1dd7d46e4d5407e02db47', '1');
INSERT INTO `coupon` VALUES ('405', '3e2fdad9d762a19f49345b84b97a8629', '1');
INSERT INTO `coupon` VALUES ('406', 'e0e63f55c21a39c80f3684521bedbfd4', '1');
INSERT INTO `coupon` VALUES ('407', '9d252be6ffbb1830bcc4001383a4597d', '1');
INSERT INTO `coupon` VALUES ('408', '7286e9abf6a07e71e4d41424fa82e1a9', '1');
INSERT INTO `coupon` VALUES ('409', '638232318aab2e61449c82f4b5a9517e', '1');
INSERT INTO `coupon` VALUES ('410', '44edcc3d0aa5957871e5e6065bfc22fc', '1');
INSERT INTO `coupon` VALUES ('411', '4937b47042f088bca953d6d9322c6030', '1');
INSERT INTO `coupon` VALUES ('412', '02f5df8adf0db026d38425594e68a007', '1');
INSERT INTO `coupon` VALUES ('413', 'a3ba6667f3b15e1f0f976711f29052f1', '1');
INSERT INTO `coupon` VALUES ('414', '6d4172a36da6237fba32d39a9b7f0975', '1');
INSERT INTO `coupon` VALUES ('415', '74ec3ba98f516998f9da3879a0a3b42e', '1');
INSERT INTO `coupon` VALUES ('416', '847ab6e3586bfd4bef77aca701838cdf', '1');
INSERT INTO `coupon` VALUES ('417', '28da8cc30359c4c435c24c153f3a588c', '1');
INSERT INTO `coupon` VALUES ('418', '8c6048e78de8bb20713b9aa8409d4c3a', '1');
INSERT INTO `coupon` VALUES ('419', 'dcf2501f4521b38d9280f59cc9477df9', '1');
INSERT INTO `coupon` VALUES ('420', '90635794cc429c8b25442282808e54e7', '1');
INSERT INTO `coupon` VALUES ('421', 'f01c61f93943261df93d8c1d92391207', '1');
INSERT INTO `coupon` VALUES ('422', '89093de234f568add92411aa883c410b', '1');
INSERT INTO `coupon` VALUES ('423', 'b83a39c19b9a62ef048d30d3eaaf8af1', '1');
INSERT INTO `coupon` VALUES ('424', 'f7741642b4fb3cea3f9cc42f54b86bc4', '1');
INSERT INTO `coupon` VALUES ('425', '54035e3a329cb8026e74a716b44a2350', '1');
INSERT INTO `coupon` VALUES ('426', 'bd020be0f9ddb1ccc6769c037f1ffd3f', '1');
INSERT INTO `coupon` VALUES ('427', '8392cfa1ba851b4bf97301d6416725ac', '1');
INSERT INTO `coupon` VALUES ('428', 'f401d5ebacd2d88dcda0cf15b1224dda', '1');
INSERT INTO `coupon` VALUES ('429', '5fb8133a1ffb7e324c89bf49b623b9a5', '1');
INSERT INTO `coupon` VALUES ('430', 'd4e060ffc8cfe7ef9a5636b694989561', '1');
INSERT INTO `coupon` VALUES ('431', '86abadae66083747b648f9db35790fbe', '1');
INSERT INTO `coupon` VALUES ('432', '867a91b99f35c64a82ac578e5bcb07f8', '1');
INSERT INTO `coupon` VALUES ('433', '15a3e3bc7bf471c1afab5f3aaeb9db4a', '1');
INSERT INTO `coupon` VALUES ('434', '4f7f7a0f15ff03d6115a309a54155865', '1');
INSERT INTO `coupon` VALUES ('435', 'e2b32bc0c9e7840f175d904d662b4d6a', '1');
INSERT INTO `coupon` VALUES ('436', 'e7dd0c20afab3bcd749f62378efc5a85', '1');
INSERT INTO `coupon` VALUES ('437', 'de888dd7dd40caa80e815df55967dcc9', '1');
INSERT INTO `coupon` VALUES ('438', 'c945e31be90cab8bb09f60256705917b', '1');
INSERT INTO `coupon` VALUES ('439', '0bed0202216cc5b97e450d9e6e6ca797', '1');
INSERT INTO `coupon` VALUES ('440', 'd87d31e5c2eec5cd7e3e7d0932af72d6', '1');
INSERT INTO `coupon` VALUES ('441', '70c6e4113f5682258b7d3eae6f4e358b', '1');
INSERT INTO `coupon` VALUES ('442', '6a49d6a41476cf5ced04600941243b11', '1');
INSERT INTO `coupon` VALUES ('443', '711e225d22b9ab963fe95b0e3a28a590', '1');
INSERT INTO `coupon` VALUES ('444', '4db75d0ef5bdfd7ac20bb00ae2ffd5e5', '1');
INSERT INTO `coupon` VALUES ('445', 'da0b304b42e7d61e473888461c687343', '1');
INSERT INTO `coupon` VALUES ('446', '4e25ab643b0ee1187fcdbb5d7b579c60', '1');
INSERT INTO `coupon` VALUES ('447', 'e930b07fefeb85b2de336e4abe095856', '1');
INSERT INTO `coupon` VALUES ('448', '3529b20321508d579b96482376e24d54', '1');
INSERT INTO `coupon` VALUES ('449', '8be2b8f7ced8aeea724350f82168f62f', '1');
INSERT INTO `coupon` VALUES ('450', '486855f1ed44c7576ba0e49bb37c343c', '1');
INSERT INTO `coupon` VALUES ('451', 'f7aa0091ef750adc4a813404539b1929', '1');
INSERT INTO `coupon` VALUES ('452', '15c4ed02a7f0d62f95e0809b97225300', '1');
INSERT INTO `coupon` VALUES ('453', '56ca7e5832b1972fb7ee39563da61df6', '1');
INSERT INTO `coupon` VALUES ('454', '105072f2b477dfe90a9476ce0a2e62c1', '1');
INSERT INTO `coupon` VALUES ('455', '3f1d08b1b7d5da1928e0f114429cdb26', '1');
INSERT INTO `coupon` VALUES ('456', 'd276f142bec4a55cc29db43b96d20d23', '1');
INSERT INTO `coupon` VALUES ('457', '6324ccb2547bee21f62c7c4e419c43b9', '1');
INSERT INTO `coupon` VALUES ('458', '9ef2cb527927100d75c7597cd74bca80', '1');
INSERT INTO `coupon` VALUES ('459', '8372bfa15d4864a8a7cc4a8e6019b5f3', '1');
INSERT INTO `coupon` VALUES ('460', 'ccaf149b73876a021f7035fcb5a26bf7', '1');
INSERT INTO `coupon` VALUES ('461', '35462e4d53c079e2f7c0e7e41d9dc196', '1');
INSERT INTO `coupon` VALUES ('462', 'e1f58dcf6eac197f572fa4322e7991ee', '1');
INSERT INTO `coupon` VALUES ('463', '56ff1776cc74a19fceb458b669a22238', '1');
INSERT INTO `coupon` VALUES ('464', '0917fde52ec4bbe65cce764d598867be', '1');
INSERT INTO `coupon` VALUES ('465', 'afe956417a6283b2723f711366cb37e6', '1');
INSERT INTO `coupon` VALUES ('466', 'e2285ac3ecd5194fa5dcbcd9bdfd81dc', '1');
INSERT INTO `coupon` VALUES ('467', '511e47ecfea1ea844bdc7a2113c782e7', '1');
INSERT INTO `coupon` VALUES ('468', 'ea5cacb51e189b312d11cbaa7b16f58c', '1');
INSERT INTO `coupon` VALUES ('469', 'fd0f8c3cc206c2242fc9e5ebcb8445f0', '1');
INSERT INTO `coupon` VALUES ('470', '90d12d4a3e77023174e1e9fe32017156', '1');
INSERT INTO `coupon` VALUES ('471', '55bcad946e2b0e28c3001328b34f55e8', '1');
INSERT INTO `coupon` VALUES ('472', '06ac799bbe2a9f3a3a5ae5d2eccf593f', '1');
INSERT INTO `coupon` VALUES ('473', '1dfc21da18af38edce4409f22e9316b9', '1');
INSERT INTO `coupon` VALUES ('474', 'e73a8e1506ada00efe55ce5d6af92078', '1');
INSERT INTO `coupon` VALUES ('475', '63185aabdeac457ab3895f0df96f8202', '1');
INSERT INTO `coupon` VALUES ('476', 'cdd820a064f15201ff67073b98ec131f', '1');
INSERT INTO `coupon` VALUES ('477', '16ebfd3c91eb884654617dd6437e8c21', '1');
INSERT INTO `coupon` VALUES ('478', '4fce8946a90c7ee0825e872d316962c3', '1');
INSERT INTO `coupon` VALUES ('479', '6bd54dafad6a57c3e981b5da058c0335', '1');
INSERT INTO `coupon` VALUES ('480', '1081754eda39ebf3e88cd37e580d9023', '1');
INSERT INTO `coupon` VALUES ('481', '9be09619ec1d70287af7729850e8bd80', '1');
INSERT INTO `coupon` VALUES ('482', '5eb5a74ef1774d760d5da8b4510f1e61', '1');
INSERT INTO `coupon` VALUES ('483', '081c81fa105f9969e91ce67945ad2500', '1');
INSERT INTO `coupon` VALUES ('484', '7ad8eda147ef385f270791b3f04d83fb', '1');
INSERT INTO `coupon` VALUES ('485', 'a02a18904848ef5298bc39bd1d12b50b', '1');
INSERT INTO `coupon` VALUES ('486', 'e6e021d58ee83ecc422386481a4c9601', '1');
INSERT INTO `coupon` VALUES ('487', 'e02592754c3697f1ea3e2d06d19b4764', '1');
INSERT INTO `coupon` VALUES ('488', 'dff0a57aa44e7a8170555d54b6fce3fd', '1');
INSERT INTO `coupon` VALUES ('489', 'ef1715b38354613d28216a848815eca4', '1');
INSERT INTO `coupon` VALUES ('490', 'e1a5070c9541dc6abaded6c8bd3e965b', '1');
INSERT INTO `coupon` VALUES ('491', '1379cc06261f139228b302f7a5aec53c', '1');
INSERT INTO `coupon` VALUES ('492', 'af016dcc2ec7745d81fbc19fd580d157', '1');
INSERT INTO `coupon` VALUES ('493', '61b5f1e3e9a4dd405ca346719fed4d87', '1');
INSERT INTO `coupon` VALUES ('494', '6a011737145e0f4f8c90f58ddcbaeafd', '1');
INSERT INTO `coupon` VALUES ('495', '40818c062b6489d41033347775e7b34d', '1');
INSERT INTO `coupon` VALUES ('496', 'b1fa702c527ba867d7a6b574c9c98906', '1');
INSERT INTO `coupon` VALUES ('497', '233de646649f83759d89d421b6adcb08', '1');
INSERT INTO `coupon` VALUES ('498', 'b3e05c9fd267830552bf7d0d3f698673', '1');
INSERT INTO `coupon` VALUES ('499', 'bfaa579df123cc7f9c7fb090610b0c4d', '1');
INSERT INTO `coupon` VALUES ('500', 'a854f1ade2abb608b1bda74fc074da5f', '1');
INSERT INTO `coupon` VALUES ('501', '4b9a29d4722f33a54841cb34e3cedc34', '1');

-- ----------------------------
-- Table structure for data_role
-- ----------------------------
DROP TABLE IF EXISTS `data_role`;
CREATE TABLE `data_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件数据规则名',
  `en_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件数据规则字段',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_role
-- ----------------------------
INSERT INTO `data_role` VALUES ('1', '最新发布', 'create_time', 'order');
INSERT INTO `data_role` VALUES ('2', '点赞最高', 'fabulou_count', 'order');
INSERT INTO `data_role` VALUES ('3', '浏览数最高', 'played_count', 'order');
INSERT INTO `data_role` VALUES ('4', '置顶', 'is_top', 'where');
INSERT INTO `data_role` VALUES ('5', '免费', 'is_free', 'where');
INSERT INTO `data_role` VALUES ('7', '评论最高', 'comments', 'comments');
INSERT INTO `data_role` VALUES ('8', '随机', 'rand', 'rand');

-- ----------------------------
-- Table structure for key_words
-- ----------------------------
DROP TABLE IF EXISTS `key_words`;
CREATE TABLE `key_words` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `control_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_rel` int(1) NOT NULL DEFAULT '1' COMMENT '是否已经关联过组件（默认 1 ->未关联 2-> 已关联）',
  `status` int(11) NOT NULL DEFAULT '1',
  `follow_num` int(11) NOT NULL DEFAULT '0' COMMENT '关注数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of key_words
-- ----------------------------
INSERT INTO `key_words` VALUES ('20', '29', '成都', '美味 成都 小吃', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419162308b422a91ae7bb9101fbb2c0c9ddb2464f', '成都相关的美食', '1', '2', '1', '798');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('14', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('15', '2018_05_27_174853_create_articles_table', '1');
INSERT INTO `migrations` VALUES ('16', '2018_05_27_180725_create_article_categories_table', '1');
INSERT INTO `migrations` VALUES ('17', '2018_05_27_180950_create_expert_categories_table', '1');
INSERT INTO `migrations` VALUES ('18', '2018_05_27_181005_create_experts_table', '1');
INSERT INTO `migrations` VALUES ('19', '2018_05_27_181140_create_banners_table', '1');
INSERT INTO `migrations` VALUES ('20', '2018_05_27_181227_create_orders_table', '1');
INSERT INTO `migrations` VALUES ('21', '2018_05_27_181351_create_courses_table', '1');
INSERT INTO `migrations` VALUES ('22', '2018_05_27_181501_create_user_histories_table', '1');
INSERT INTO `migrations` VALUES ('23', '2018_05_27_181948_create_user_favorite_courses_table', '1');
INSERT INTO `migrations` VALUES ('24', '2018_05_27_182058_create_user_comments_table', '1');
INSERT INTO `migrations` VALUES ('25', '2018_05_28_205849_create_course_categories_table', '1');
INSERT INTO `migrations` VALUES ('26', '2018_05_28_210059_create_lessons_table', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `out_trade_no` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '本地生成订单号',
  `transaction_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付平台生成的订单号',
  `amount_payable` decimal(9,2) NOT NULL COMMENT '订单应付金额',
  `amount_paid` decimal(9,2) DEFAULT NULL COMMENT '订单实付金额',
  `pay_type` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式 1-微信,2-支付宝',
  `order_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单描述',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单状态 1-未支付、2-已支付、3-退款中、4-已退款、5-取消订单',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_end_time` timestamp NULL DEFAULT NULL COMMENT '支付成功时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `product_type` int(1) NOT NULL DEFAULT '1' COMMENT '购买的产品类型（1付费视频 2优惠券）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '58', '34', 'LN2019042111311349559897', '4200000336201904214326441477', '0.00', null, '1', '用户点播付费视频', '2', '支付成功！', '2019-04-21 11:31:43', '2019-04-21 11:31:13', null, '1');
INSERT INTO `orders` VALUES ('5', '58', '61', 'LN2019042118313151569955', null, '10.00', null, '1', '用户点播付费视频', '1', null, null, '2019-04-21 18:31:31', null, '1');
INSERT INTO `orders` VALUES ('6', '58', '57', 'LN2019042118323450102495', '4200000330201904215800957331', '0.01', '0.01', '1', '用户点播付费视频', '2', '支付成功！', '2019-04-21 18:32:59', '2019-04-21 18:32:34', null, '1');
INSERT INTO `orders` VALUES ('7', '58', '57', 'LN2019042118362052561015', null, '0.01', null, '1', '用户点播付费视频', '1', null, null, '2019-04-21 18:36:20', null, '1');
INSERT INTO `orders` VALUES ('8', '58', '57', 'LN2019042118362456541025', null, '0.01', null, '1', '用户点播付费视频', '1', null, null, '2019-04-21 18:36:24', null, '1');

-- ----------------------------
-- Table structure for page_cate
-- ----------------------------
DROP TABLE IF EXISTS `page_cate`;
CREATE TABLE `page_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_code` int(11) NOT NULL,
  `page_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_valid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of page_cate
-- ----------------------------
INSERT INTO `page_cate` VALUES ('1', '110', '关键词聚合', '0');
INSERT INTO `page_cate` VALUES ('2', '111', '个人中心', '0');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL COMMENT '名字',
  `desc` varchar(255) NOT NULL,
  `content` text,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序  正序排列',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1-显示，2-隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('26', '成都美食', '', null, '1', '1');
INSERT INTO `tags` VALUES ('28', '小吃', '', null, '2', '1');
INSERT INTO `tags` VALUES ('29', '夜宵', '', null, '3', '1');
INSERT INTO `tags` VALUES ('30', '成都特色', '', null, '4', '1');
INSERT INTO `tags` VALUES ('31', '探店', '', null, '5', '1');
INSERT INTO `tags` VALUES ('32', '饮品', '', null, '6', '1');

-- ----------------------------
-- Table structure for user_comments
-- ----------------------------
DROP TABLE IF EXISTS `user_comments`;
CREATE TABLE `user_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL COMMENT '课程章节id',
  `user_id` int(11) NOT NULL COMMENT '发布评论用户id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `zan` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `is_reported` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否被举报 1-正常，2-举报',
  `reported_type` tinyint(4) DEFAULT NULL COMMENT '1-广告, 2-色情, 3-过多相同内容',
  `is_show` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-显示, 2-隐藏',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_comments
-- ----------------------------

-- ----------------------------
-- Table structure for user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_coupon
-- ----------------------------
INSERT INTO `user_coupon` VALUES ('1', '34', '1', '2019-04-16 16:25:38');
INSERT INTO `user_coupon` VALUES ('2', '34', '2', '2019-04-16 16:25:44');

-- ----------------------------
-- Table structure for user_favorite_videos
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite_videos`;
CREATE TABLE `user_favorite_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `video_id` int(11) NOT NULL COMMENT '课程id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户喜欢';

-- ----------------------------
-- Records of user_favorite_videos
-- ----------------------------
INSERT INTO `user_favorite_videos` VALUES ('2', '9', '20', '2018-05-30 17:45:28', '2018-05-30 17:45:28');
INSERT INTO `user_favorite_videos` VALUES ('3', '3', '9', '2018-05-30 17:45:28', '2018-05-30 17:45:28');
INSERT INTO `user_favorite_videos` VALUES ('4', '3', '8', '2018-05-19 17:45:28', '2018-05-30 17:45:28');
INSERT INTO `user_favorite_videos` VALUES ('8', '10', '1', '2018-05-30 17:45:28', '2018-05-30 17:45:28');
INSERT INTO `user_favorite_videos` VALUES ('9', '7', '14', '2018-05-30 17:45:28', '2018-05-30 17:45:28');
INSERT INTO `user_favorite_videos` VALUES ('10', '5', '3', '2018-05-30 17:45:28', '2018-05-30 17:45:28');
INSERT INTO `user_favorite_videos` VALUES ('11', '8', '10', '2018-05-30 17:45:28', '2018-05-30 17:45:28');
INSERT INTO `user_favorite_videos` VALUES ('12', '7', '2', '2018-05-30 17:45:28', '2018-05-30 17:45:28');
INSERT INTO `user_favorite_videos` VALUES ('13', '4', '28', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('14', '10', '28', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('15', '7', '28', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('16', '18', '28', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('17', '18', '11', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('19', '18', '2', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('20', '18', '12', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('23', '18', '10', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('24', '7', '1', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('26', '3', '15', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('27', '3', '7', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('28', '6', '20', '2018-05-30 17:45:29', '2018-05-30 17:45:29');
INSERT INTO `user_favorite_videos` VALUES ('29', '7', '11', '2018-05-30 17:45:30', '2018-05-30 17:45:30');
INSERT INTO `user_favorite_videos` VALUES ('30', '6', '13', '2018-05-30 17:45:30', '2018-05-30 17:45:30');
INSERT INTO `user_favorite_videos` VALUES ('33', '1', '28', '2018-06-06 16:47:21', '2018-06-06 16:47:21');
INSERT INTO `user_favorite_videos` VALUES ('35', '1', '2', '2018-06-07 01:08:16', '2018-06-07 01:08:16');
INSERT INTO `user_favorite_videos` VALUES ('36', '1', '28', '2018-06-07 01:08:17', '2018-06-07 01:08:17');
INSERT INTO `user_favorite_videos` VALUES ('37', '1', '4', '2018-06-07 01:16:31', '2018-06-07 01:16:31');
INSERT INTO `user_favorite_videos` VALUES ('38', '1', '32', '2018-06-10 16:57:45', '2018-06-10 16:57:45');

-- ----------------------------
-- Table structure for user_focus_channels
-- ----------------------------
DROP TABLE IF EXISTS `user_focus_channels`;
CREATE TABLE `user_focus_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `channel_id` int(11) DEFAULT NULL COMMENT '被关注的用户ID',
  `key_words_id` int(11) DEFAULT NULL COMMENT '关注的关键词ID',
  `focus_type` int(1) NOT NULL DEFAULT '1' COMMENT '关注类型 （1用户 2关键词）',
  `is_valid` int(11) NOT NULL DEFAULT '1' COMMENT '默认 1关注 2取关',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户关注';

-- ----------------------------
-- Records of user_focus_channels
-- ----------------------------
INSERT INTO `user_focus_channels` VALUES ('1', '34', '42', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('4', '34', '43', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('5', '34', '44', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('6', '34', '47', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('7', '34', '48', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('8', '43', '34', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('9', '44', '34', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('10', '47', '34', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('11', '42', '47', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('12', '43', '47', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('13', '42', '48', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('14', '49', '34', null, '1', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('15', '34', null, '20', '2', '1', '2019-04-18 11:44:52', null);
INSERT INTO `user_focus_channels` VALUES ('16', '53', '7', null, '1', '2', '2019-04-18 15:46:20', null);
INSERT INTO `user_focus_channels` VALUES ('17', '54', '7', null, '1', '1', '2019-04-18 16:03:35', null);

-- ----------------------------
-- Table structure for user_histories
-- ----------------------------
DROP TABLE IF EXISTS `user_histories`;
CREATE TABLE `user_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `video_id` int(11) NOT NULL COMMENT '视频章节id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户足迹';

-- ----------------------------
-- Records of user_histories
-- ----------------------------
INSERT INTO `user_histories` VALUES ('1', '55', '60', '2019-04-19 15:15:39', null);
INSERT INTO `user_histories` VALUES ('2', '55', '57', '2019-04-19 15:16:00', null);
INSERT INTO `user_histories` VALUES ('3', '55', '55', '2019-04-19 15:16:37', null);
INSERT INTO `user_histories` VALUES ('4', '58', '39', '2019-04-19 16:53:52', null);
INSERT INTO `user_histories` VALUES ('5', '57', '43', '2019-04-19 18:09:39', null);
INSERT INTO `user_histories` VALUES ('6', '57', '28', '2019-04-19 18:10:05', '2019-04-19 18:12:30');
INSERT INTO `user_histories` VALUES ('7', '57', '32', '2019-04-19 18:12:38', null);
INSERT INTO `user_histories` VALUES ('8', '57', '9', '2019-04-20 10:33:07', '2019-04-20 13:38:19');
INSERT INTO `user_histories` VALUES ('9', '55', '37', '2019-04-20 10:34:39', null);
INSERT INTO `user_histories` VALUES ('10', '55', '24', '2019-04-20 10:35:41', null);
INSERT INTO `user_histories` VALUES ('11', '57', '36', '2019-04-20 10:38:25', null);

-- ----------------------------
-- Table structure for user_published_msg_zans
-- ----------------------------
DROP TABLE IF EXISTS `user_published_msg_zans`;
CREATE TABLE `user_published_msg_zans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '类型 1-用户评论，2-用户回复',
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_published_msg_zans
-- ----------------------------
INSERT INTO `user_published_msg_zans` VALUES ('4', '1', '51', '1', '2018-06-06 22:51:01', '2018-06-06 22:51:01');
INSERT INTO `user_published_msg_zans` VALUES ('12', '2', '5', '1', '2018-06-06 22:59:30', '2018-06-06 22:59:30');
INSERT INTO `user_published_msg_zans` VALUES ('13', '1', '52', '1', '2018-06-06 23:22:03', '2018-06-06 23:22:06');
INSERT INTO `user_published_msg_zans` VALUES ('14', '2', '8', '1', '2018-06-06 23:38:48', '2018-06-06 23:38:51');
INSERT INTO `user_published_msg_zans` VALUES ('15', '1', '6', '3', '2018-06-08 21:11:34', '2018-06-08 21:11:37');
INSERT INTO `user_published_msg_zans` VALUES ('17', '2', '10', '1', '2018-06-10 17:05:36', '2018-06-10 17:05:39');

-- ----------------------------
-- Table structure for user_replies
-- ----------------------------
DROP TABLE IF EXISTS `user_replies`;
CREATE TABLE `user_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL COMMENT '评论ID',
  `user_id` int(11) NOT NULL,
  `reply_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '回复@对方的用户id',
  `content` varchar(150) NOT NULL,
  `is_reported` tinyint(4) DEFAULT '1' COMMENT '是否被举报 1-正常，2-举报',
  `reported_type` tinyint(4) DEFAULT NULL,
  `zan` int(11) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '状态 1-显示, 2-隐藏',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='评论回复';

-- ----------------------------
-- Records of user_replies
-- ----------------------------
INSERT INTO `user_replies` VALUES ('1', '12', '2', '0', 'aaaa', '1', null, '0', '1', '2018-06-06 09:35:40', '2018-06-06 09:35:44');
INSERT INTO `user_replies` VALUES ('2', '48', '3', '0', 'bbbb', '1', null, '0', '1', '2018-06-06 09:37:59', '2018-06-06 09:38:01');
INSERT INTO `user_replies` VALUES ('3', '48', '5', '0', 'cccccc', '1', null, '0', '1', '2018-06-06 09:38:26', '2018-06-06 09:38:28');
INSERT INTO `user_replies` VALUES ('4', '48', '4', '0', 'ddddd', '2', null, '0', '1', '2018-06-07 21:39:05', '2018-06-06 11:15:50');
INSERT INTO `user_replies` VALUES ('5', '48', '6', '0', 'eeeeee', '1', null, '1', '1', '2018-06-06 09:39:28', '2018-06-06 22:59:30');
INSERT INTO `user_replies` VALUES ('6', '48', '7', '4', 'good good study, day day up', '1', null, '0', '1', '2018-06-06 11:50:43', '2018-06-06 11:50:43');
INSERT INTO `user_replies` VALUES ('7', '12', '44', '0', 'good good study, day day up', '1', null, '0', '1', '2018-06-06 11:52:01', '2018-06-06 11:52:01');
INSERT INTO `user_replies` VALUES ('8', '46', '47', '1', '222333', '1', null, '0', '1', '2018-06-06 17:52:03', '2018-06-06 17:52:03');
INSERT INTO `user_replies` VALUES ('9', '46', '49', '0', '4444444', '1', null, '0', '1', '2018-06-07 17:48:07', '2018-06-07 17:48:10');
INSERT INTO `user_replies` VALUES ('10', '42', '48', '0', 'so beautiful', '1', null, '0', '1', '2018-06-10 17:04:43', '2018-06-10 17:04:46');
INSERT INTO `user_replies` VALUES ('11', '53', '49', '0', '哈哈哈', '1', null, '0', '1', '2019-04-18 14:35:14', null);
INSERT INTO `user_replies` VALUES ('12', '53', '49', '0', 'tttt', '1', null, '0', '1', '2019-04-18 14:35:28', null);
INSERT INTO `user_replies` VALUES ('13', '53', '49', '0', 'pppppp', '1', null, '0', '1', '2019-04-18 14:35:53', null);

-- ----------------------------
-- Table structure for user_zan_record
-- ----------------------------
DROP TABLE IF EXISTS `user_zan_record`;
CREATE TABLE `user_zan_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '点赞的用户ID',
  `video_id` int(11) DEFAULT NULL COMMENT '点赞的产品ID',
  `comment_id` int(11) DEFAULT NULL COMMENT '点赞的评论ID',
  `reply_id` int(11) DEFAULT NULL COMMENT '点赞的回复ID',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '点赞类型 1产品 2评论 3回复',
  `is_valid` int(11) NOT NULL DEFAULT '1' COMMENT '1已点赞 2取消点赞',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_zan_record
-- ----------------------------
INSERT INTO `user_zan_record` VALUES ('1', '50', '28', '0', '0', '1', '2', '2019-04-18 11:24:35', null);
INSERT INTO `user_zan_record` VALUES ('2', '49', '28', '0', '0', '1', '2', '2019-04-18 14:22:34', null);
INSERT INTO `user_zan_record` VALUES ('3', '53', '28', '0', '0', '1', '1', '2019-04-18 15:47:31', null);
INSERT INTO `user_zan_record` VALUES ('4', '54', '28', '0', '0', '1', '1', '2019-04-18 16:30:27', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名字',
  `mobile` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户手机号',
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg' COMMENT '用户头像',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别, 1-男, 2-女, 0-保密，默认0',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '生日 Y-m-d H:i:s',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `signature` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个性化签名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区',
  `openid` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unionid` char(28) NOT NULL,
  `token` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_timestamp` datetime DEFAULT NULL COMMENT 'token过期时间',
  `user_type` int(1) NOT NULL DEFAULT '1' COMMENT '默认 1 真实用户 2 虚拟用户',
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '虚拟用户 1正常 2隐藏 真实用户 1正常 （待更新）',
  `poster` varchar(1000) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', '无可置疑◆', null, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1067549688,3057898185&fm=26&gp=0.jpg', '1', null, '', null, '2019-04-04 16:59:43', null, null, '', '', '', null, '2', '2019-04-16 11:45:04', '1', null);
INSERT INTO `users` VALUES ('3', '吥↘恠侑嗳↘', null, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1564415374,2271109336&fm=26&gp=0.jpg', '1', null, '', null, '2019-04-04 16:59:43', null, null, '', '', '', null, '2', '2019-04-16 11:45:07', '1', null);
INSERT INTO `users` VALUES ('4', '丶演绎悲伤', null, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1146104113,1143227989&fm=26&gp=0.jpg', '1', null, '', null, '2019-04-04 16:59:43', null, null, '', '', '', null, '2', '2019-04-16 11:45:11', '1', null);
INSERT INTO `users` VALUES ('5', '一生承诺', null, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2384105274,2615652270&fm=26&gp=0.jpg', '1', null, '', null, '2019-04-04 16:59:43', null, null, '', '', '', null, '2', '2019-04-16 11:45:15', '1', null);
INSERT INTO `users` VALUES ('6', '简单灬爱', null, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2824322229,2451625238&fm=26&gp=0.jpg', '1', null, '', null, '2019-04-04 16:59:43', null, null, '', '', '', null, '2', '2019-04-16 11:45:21', '1', null);
INSERT INTO `users` VALUES ('7', '舞动Dē灵魂￠', null, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1963706994,2216733363&fm=26&gp=0.jpg', '1', null, '', '顶替顶替', '2019-04-04 16:59:43', '2019-04-21 12:10:03', null, '', '', '', null, '2', '2019-04-21 12:10:03', '1', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904211209536cac79c97da2306b6ac1181c268e30a4');
INSERT INTO `users` VALUES ('55', 'wkyy', null, 'https://wx.qlogo.cn/mmopen/vi_32/2UXuSevhia94yJIkwLm94lXc8fje7xYYY5b3WHSAWibBAuZWr8khiabv06I6bZ0BOeWXicDibWl3ianv9c1iagiaA3hbSg/132', '1', null, null, null, '2019-04-19 15:13:05', null, 'China/Sichuan/Chengdu', 'ofLbm5fB4b9AaK1S_T4PWX1mczBA', 'o3Yaa1CHKD07LHpe_YXXu3ES4mZQ', '4189336fbf3e01bd7fa8007a842b2a60', null, '1', '2019-04-20 10:35:41', '1', null);
INSERT INTO `users` VALUES ('56', '那丶只是玩笑', null, 'https://wx.qlogo.cn/mmopen/vi_32/OgrIOuepQfeCn57sapf9Vz870syib8mNuC7F7HhDmXcQvDmWZFWKn6iaOGbB3I1I0K4R0qnENpHeqqzC2KYia0h7Q/132', '1', null, null, null, '2019-04-19 15:20:20', null, 'China/Sichuan/Chengdu', 'ofLbm5dYitRKjxmLyel4oiLXYuVM', 'o3Yaa1IVpRL4v3Ae1sOlbJ4yIs-0', '679a2d75c3d883ae8f9a35d0447f8c23', null, '1', '2019-04-19 15:20:20', '1', null);
INSERT INTO `users` VALUES ('57', 'Laputa', null, 'https://wx.qlogo.cn/mmopen/vi_32/Cyg2uiamJl9pEr3tJ52k7cdliaYwicS6mVALgklcMiazaoClicrY5tJpP3hNyibwTb7Fsics5n4URBaUEGZRFQOqWsjRA/132', '1', null, null, null, '2019-04-19 16:38:38', null, 'Iceland//', 'ofLbm5Qt-N84LtPchwZTbH-4f5lg', 'o3Yaa1OGqBs1deqYj4DhTlI9WuFE', '5bdc1890ebfe6c38dea974553fa33412', null, '1', '2019-04-20 13:38:19', '1', null);
INSERT INTO `users` VALUES ('58', 'callBack', null, 'https://wx.qlogo.cn/mmopen/vi_32/deePrBb8elkO4aNJHq43eznsy6QWrL8ErmtHreRYo0daFmAyAU0JWloAA0TSSp2Fpmy3ibVEeRnex4VkmjrwicaQ/132', '1', null, null, null, '2019-04-19 16:53:40', null, 'China/Sichuan/Chengdu', 'ofLbm5X9eJQcG1-okd1cAxePPSig', 'o3Yaa1G39oTv1WshVAETK4XANKis', '3dbc4fb2d7058284eae2c623ece1a6f8', null, '1', '2019-04-21 18:46:19', '1', null);

-- ----------------------------
-- Table structure for video_categories
-- ----------------------------
DROP TABLE IF EXISTS `video_categories`;
CREATE TABLE `video_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专家分类名字',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-发布, 2-隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of video_categories
-- ----------------------------
INSERT INTO `video_categories` VALUES ('2', '视频分类名字_2', '2');
INSERT INTO `video_categories` VALUES ('3', '视频分类名字_3', '1');
INSERT INTO `video_categories` VALUES ('4', '视频分类名字_4', '2');
INSERT INTO `video_categories` VALUES ('5', '视频分类名字_5', '1');
INSERT INTO `video_categories` VALUES ('6', '视频分类名字_6', '1');
INSERT INTO `video_categories` VALUES ('7', '视频分类名字_7', '1');
INSERT INTO `video_categories` VALUES ('8', '视频分类名字_8', '2');
INSERT INTO `video_categories` VALUES ('9', '视频分类名字_9', '1');
INSERT INTO `video_categories` VALUES ('10', '视频分类名字_10', '2');
INSERT INTO `video_categories` VALUES ('11', '视频分类名字_11', '1');
INSERT INTO `video_categories` VALUES ('12', '视频分类名字_12', '2');
INSERT INTO `video_categories` VALUES ('13', '视频分类名字_13', '2');
INSERT INTO `video_categories` VALUES ('14', '视频分类名字_14', '2');
INSERT INTO `video_categories` VALUES ('15', '工业设计', '1');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT NULL COMMENT '分类id',
  `channel_id` int(11) NOT NULL,
  `poster` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面图',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `desc` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `is_free` tinyint(4) DEFAULT '1' COMMENT '是否免费 1-免费，2-付费',
  `is_top` tinyint(3) DEFAULT '1' COMMENT '默认1不置顶 2置顶',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格，后面可能需要',
  `demo_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '试看视频链接',
  `demo_video_play_auth` text COLLATE utf8mb4_unicode_ci COMMENT '试看视频播放凭证',
  `demo_vod_video_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'OSS上传试看视频返回的videoId',
  `demo_duration` float DEFAULT NULL COMMENT '试看视频时长',
  `content_txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图文才有的（纯文本内容）',
  `tip_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '视频为播放地址，图文为html内容，图集url集参考image_url字段',
  `video_play_auth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '视频播放凭证',
  `vod_video_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'OSS上传视频返回的videoId',
  `duration` float DEFAULT NULL COMMENT '视频时长',
  `width` int(10) DEFAULT '0' COMMENT '视频宽',
  `height` int(10) DEFAULT '0' COMMENT '视频高',
  `is_valid` int(1) NOT NULL DEFAULT '0' COMMENT '-1异常 0不可用 1正常',
  `url_expires_time` bigint(20) DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图集、图文存储图片地址为json字符 视频付费提示图片地址',
  `shares_count` int(11) DEFAULT NULL COMMENT '分享数',
  `played_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前章节播放次数',
  `download_count` int(11) DEFAULT '0' COMMENT '下载数',
  `downloadable` tinyint(4) DEFAULT '1' COMMENT '是否可以下载 1-可以，2-不可以',
  `share_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方分享使用的名字，默认使用name字段',
  `share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享链接',
  `tag_list` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频标签，格式：["1","2","3"] ps：json字符',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 1-发布, 2-隐藏',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL COMMENT '推送时间（用户不填，给当前时间）',
  `fabulou_count` int(255) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1->视频 2->图集 3->图文',
  `is_vertical` int(1) NOT NULL DEFAULT '1' COMMENT '1横版 2竖版',
  `is_advertising` int(1) NOT NULL DEFAULT '1' COMMENT '默认1产品 2广告',
  PRIMARY KEY (`id`),
  KEY `url_expires_time` (`url_expires_time`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('17', null, '5', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419182820d418806b35e9062538c0c80d98faa1e8', '成都最巴适的三样菜和开胃西月城谭豆花', '适合成都小资人士的美味盛宴', '1', '2', null, null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/4414934f-16a20278ec5/4414934f-16a20278ec5.mp4?Expires=1557909624&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=d2L9E8vmAfMK3osfO%2FQSUBfbP%2Bw%3D', '', '', '63.3813', '1920', '1080', '1', '1558261703', null, null, '56361', '0', '1', null, null, '[\"31\",\"30\",\"26\"]', '1', '2019-04-15 16:40:44', '2019-04-19 18:28:23', '2019-04-12 19:33:17', '45', '1', '1', '1');
INSERT INTO `videos` VALUES ('18', null, '2', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191828036711625cb6d63c0f6ff63c82dd6df26d', '教你识别真假肥牛', '肥牛样式千万种，你能识别哪一种？', '2', '2', '0.00', null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/3063ac7a-16a2026aac8/3063ac7a-16a2026aac8.mp4?Expires=1557909566&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=7qQ2EYbRpXu6KWSOzUpMsWUkMbc%3D', '', '', '73.8346', '1920', '1080', '1', '1558261685', null, null, '32646', '0', '1', null, null, '[\"29\",\"28\",\"26\"]', '1', '2019-04-15 16:39:53', '2019-04-19 18:28:05', '2019-04-12 19:34:56', '555', '1', '1', '1');
INSERT INTO `videos` VALUES ('20', null, '3', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191827450ad4665db49199299dfdde70f52d6838', '这里的是家饕林餐厅和莲花府邸的美味', '传说中很值得让人心往的圣地', '1', '2', null, null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/5a6b7f22-16a20259d83/5a6b7f22-16a20259d83.mp4?Expires=1557909497&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=ap0eh8a5DwX%2BoknwLeeWy4D22lo%3D', '', '', '67.4773', '1920', '1080', '1', '1558261668', null, null, '15635', '0', '1', null, null, '[\"31\",\"28\",\"26\"]', '1', '2019-04-15 16:39:04', '2019-04-19 18:27:48', '2019-04-12 19:40:45', '123', '1', '1', '1');
INSERT INTO `videos` VALUES ('23', null, '4', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419180645610730f234f4e689fd4299a0e6434037', '成都当地特色菜', '百吃不腻的成都本地特色菜，想想口水都要溢出来', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/08.jpg\",\"imageDesc\":\"甜皮鸭\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/09.jpg\",\"imageDesc\":\"水煮牛肉\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/10.jpg\",\"imageDesc\":\"水煮肥牛\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/水煮肉片.jpg\",\"imageDesc\":\"水煮肉片\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/秋葵.jpg\",\"imageDesc\":\"白灼秋葵\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/豆腐.jpg\",\"imageDesc\":\"煎豆腐\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/夫妻肺片.jpg\",\"imageDesc\":\"夫妻肺片\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/口水鸡.jpg\",\"imageDesc\":\"口水鸡\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/红烧肉.jpg\",\"imageDesc\":\"红烧肉\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/麻婆豆腐.jpg\",\"imageDesc\":\"麻婆豆腐\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419180645610730f234f4e689fd4299a0e6434037\",\"imageDesc\":\"\"}]', null, '20541', '0', '1', null, null, '[\"31\",\"29\",\"28\",\"26\"]', '1', '2019-04-15 16:29:25', '2019-04-19 18:06:51', '2019-04-12 20:26:10', '456', '2', '1', '1');
INSERT INTO `videos` VALUES ('24', null, '5', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419182724eef1331975e408f86486ce0b63bb2169', '你可知道这家动虾吧和这里美味的泰式火锅？', '红红的虾虾是如何被人称赞美味的？', '1', '2', null, null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/1d2d72df-16a20246e46/1d2d72df-16a20246e46.mp4?Expires=1557909419&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=%2FSPx2Aa4lhG7A8eEt5wJSFJiXJU%3D', '', '', '69.376', '1920', '1080', '1', '1558261648', null, null, '45646', '0', '1', null, null, '[\"31\",\"28\",\"26\"]', '1', '2019-04-15 16:37:40', '2019-04-19 18:27:28', '2019-04-12 19:42:59', '678', '1', '1', '1');
INSERT INTO `videos` VALUES ('27', null, '6', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191900147fd50cbdeb14802a77591b1cfa87e49e', '成都人都在吃啥子？外地人来成都必看的美食地图！', '地处四川盆地的成都，冬天寒冷且太阳比较稀少，\r\n\r\n不知道是群山环绕湿气偏重的原因，还是为了简单方便，\r\n\r\n成都人离不开火锅，成都也是火锅店较多的城市之一。\r\n\r\n所以来成都游玩的人多数都要品尝一下火锅的魅力，', '1', '2', null, null, null, null, null, '地处四川盆地的成都，冬天寒冷且太阳比较稀少，不知道是群山环绕湿气偏重的原因，还是为了简单方便，成都人离不开火锅，成都也是火锅店较多的城市之一。所以来成都游玩的人多数都要品尝一下火锅的魅力，但是顿顿火锅、串串还是有点乏味， 那么来成都除了火锅和串串还能吃些什么美食呢？看看本地人是怎么吃的。  有一部分成都本地人很喜欢吃“苍蝇”馆子，并不是指有很多苍蝇的饭馆，而是老成都人的一种戏称。 指的是那些装修程度和卫生条件比不上精美饭店，但是味道好吃又实惠的街边老餐馆。“苍蝇”馆子里很多菜品是老成都人吃惯了的味道，麻婆豆腐、尖椒回锅、宫保鸡丁、鱼香肉丝、盐菜烧白等等经典成都菜品，    味道或许比成都景区的个别高档饭店还要符合成都本地人的口味。  成都人的“会吃”或许也可以从丰富的早餐中看出来，随处可见的小面馆， 种类和口味都比较多样的面条和抄手、米粉和米线，再加上包子、馒头、糕点、油条和豆浆等等， 几乎可以做到一周早餐不重样。成都本地人主要爱吃的几样面食有素椒杂酱面、担担面、甜水面、脆绍面、牛肉酸笋荞面还有燃面，肥肠米粉和牛肉米线也经常被“翻牌”。藤椒味的抄手又麻又爽口，吃完来口汤，鲜辣麻爽。   外地人可能会好奇成都人每天都吃些什么，看看这些本地人一般不说的美食秘籍，记住了吗？可以来成都吃吃看。', null, '<p>地处四川盆地的成都，冬天寒冷且太阳比较稀少，<br/></p><p>不知道是群山环绕湿气偏重的原因，还是为了简单方便，</p><p>成都人离不开火锅，成都也是火锅店较多的城市之一。</p><p>所以来成都游玩的人多数都要品尝一下火锅的魅力，</p><p>但是顿顿火锅、串串还是有点乏味，</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041916494355207461430015aeadcc00a94c2b3ca2\"/></p><p>那么来成都除了火锅和串串还能吃些什么美食呢？看看本地人是怎么吃的。&nbsp; 有一部分成都本地人很喜欢吃“苍蝇”馆子，</p><p>并不是指有很多苍蝇的饭馆，而是老成都人的一种戏称。</p><p>&nbsp;</p><p>指的是那些装修程度和卫生条件比不上精美饭店，但是味道好吃又实惠的街边老餐馆。</p><p>“苍蝇”馆子里很多菜品是老成都人吃惯了的味道，</p><p>麻婆豆腐、尖椒回锅、宫保鸡丁、鱼香肉丝、盐菜烧白等等经典成都菜品，</p><p>&nbsp;&nbsp;</p><p>&nbsp;&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555069622.jpg\"/></p><p><br/></p><p>味道或许比成都景区的个别高档饭店还要符合成都本地人的口味。&nbsp; 成都人的“会吃”或许也可以从丰富的早餐中看出来，随处可见的小面馆，</p><p>&nbsp;</p><p>种类和口味都比较多样的面条和抄手、米粉和米线，</p><p>再加上包子、馒头、糕点、油条和豆浆等等，</p><p>&nbsp;</p><p>几乎可以做到一周早餐不重样。</p><p>成都本地人主要爱吃的几样面食有</p><p>素椒杂酱面、担担面、甜水面、脆绍面、牛肉酸笋荞面还有燃面，</p><p>肥肠米粉和牛肉米线也经常被“翻牌”。</p><p>藤椒味的抄手又麻又爽口，吃完来口汤，鲜辣麻爽。&nbsp; &nbsp;外地人可能会好奇成都人每天都吃些什么，看看这些本地人一般不说的美食秘籍，记住了吗？可以来成都吃吃看。</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/2019041916494355207461430015aeadcc00a94c2b3ca2\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555069622.jpg\"]', null, '156416', '0', '1', null, null, '[\"31\",\"30\",\"26\"]', '1', '2019-04-15 16:29:27', '2019-04-19 19:00:16', '2019-04-12 19:47:42', '3434', '3', '1', '1');
INSERT INTO `videos` VALUES ('28', null, '7', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419180533e8f6b576ec7f11ed51aa4c101d74d2ae', '成都本地特色美食', '成都有名的美食大家都听说过不少，但是闻名不如见面，让我们一睹它们的芳容！', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/ty.jpg\",\"imageDesc\":\"老妈蹄花\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/e.jpg\",\"imageDesc\":\"青椒牛肉\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/川味.jpg\",\"imageDesc\":\"葱酱肉片\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/宫保鸡丁 (1).jpg\",\"imageDesc\":\"宫保鸡丁\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/宫保鸡丁 (2).jpg\",\"imageDesc\":\"宫保鸡丁\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/红烧肉.jpg\",\"imageDesc\":\"红烧肉\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/回锅肉.jpg\",\"imageDesc\":\"回锅肉\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/苦瓜炒肉.jpg\",\"imageDesc\":\"苦瓜肉片\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/麻婆豆腐 (1).jpg\",\"imageDesc\":\"麻婆豆腐\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/麻婆豆腐 (2).jpg\",\"imageDesc\":\"麻婆豆腐\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/冒菜.jpg\",\"imageDesc\":\"冒菜\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419180533e8f6b576ec7f11ed51aa4c101d74d2ae\",\"imageDesc\":\"\"}]', null, '14589', '0', '1', null, null, '[\"31\",\"26\"]', '1', '2019-04-15 16:29:28', '2019-04-19 18:05:37', '2019-04-12 20:26:34', '256', '2', '1', '1');
INSERT INTO `videos` VALUES ('29', null, '6', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419180304815e9f92db03f4374b07fd22fe435e1b', '成都特色美食', '成都美食闻名天下，如果你也是一个吃货，怎么能不去成都大开胃口吃上一番呢！', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/麻婆豆腐.jpg\",\"imageDesc\":\"麻婆豆腐\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/123.jpg\",\"imageDesc\":\"麻辣牛肉\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/夫妻肺片.jpg\",\"imageDesc\":\"夫妻肺片\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/口水鸡.jpg\",\"imageDesc\":\"口水鸡\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/毛血旺.jpg\",\"imageDesc\":\"毛血旺\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/牛蛙.jpg\",\"imageDesc\":\"麻辣水煮美蛙\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/水煮鱼片.jpg\",\"imageDesc\":\"水煮鱼片\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/虾.jpg\",\"imageDesc\":\"三汁焖虾\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/蒸蛋羹.jpg\",\"imageDesc\":\"肉沫蛋羹\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419180304815e9f92db03f4374b07fd22fe435e1b\",\"imageDesc\":\"\"}]', null, '32587', '0', '1', null, null, '[\"31\",\"30\",\"28\",\"26\"]', '1', '2019-04-15 16:29:31', '2019-04-19 18:03:10', '2019-04-12 20:26:50', '789', '2', '1', '1');
INSERT INTO `videos` VALUES ('30', null, '5', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191827066dbc37428286936b3548753be8ea50fb', '开心糖水铺告诉你为什么会让你开心', '不要觉得成都喝的少，其实喝的还是蛮多的哈', '1', '1', null, null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/4c56e7eb-16a2023a5b6/4c56e7eb-16a2023a5b6.mp4?Expires=1557909368&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=CXocWp53f8XHX3Tk23U4yRpkQBc%3D', '', '', '78.2506', '1920', '1080', '1', '1558261630', null, null, '54231', '0', '1', null, null, '[\"32\",\"30\",\"28\"]', '1', '2019-04-15 16:36:37', '2019-04-19 18:27:10', '2019-04-12 20:28:30', '1212', '1', '1', '1');
INSERT INTO `videos` VALUES ('31', null, '4', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174746060569a0c419cdf35920040fe721ae71', '成都串串', '有成都串串辣中带香，整个红汤锅底刚端上桌的时候，闻不到一点浓烈的味道的，锅底的香味是在火候的控制下经历预热、汤开、沸腾、熬煮才慢慢散发出来，锅底由纯天然的香料比例搭配而成，各种牛肉涮煮之后裹满牛油锅底的麻辣，肉质紧实弹嫩，蘸上干碟，一串一小口，连续吃个10串绝对是最过瘾的享受。\r\n\r\n', '1', '1', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174746060569a0c419cdf35920040fe721ae71\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175036f18f048307fcdb5f83a0f785aa680a67\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191750413ecf793cb5d99d5bc8f6027e283b55ac\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175045f9dfc1863b2b73fe3129d98eb0d5438c\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041917505152e7e0bbc906fdc42910d318c551ebef\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175057ce6c5216b14732b4041a664fb94e7ce8\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041917510109ba34a3037e26e3106a18fa96567d81\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191751055535f9790f9d2032abd974417fa97fe1\",\"imageDesc\":\"\"}]', null, '95463', '0', '1', null, null, '[\"31\",\"30\",\"29\",\"28\",\"26\"]', '1', '2019-04-15 16:29:33', '2019-04-19 17:51:08', '2019-04-12 21:27:29', '0', '2', '1', '1');
INSERT INTO `videos` VALUES ('32', null, '3', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191826319af4f7ae96f22fd89e37e112167370b8', '成都人对于锅盔的情有独钟', '在成都长大的人，几乎99%都不会没吃过锅盔', '1', '2', null, null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/31421962-16a2021d71b/31421962-16a2021d71b.mp4?Expires=1557909250&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=lnqw9DmAH5PB7wpUEe9LcweP7tA%3D', '', '', '61.8666', '1920', '1080', '1', '1558261597', null, null, '156132', '0', '1', null, null, '[\"31\",\"30\",\"28\",\"26\"]', '1', '2019-04-15 16:34:31', '2019-04-19 18:26:37', '2019-04-12 20:53:58', '961', '1', '1', '1');
INSERT INTO `videos` VALUES ('33', null, '2', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041918010544bb59ff24f9f0cda857906e0c37f2f0', '成都干锅', '干锅起源于四川德阳，口味麻辣鲜香。与火锅和汤锅相比，汤少，味更足。成都的干锅种类不少，味道也各有特色，并不是只有麻辣的特点，各种味道搭配得恰到好处，很浓郁、丰富，满口留香。', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (5).jpg\",\"imageDesc\":\"麻辣小龙虾\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (6).jpg\",\"imageDesc\":\"麻辣小龙虾\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (1).jpg\",\"imageDesc\":\"串串香\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (2).jpg\",\"imageDesc\":\"麻辣钉螺\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (3).jpg\",\"imageDesc\":\"麻辣小龙虾\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (4).jpg\",\"imageDesc\":\"麻辣小龙虾\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (7).jpg\",\"imageDesc\":\"烤大茄\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (8).jpg\",\"imageDesc\":\"干锅蹄花\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (9).jpg\",\"imageDesc\":\"烤芹菜\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (10).jpg\",\"imageDesc\":\"干锅鸡\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/0 (11).jpg\",\"imageDesc\":\"花椒烤鱼\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041918010544bb59ff24f9f0cda857906e0c37f2f0\",\"imageDesc\":\"\"}]', null, '35647', '0', '1', null, null, '[\"31\",\"30\",\"26\"]', '1', '2019-04-15 16:29:37', '2019-04-19 18:01:10', '2019-04-12 20:54:37', '0', '2', '1', '1');
INSERT INTO `videos` VALUES ('34', null, '3', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419182554ff36c66452232b4db96cfc2d1d04efd9', '吃货？吃客？反正这家的美食会告诉你答案', '不要觉得家常菜没得特色，来这家看哈三', '1', '2', null, null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/125508dd-16a23ec3613/125508dd-16a23ec3613.mp4?Expires=1557972844&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=n985XhcLmNajBpFKGcAIMmHp394%3D', '', '', '59.904', '1920', '1080', '1', '1558261557', null, null, '31241', '0', '1', null, null, '[\"31\",\"30\",\"26\"]', '1', '2019-04-16 10:15:11', '2019-04-19 18:25:57', '2019-04-12 20:57:09', '18', '1', '1', '1');
INSERT INTO `videos` VALUES ('35', null, '4', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419190002adc61f22fb714aa230989ee3a407daa0', '深扒成都鬼饮食！深夜出摊、环境西撇、美女帅哥还扎堆', '每到深夜，成都的小巷子里就会弥漫一股不同寻常的烟火气，\r\n\r\n成都本地人都不一定找得到这股深夜烟火气的踪迹，\r\n\r\n那些习惯深夜出来觅食的吃货可能摸得清门路。', '1', '2', null, null, null, null, null, ' 每到深夜，成都的小巷子里就会弥漫一股不同寻常的烟火气，成都本地人都不一定找得到这股深夜烟火气的踪迹，那些习惯深夜出来觅食的吃货可能摸得清门路。 这就是被现在的年轻人称为成都深夜食堂的“鬼”饮食。“鬼”饮食的其实是指在街上的餐馆都关门后，三更半夜出来的小摊子 有些成都人可能喜欢深夜出来觅食，然后这样的摊子上吃烤串喝夜啤酒聊天，一聊就是半夜。   随着慕名来成都品尝美食的游客越来越多，以前只有一部分成都人知道的“鬼”饮食，现在也变得越来越出名，下面有成都人告诉你比较具有代表性的“鬼”饮食一条街。   老成都绝版十一街，成都“鬼”饮食的发源地之一，复古的社区巴士、镌刻着时代气息的竹椅、老房子开的茶铺 还有“嬢嬢”们摆在树下的麻将桌，几乎每一个角落都在展示老成都的生活气息。很多叔叔嬢嬢们喜欢下午在这里打麻将喝茶，饿了就去吃一碗幺鸡面或者脆绍面。 到了晚上九点过，喜欢出来觅食的吃货和深夜出来摆的小摊摊遇上的时机刚刚好，夜啤酒、串串香、牛杂火锅和小龙虾一吃就是大半夜， 生活和工作的压力、城市里打拼的心酸在夜色掩盖下慢慢释放。麻辣烫、降龙爪爪、把把烧配上香软的蛋烘糕刚好抚慰深夜饥饿的胃。     晚上喜欢出来觅食的吃货们，来成都有口福了，释放压力的深夜食堂，成都“鬼”饮食了解一下吗？', null, '<p>&nbsp;</p><p>每到深夜，成都的小巷子里就会弥漫一股不同寻常的烟火气，</p><p>成都本地人都不一定找得到这股深夜烟火气的踪迹，</p><p>那些习惯深夜出来觅食的吃货可能摸得清门路。</p><p>&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419165730c67d8e4f26f381c214677f6c2310dd6c\"/></p><p>这就是被现在的年轻人称为成都深夜食堂的“鬼”饮食。</p><p>“鬼”饮食的其实是指在街上的餐馆都关门后，</p><p>三更半夜出来的小摊子</p><p><br/></p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555073842.jpg\"/></p><p><br/></p><p><br/></p><p>有些成都人可能喜欢深夜出来觅食，</p><p>然后这样的摊子上吃烤串喝夜啤酒聊天，一聊就是半夜。</p><p>&nbsp;&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555073853.jpg\"/></p><p>&nbsp;</p><p>随着慕名来成都品尝美食的游客越来越多，</p><p>以前只有一部分成都人知道的“鬼”饮食，</p><p>现在也变得越来越出名，</p><p>下面有成都人告诉你比较具有代表性的“鬼”饮食一条街。</p><p>&nbsp; &nbsp;老成都绝版十一街，成都“鬼”饮食的发源地之一，</p><p>复古的社区巴士、</p><p>镌刻着时代气息的竹椅、</p><p>老房子开的茶铺</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555073865.jpg\"/></p><p>还有“嬢嬢”们摆在树下的麻将桌，</p><p>几乎每一个角落都在展示老成都的生活气息。</p><p>很多叔叔嬢嬢们喜欢下午在这里打麻将喝茶</p><p>，饿了就去吃一碗幺鸡面或者脆绍面。</p><p><br/></p><p>&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555073878.jpg\"/></p><p>到了晚上九点过，喜欢出来觅食的吃货和深夜出来摆的小摊摊遇上的时机刚刚好，</p><p>夜啤酒、串串香、牛杂火锅和小龙虾一吃就是大半夜，</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555073884.jpg\"/></p><p><br/></p><p>生活和工作的压力、城市里打拼的心酸在夜色掩盖下慢慢释放。</p><p>麻辣烫、降龙爪爪、把把烧配上香软的蛋烘糕刚好抚慰深夜饥饿的胃。&nbsp;</p><p>&nbsp;&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555073890.jpg\"/></p><p>&nbsp; 晚上喜欢出来觅食的吃货们，来成都有口福了，释放压力的深夜食堂，成都“鬼”饮食了解一下吗？</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555073899.jpg\"/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/20190419165730c67d8e4f26f381c214677f6c2310dd6c\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555073842.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555073853.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555073865.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555073878.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555073884.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555073890.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555073899.jpg\"]', null, '543634', '0', '1', null, null, '[\"31\",\"30\",\"26\"]', '1', '2019-04-15 16:29:40', '2019-04-19 19:00:04', '2019-04-12 20:59:15', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('36', null, '5', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174658b124c413378c3e274067da1544dd31ec', '成都甜品小吃', '成都人的解辣法宝就是来一碗冰爽的冰粉。\r\n有人会问冰粉是什么？其实就是凉粉的一种，北方人喜欢凉拌凉粉，把它做成酸辣的味道。\r\n成都人就把这样的凉粉做成了小吃。当你在成都吃了一顿火锅，秘制的火锅底料，各种食材在里面翻滚，想想就是美滋滋，当你被辣的呲溜呲溜的时候，来一份冰冰爽爽的冰凉粉，一口下去，爽快！', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174658b124c413378c3e274067da1544dd31ec\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175121c91ae66b7dc6c1004f91ca9c42e0bf00\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175125a6380176a1ce5a1913caf68ad644e1f8\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175129bc7abbbb3170e732ecf4c5b9a2501ff7\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191751329a9d499d23d4e27b9cee262bf009a652\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175138f87201ca2ca40d31aa7786a9c334066f\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175142c9154e57b2d440987440279bea31d325\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175146d0c9d1b08abd6ae63bdfe4f9a5b6ddb7\",\"imageDesc\":\"\"}]', null, '55781', '0', '1', null, null, '[\"32\",\"31\",\"28\",\"26\"]', '1', '2019-04-15 16:29:41', '2019-04-19 17:51:54', '2019-04-12 21:14:35', '0', '2', '1', '1');
INSERT INTO `videos` VALUES ('37', null, '6', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191859484e439c203fcc6959ca7aa8fcecdfa09e', '三天游成都，怎么吃最过瘾？本地人攻略请收好', '为什么说成都是一座来了就不想走的城市呢？', '1', '2', null, null, null, null, null, '为什么说成都是一座来了就不想走的城市呢？ ，因为成都人好吃，喜欢安逸，热爱生活，琳琅满目的美食、隐于闹市中的生活情调、街边静谧的小酒馆， 有些来游玩的人会很喜欢这种安逸的氛围，也割舍不下成都的美食。那么来成都不知道吃什么？吃货来帮你安排，三天不重样的那种。   来成都的第一天早餐当然要来碗担担面了， 作为一些老成都人非常青睐的早餐，劲道的面加上花生碎、青豆、芝麻酱、辣椒油和肉末，吃进嘴里满口鲜香，最后喝一口店家附赠的面汤，俗话说得好：“原汤化原食”  吃货建议午餐可以去锦里吃火锅，来成都的第一顿正餐吃火锅很有意义， 很多老字号火锅店里会有专人表演变脸，吃着火锅欣赏表演， 仿佛自己就是在成都安逸生活的市民，不仅能感受到其丰富的饮食文化还能感受到博大精深的民俗文化。   中午的火锅可能还需要时间消化，晚餐找一家人多的成都菜馆点几个小菜喝点米酒也是不错的选择。   来成都的第二天，早餐可以尝试一下油茶，米糊伴着脆脆的撒子和花生，清淡而不寡淡。   如果不是特别在意主食，吃货觉得午餐在走走停停中用花样繁多的小吃代替也别有一番滋味。成都的地道小吃比较多， 有三大炮、红糖糍粑、叶儿粑、甜水面、冰粉、凉糕、蒸蒸糕等等。   夜幕降临找一家热闹的串串店，用一把把的签签填饱空虚的胃，边吃边“摆龙门阵”，又是一个安逸的夜晚。   在成都的第三天，吃货认为喜欢吃肥肠的人或许会爱上肥肠粉配军屯锅盔， 中午再来顿荤素搭配的骨汤冒菜，晚上去夜猫子夜市觅食，可能会发现更多喜欢的美食。   来成都玩三天不知道吃什么？吃货帮你这样安排满意吗？', null, '<p><br/></p><p><br/></p><p>为什么说成都是一座来了就不想走的城市呢？</p><p>&nbsp;，<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419165812239d1d0136edc0667e86bd510d072454\"/></p><p>因为成都人好吃，喜欢安逸，热爱生活</p><p>，琳琅满目的美食、隐于闹市中的生活情调、街边静谧的小酒馆，</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074169.jpg\"/></p><p>&nbsp;</p><p>有些来游玩的人会很喜欢这种安逸的氛围，也割舍不下成都的美食。</p><p>那么来成都不知道吃什么？</p><p>吃货来帮你安排，三天不重样的那种。&nbsp; &nbsp;</p><p><br/></p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074175.jpg\"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>来成都的第一天早餐当然要来碗担担面了，</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074184.jpg\"/></p><p>&nbsp;</p><p><br/></p><p><br/></p><p>作为一些老成都人非常青睐的早餐，</p><p>劲道的面加上花生碎、青豆、芝麻酱、辣椒油和肉末，</p><p>吃进嘴里满口鲜香，</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074192.jpg\"/></p><p>最后喝一口店家附赠的面汤，俗话说得好：“原汤化原食”&nbsp;</p><p>&nbsp;吃货建议午餐可以去锦里吃火锅，来成都的第一顿正餐吃火锅很有意义，</p><p><br/></p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074197.jpg\"/></p><p><br/></p><p><br/></p><p>很多老字号火锅店里会有专人表演变脸，吃着火锅欣赏表演，</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074203.jpg\"/></p><p>&nbsp;</p><p>仿佛自己就是在成都安逸生活的市民，</p><p>不仅能感受到其丰富的饮食文化</p><p>还能感受到博大精深的民俗文化。&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074210.jpg\"/>&nbsp;&nbsp;</p><p>中午的火锅可能还需要时间消化，</p><p>晚餐找一家人多的成都菜馆点几个小菜喝点米酒也是不错的选择。&nbsp;&nbsp;</p><p><br/></p><p><br/></p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074218.jpg\"/></p><p>&nbsp;来成都的第二天，早餐可以尝试一下油茶，米糊伴着脆脆的撒子和花生，清淡而不寡淡。&nbsp; &nbsp;</p><p><br/></p><p>如果不是特别在意主食，</p><p>吃货觉得午餐在走走停停中用花样繁多的小吃代替也别有一番滋味。</p><p>成都的地道小吃比较多，</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074226.jpg\"/></p><p>有三大炮、红糖糍粑、</p><p>叶儿粑、甜水面、冰粉、</p><p>凉糕、蒸蒸糕等等。&nbsp;</p><p>&nbsp; 夜幕降临找一家热闹的串串店，</p><p>用一把把的签签填饱空虚的胃，</p><p>边吃边“摆龙门阵”，又是一个安逸的夜晚。&nbsp;&nbsp;</p><p><br/></p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074232.jpg\"/></p><p><br/></p><p><br/></p><p>&nbsp;在成都的第三天，</p><p>吃货认为喜欢吃肥肠的人或许会爱上肥肠粉配军屯锅盔，</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074253.jpg\"/></p><p><br/></p><p><br/></p><p>中午再来顿荤素搭配的骨汤冒菜，</p><p>晚上去夜猫子夜市觅食，</p><p>可能会发现更多喜欢的美食。&nbsp; &nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074259.jpg\"/></p><p>来成都玩三天不知道吃什么？吃货帮你这样安排满意吗？</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/20190419165812239d1d0136edc0667e86bd510d072454\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074169.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074175.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074184.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074192.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074197.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074203.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074210.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074218.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074226.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074232.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074253.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074259.jpg\"]', null, '343244', '0', '1', null, null, '[\"31\",\"30\",\"28\",\"26\"]', '1', '2019-04-15 16:29:42', '2019-04-19 18:59:51', '2019-04-12 21:04:58', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('39', null, '7', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191859342eb06fd1e561f1d8ed55a6bdd263c15c', '一大波吃货即将占领成都这个夜市！150家小吃刷爆朋友圈', '距离骡马市地铁站出来大概1.5公里的地方，\r\n\r\n有一条历史悠久的老街——八宝街，\r\n\r\n白天看不出来有什么特别的，但是夜幕降临，这里会变得人山人海~~~', '1', '2', null, null, null, null, null, '距离骡马市地铁站出来大概1.5公里的地方，有一条历史悠久的老街——八宝街，白天看不出来有什么特别的，但是夜幕降临，这里会变得人山人海~~~ 那到底是什么吸引了成都人晚上的目光呢？ 你知道夜猫子夜市吗？让吃货带你见识见识成都的小吃聚集地。  接近150个摊位有两张嘴都吃不过来的美食，进门就先买个冷锅串串开开胃， 卤过的串串上面刷了辣酱，香辣爽口。但是夜猫子夜市聚集了美食也聚集了众多吃货，人来人往，还是要拿好穿串串的签签。  来了成都的夜猫子夜市怎么可以放过麻辣兔头呢？又麻又辣又香又入味是兔头的灵魂味道。 边走边啃，边啃边买，嘴啃麻了就来碗冰粉。 冰冰甜甜的吃到嘴里身心满足，抱着凉粉又想吃点填胃的咸味，那就来个锅盔， 里面可以夹猪肉、牛肉、凉拌耳片甚至是凉面，脆脆的面饼和好吃的馅儿，似乎是个很合适的搭配。  吃累了还可以逛逛夜猫子夜市里手工艺品的小摊子， 上面卖着各种变脸的小人儿、熊猫玩偶、脸谱面具等等可爱的小玩意儿。  夜猫子夜市里有吃东西的小桌子，眼明手快的或许能占领一两个小板凳， 买上香香软软的蛋烘糕和糯耙耙的香辣鸡爪爪坐在那吃也是美滋滋。 温馨提示，吃完要带走自己的垃圾哦，爱护环境人人有责。   来成都，晚上不知道吃什么？那你可能是没找到对的地方，夜猫子夜市可以了解一下。', null, '<p><br/></p><p>距离骡马市地铁站出来大概1.5公里的地方，</p><p>有一条历史悠久的老街——八宝街，</p><p>白天看不出来有什么特别的，但是夜幕降临，这里会变得人山人海~~~</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419170021363d12e07b30407c4baf5c15f7392a31\"/></p><p>&nbsp;</p><p><br/></p><p>那到底是什么吸引了成都人晚上的目光呢？</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074454.jpg\"/></p><p>&nbsp;</p><p><br/></p><p>你知道夜猫子夜市吗？让吃货带你见识见识成都的小吃聚集地。&nbsp; 接近150个摊位有两张嘴都吃不过来的美食，</p><p>进门就先买个冷锅串串开开胃，</p><p>&nbsp;</p><p>卤过的串串上面刷了辣酱，香辣爽口。</p><p>但是夜猫子夜市聚集了美食也聚集了众多吃货，</p><p>人来人往，还是要拿好穿串串的签签。&nbsp; 来了成都的夜猫子夜市怎么可以放过麻辣兔头呢？</p><p>又麻又辣又香又入味是兔头的灵魂味道。</p><p>&nbsp;</p><p><br/></p><p>边走边啃，边啃边买，嘴啃麻了就来碗冰粉。</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074459.jpg\"/></p><p>&nbsp;</p><p>冰冰甜甜的吃到嘴里身心满足，</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074480.jpg\"/></p><p>抱着凉粉又想吃点填胃的咸味，</p><p><br/></p><p>那就来个锅盔，</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074474.jpg\"/>&nbsp;</p><p>里面可以夹猪肉、牛肉、凉拌耳片甚至是凉面，</p><p><br/></p><p>脆脆的面饼和好吃的馅儿，</p><p>似乎是个很合适的搭配。&nbsp; 吃累了还可以逛逛夜猫子夜市里手工艺品的小摊子，</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074486.jpg\"/>&nbsp;</p><p>上面卖着各种变脸的小人儿、熊猫玩偶、脸谱面具等等可爱的小玩意儿。&nbsp; 夜猫子夜市里有吃东西的小桌子，</p><p>眼明手快的或许能占领一两个小板凳，</p><p><br/></p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074491.jpg\"/></p><p><br/></p><p>买上香香软软的蛋烘糕和糯耙耙的香辣鸡爪爪</p><p>坐在那吃也是美滋滋。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074496.jpg\"/></p><p>温馨提示，吃完要带走自己的垃圾哦，爱护环境人人有责。&nbsp; &nbsp;来成都，晚上不知道吃什么？那你可能是没找到对的地方，夜猫子夜市可以了解一下。</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/20190419170021363d12e07b30407c4baf5c15f7392a31\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074454.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074459.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074480.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074474.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074486.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074491.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074496.jpg\"]', null, '546334', '0', '1', null, null, '[\"31\",\"30\",\"28\",\"26\"]', '1', '2019-04-15 16:29:47', '2019-04-19 18:59:36', '2019-04-12 21:08:56', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('40', null, '7', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175403d0daf24a0bf4a4e5ac526e5554b13d14', '成都本地特色小吃', '不晓得大家有没有发现喃，几乎每家火锅店都有一个必点小吃，那就是红糖糍！软件上随便点开一家店，红糖糍粑的排名，仅仅在主打菜品之下，甚至在有的火锅店，有人专门为糍粑而去！', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175403d0daf24a0bf4a4e5ac526e5554b13d14\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041917543471804e022ab29e6b23ad656ceac508ec\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175438e48e42f6d908e4ea5e04fb19ffb7640d\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175443a20abb14d9aab9e89ae86d42d3e542c8\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175632a80ec35b053c55c551c0e8c98c156565\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191756371d154c9e8fff471d477099acf190764f\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191756464e58c16940267179870392da32bda965\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191756551177e676909d0371ff1c65085e282a8a\",\"imageDesc\":\"\"}]', null, '53793', '0', '1', null, null, '[\"30\",\"28\",\"26\"]', '1', '2019-04-12 21:14:17', '2019-04-19 17:56:59', '2019-04-12 21:14:17', '0', '2', '1', '1');
INSERT INTO `videos` VALUES ('41', null, '7', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191859189dfc248782c2ef24dd06d8b0a3e6ad20', '10大老成都小吃！这些才是真正的童年记忆！', '成都小吃的种类比较多，在那个物质生活刚刚好起来的年代，成都走街串巷卖小吃的小摊贩是很多老成都人儿时的记忆。下面就来盘点老成都的10个小吃，哪些是你的童年记忆呢？', '1', '2', null, null, null, null, null, '成都小吃的种类比较多，在那个物质生活刚刚好起来的年代，成都走街串巷卖小吃的小摊贩是很多老成都人儿时的记忆。下面就来盘点老成都的10个小吃，哪些是你的童年记忆呢？ 第一个蛋烘糕，软软的蛋烘糕可以夹土豆丝或者各种水果，小时候隔老远可以闻见蛋烘糕的香味。 第二个蒸蒸糕，米糕里面的颜值代表，小小一个，小时候总是舍不得一口吃完。 第三个糍粑冰粉，夏日解暑神器，心里燥热的时候大口吃凉凉的冰粉还不够的话，有时候还会把里面的冰块舀出来嚼。 第四个糖油果子，串成串油亮亮的，圆圆的果子被糖包着外面撒上一层芝麻。咬一口又脆又香又甜，或许还会有糖丝儿弄到嘴边。 第五个锅巴土豆，放学经过卖锅巴土豆的小摊子前，经常要和小伙伴合买一份，在摊子边巴巴地等着，土豆的外壳炸得焦香，拌上麻辣或者糖醋的酱料，加点折耳根，香得很。 第六个锅盔，印象中买锅盔总要等上一会，因为炸过的面皮还要放到炉子里烘烤一会。拿到手吃的第一口你大概会认同美食是需要一点时间等待的。 第七个三大炮，炸过的糯米团子在豌豆粉里滚一圈就不那么油腻了，再淋上红糖汁，吃起来比较香甜。 第八个油茶。早餐吃腻了豆浆包子馒头就可以换换口味吃点油茶，稠稠的米糊伴上脆脆的“撒子”，可能会不知不觉吃完一大碗。 第九个麻辣兔头，小时候不会啃兔头，对麻辣兔头的记忆还不是很深刻，长大后一边看剧一边啃兔头的时候才觉得这个原来还不错。 第十个叶儿粑，青绿色的团子看起来就很有食欲，甜的咸的都比较好吃，但是小时候只有清明节家里会做着吃，现在买到容易多了。 吃货们看过来，以上老成都的10个特色小吃，你吃过几个？', null, '<p><img class=\"loadingclass\" id=\"loading_junuhtyp\" src=\"https://cihe.katamao.com/static/assets/js/ueditor/themes/default/images/spacer.gif\" title=\"正在上传...\"/><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191702404f5f525ca4400000885f20265df0a861\"/></p><p><br/></p><p>成都小吃的种类比较多，在那个物质生活刚刚好起来的年代，成都走街串巷卖小吃的小摊贩是很多老成都人儿时的记忆。下面就来盘点老成都的10个小吃，哪些是你的童年记忆呢？</p><p>&nbsp;</p><p>第一个蛋烘糕，软软的蛋烘糕可以夹土豆丝或者各种水果，小时候隔老远可以闻见蛋烘糕的香味。</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074742.jpg\"/>&nbsp;</p><p>第二个蒸蒸糕，米糕里面的颜值代表，小小一个，小时候总是舍不得一口吃完。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074748.jpg\"/></p><p><br/></p><p>第三个糍粑冰粉，夏日解暑神器，心里燥热的时候大口吃凉凉的冰粉还不够的话，有时候还会把里面的冰块舀出来嚼。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074754.jpg\"/></p><p>第四个糖油果子，串成串油亮亮的，圆圆的果子被糖包着外面撒上一层芝麻。咬一口又脆又香又甜，或许还会有糖丝儿弄到嘴边。</p><p><br/></p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074760.jpg\"/></p><p><br/></p><p>第五个锅巴土豆，放学经过卖锅巴土豆的小摊子前，经常要和小伙伴合买一份，在摊子边巴巴地等着，土豆的外壳炸得焦香，拌上麻辣或者糖醋的酱料，加点折耳根，香得很。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074766.jpg\"/></p><p><br/></p><p>第六个锅盔，印象中买锅盔总要等上一会，因为炸过的面皮还要放到炉子里烘烤一会。拿到手吃的第一口你大概会认同美食是需要一点时间等待的。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074777.jpg\"/></p><p>第七个三大炮，炸过的糯米团子在豌豆粉里滚一圈就不那么油腻了，再淋上红糖汁，吃起来比较香甜。</p><p>&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074863.jpg\"/></p><p>第八个油茶。早餐吃腻了豆浆包子馒头就可以换换口味吃点油茶，稠稠的米糊伴上脆脆的“撒子”，可能会不知不觉吃完一大碗。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074871.jpg\"/></p><p><br/></p><p>第九个麻辣兔头，小时候不会啃兔头，对麻辣兔头的记忆还不是很深刻，长大后一边看剧一边啃兔头的时候才觉得这个原来还不错。</p><p>&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074879.jpg\"/></p><p>第十个叶儿粑，青绿色的团子看起来就很有食欲，甜的咸的都比较好吃，但是小时候只有清明节家里会做着吃，现在买到容易多了。</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555074887.jpg\"/>&nbsp;</p><p>吃货们看过来，以上老成都的10个特色小吃，你吃过几个？</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/201904191702404f5f525ca4400000885f20265df0a861\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074742.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074748.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074754.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074760.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074766.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074777.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074863.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074871.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074879.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555074887.jpg\"]', null, '543', '0', '1', null, null, '[\"30\",\"28\",\"26\"]', '1', '2019-04-12 21:17:34', '2019-04-19 18:59:23', '2019-04-12 21:17:34', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('42', null, '3', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419185854ffa94a20b2a042e759d8cb287c1f2dcb', '成都美食全攻略，假期旅行打卡必备哟', '​美景加美食，边走边吃，边吃边玩，这才是假期的正确打开方式。来成都旅行的人近年来越来越多，因为一年四季都有好吃的吃货们大概是不会放过有这么多美食的地方。假期想游成都但是懒得做攻略？别担心，吃货帮你做好了。\r\n\r\n ', '1', '2', null, null, null, null, null, '美景加美食，边走边吃，边吃边玩，这才是假期的正确打开方式。来成都旅行的人近年来越来越多，因为一年四季都有好吃的吃货们大概是不会放过有这么多美食的地方。假期想游成都但是懒得做攻略？别担心，吃货帮你做好了。 来成都的游客朋友可能会去游览一下风景优美的青城山，不过那里离市中心比较远，爬山又是耗费体力的事情，所以去之前可以选择吃一顿抗饿的火锅。 点上毛肚、鸭肠、肥牛、脑花再加酥肉、红糖糍粑、麻辣兔头等特色小吃，菜还没涮熟的时候可能会被外酥里嫩的酥肉和麻辣鲜香的兔头勾走味蕾，忍不住想多吃几盘。 这时候控制好自己的嘴才能享受到后头香浓的火锅，如果没吃主食有点不满足，可以吃碗火锅店的蛋炒饭，走之前来碗甜甜的醪糟小汤圆作为本顿火锅的圆满结尾。就可以饱饱地去爬山了。 想吃到正宗的成都菜可以选择小巷子里的饭馆，不大的店面人还比较多，进去可能会听到很多人在说方言，这就是成都本地人喜欢的“苍蝇”馆子，里面隐藏着成都菜的老味道，不一定所有人都喜欢吃，但还算正宗。 出去玩吃甜品小吃，可以尝试一下蛋烘糕，可以按自己口味选甜的馅儿或者咸的馅儿。喜欢甜食的人可能不想错过甜品豆花，滑嫩的豆花加上芋圆、仙草、葡萄干看起来比较香甜。 夏天的早餐可以吃碗油茶，清淡不油腻。午餐吃凉面加糍粑冰粉会比较解暑，伤心凉粉看着是凉拌的但是吃起来可能会辣的人汗流浃背。吃货的成都美食攻略，你学到了吗？假期旅游或许能用到。', null, '<p>美景加美食，边走边吃，边吃边玩，这才是假期的正确打开方式。来成都旅行的人近年来越来越多，因为一年四季都有好吃的吃货们大概是不会放过有这么多美食的地方。假期想游成都但是懒得做攻略？别担心，吃货帮你做好了。<br/></p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419170508767b2cd231538bdd8b538572bcd46805\"/></p><p>来成都的游客朋友可能会去游览一下风景优美的青城山，不过那里离市中心比较远，爬山又是耗费体力的事情，所以去之前可以选择吃一顿抗饿的火锅。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075552.jpg\"/></p><p>点上毛肚、鸭肠、肥牛、脑花再加酥肉、红糖糍粑、麻辣兔头等特色小吃，菜还没涮熟的时候可能会被外酥里嫩的酥肉和麻辣鲜香的兔头勾走味蕾，忍不住想多吃几盘。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075558.jpg\"/></p><p>这时候控制好自己的嘴才能享受到后头香浓的火锅，如果没吃主食有点不满足，可以吃碗火锅店的蛋炒饭，走之前来碗甜甜的醪糟小汤圆作为本顿火锅的圆满结尾。就可以饱饱地去爬山了。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075563.jpg\"/></p><p>想吃到正宗的成都菜可以选择小巷子里的饭馆，不大的店面人还比较多，进去可能会听到很多人在说方言，这就是成都本地人喜欢的“苍蝇”馆子，里面隐藏着成都菜的老味道，不一定所有人都喜欢吃，但还算正宗。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075568.jpg\"/></p><p>出去玩吃甜品小吃，可以尝试一下蛋烘糕，可以按自己口味选甜的馅儿或者咸的馅儿。喜欢甜食的人可能不想错过甜品豆花，滑嫩的豆花加上芋圆、仙草、葡萄干看起来比较香甜。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075575.jpg\"/></p><p>夏天的早餐可以吃碗油茶，清淡不油腻。午餐吃凉面加糍粑冰粉会比较解暑，伤心凉粉看着是凉拌的但是吃起来可能会辣的人汗流浃背。</p><p>吃货的成都美食攻略，你学到了吗？假期旅游或许能用到。</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/20190419170508767b2cd231538bdd8b538572bcd46805\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075552.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075558.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075563.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075568.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075575.jpg\"]', null, '342341', '0', '1', null, null, '[\"31\",\"30\",\"28\",\"26\"]', '1', '2019-04-12 21:26:57', '2019-04-19 18:58:56', '2019-04-12 21:26:57', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('43', null, '2', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041918583780d03691683018d1101d007cf5489a68', '成都人在夜里不睡觉，大家都去吃了什么美食？', '有人说来成都玩的乐趣之一是走街串巷找美食，由此可见可见成都美食在游客心中的占据地位。', '1', '2', null, null, null, null, null, '有人说来成都玩的乐趣之一是走街串巷找美食，由此可见可见成都美食在游客心中的占据地位。 作为美食之都，成都虽然较多大大小小的美食店，但是在吃货心中可能真正的美食是需要用心寻觅的，没有“吃”过长夜的人，难以领略深夜美食的魅力，这一点成都人可能会比较赞同。 听说有些成都人晚上不睡觉？那有可能是吃美食去了，那么成都人宵夜吃什么呢？不知道你有没有听说过“冷啖杯”？ 某些街道白天看起来没什么人，到了晚上九点过，陆陆续续出来可能会出来很多小摊子，卖着各种宵夜，这就是成都的“鬼饮食”，也有一部分老成都人叫“冷啖杯”，指的是夜晚坐在小摊子前吃的各种冷菜加上冰镇啤酒。深夜美食的魅力在于缓解一下生活压力，和三两个好友，吃菜喝酒聊天，一天中难得的放松时刻。 “冷啖杯”吃的东西包括很多成都人比较喜欢的现捞，类似于卤菜，大概的做法是卤过的肉和菜伴上辣椒等调料，装在盘子里，配着啤酒吃。有的成都人说“冷啖杯”的灵魂是兔头，卤过的兔头放在油锅里炸得酥脆，再将大量的辣椒、花椒等多种调料炒香均匀地抹在兔头的各个角落，放置一段时间，兔头的腥味基本上没有了，只剩下麻辣焦香。  饿了吃碗酸辣爽口的凉面，配上冷锅串串，冷锅串串一般的做法是将煮好的串串放凉来吃，方便又入味，比较适合宵夜。酒足饭饱后看看时间，可能已近深夜，是时候回去睡觉了，这就是成都人的宵夜。', null, '<p><br/></p><p>有人说来成都玩的乐趣之一是走街串巷找美食，由此可见可见成都美食在游客心中的占据地位。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419170620e6af6cec53804dedf1c25242d96567d9\"/></p><p>作为美食之都，成都虽然较多大大小小的美食店，但是在吃货心中可能真正的美食是需要用心寻觅的，没有“吃”过长夜的人，难以领略深夜美食的魅力，这一点成都人可能会比较赞同。</p><p>&nbsp;</p><p>听说有些成都人晚上不睡觉？那有可能是吃美食去了，那么成都人宵夜吃什么呢？不知道你有没有听说过“冷啖杯”？</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075903.jpg\"/>&nbsp;</p><p>某些街道白天看起来没什么人，到了晚上九点过，陆陆续续出来可能会出来很多小摊子，卖着各种宵夜，这就是成都的“鬼饮食”，也有一部分老成都人叫“冷啖杯”，指的是夜晚坐在小摊子前吃的各种冷菜加上冰镇啤酒。深夜美食的魅力在于缓解一下生活压力，和三两个好友，吃菜喝酒聊天，一天中难得的放松时刻。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075918.jpg\"/></p><p>“冷啖杯”吃的东西包括很多成都人比较喜欢的现捞，类似于卤菜，大概的做法是卤过的肉和菜伴上辣椒等调料，装在盘子里，配着啤酒吃。</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075924.jpg\"/></p><p>有的成都人说“冷啖杯”的灵魂是兔头，卤过的兔头放在油锅里炸得酥脆，再将大量的辣椒、花椒等多种调料炒香均匀地抹在兔头的各个角落，放置一段时间，兔头的腥味基本上没有了，只剩下麻辣焦香。</p><p>&nbsp;</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555075930.jpg\"/></p><p>饿了吃碗酸辣爽口的凉面，配上冷锅串串，冷锅串串一般的做法是将煮好的串串放凉来吃，方便又入味，比较适合宵夜。酒足饭饱后看看时间，可能已近深夜，是时候回去睡觉了，这就是成都人的宵夜。</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/20190419170620e6af6cec53804dedf1c25242d96567d9\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075903.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075918.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075924.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555075930.jpg\"]', null, '656545', '0', '1', null, null, '[\"31\",\"30\",\"26\"]', '1', '2019-04-12 21:32:35', '2019-04-19 18:58:40', '2019-04-12 21:32:35', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('44', null, '4', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419185820d9cc1199385be027323a22a884414778', '深夜放毒：成都有什么好吃的宵夜？这几种成都美食好吃到飞起！', '​美食与良宵不可辜负，成都夜生活比较重要的一个内容是吃宵夜。白天为生活努力工作、为未来努力学习，心里的压力无处释放，很多人可能会选择寄托给轻松的夜晚和深夜的美食。那么成都哪里有好吃的宵夜呢？你听说过九眼桥吗？', '1', '2', null, null, null, null, null, '美食与良宵不可辜负，成都夜生活比较重要的一个内容是吃宵夜。白天为生活努力工作、为未来努力学习，心里的压力无处释放，很多人可能会选择寄托给轻松的夜晚和深夜的美食。那么成都哪里有好吃的宵夜呢？你听说过九眼桥吗？ 美食配好酒，好酒度良宵，成都的夜生活交给九眼桥大概是不会失望的，街道的入口就是一个大红招牌的火锅店，火锅味道据说还不错， 吃完点个现做飞饼加一碗甜甜的醪糟汤圆，爽口解腻。 成都人对食物混搭可能比较有研究，只要能入口的就大都能串成串混着吃，或涮或煮或烤，因此去九眼桥看夜景喝夜啤酒的基本上都会去吃十字路口那家把把烧。 成都把把烧可能跟其他地方的烧烤有点区别，因为烧烤通常的做法是烤然后刷上统一的调料，但是成都把把烧通常的做法是不同的食物配不同的调料，这样吃起来别具风味，可以将每种食物的独特口味发挥出来，改变了某些传统烧烤的千篇一律。所以爱吃烧烤的人或许可以去尝尝成都九眼桥的把把烧。 去九眼桥或许可以尝试一下包浆豆腐，香脆的外皮里面是嫩嫩的豆腐，鼓起来一块装着香辣汤汁，吃的时候可能会感觉比较烫，淋漓尽致地体现了成都美食麻辣脆香的特点。 去九眼桥只知道喝酒蹦迪？那你可能要错过一大波美食。', null, '<p>美食与良宵不可辜负，成都夜生活比较重要的一个内容是吃宵夜。白天为生活努力工作、为未来努力学习，心里的压力无处释放，很多人可能会选择寄托给轻松的夜晚和深夜的美食。那么成都哪里有好吃的宵夜呢？你听说过九眼桥吗？<br/></p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191707321b9d2977e95f5aebc094ab3401ae8ab9\"/></p><p>美食配好酒，好酒度良宵，成都的夜生活交给九眼桥大概是不会失望的，街道的入口就是一个大红招牌的火锅店，火锅味道据说还不错，</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076161.jpg\"/></p><p>吃完点个现做飞饼加一碗甜甜的醪糟汤圆，爽口解腻。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076165.jpg\"/></p><p>成都人对食物混搭可能比较有研究，只要能入口的就大都能串成串混着吃，或涮或煮或烤，因此去九眼桥看夜景喝夜啤酒的基本上都会去吃十字路口那家把把烧。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076170.jpg\"/></p><p>成都把把烧可能跟其他地方的烧烤有点区别，因为烧烤通常的做法是烤然后刷上统一的调料，但是成都把把烧通常的做法是不同的食物配不同的调料，这样吃起来别具风味，可以将每种食物的独特口味发挥出来，改变了某些传统烧烤的千篇一律。所以爱吃烧烤的人或许可以去尝尝成都九眼桥的把把烧。</p><p>&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076174.jpg\"/></p><p>去九眼桥或许可以尝试一下包浆豆腐，香脆的外皮里面是嫩嫩的豆腐，鼓起来一块装着香辣汤汁，吃的时候可能会感觉比较烫，淋漓尽致地体现了成都美食麻辣脆香的特点。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076178.jpg\"/></p><p>去九眼桥只知道喝酒蹦迪？那你可能要错过一大波美食。</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/201904191707321b9d2977e95f5aebc094ab3401ae8ab9\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076161.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076165.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076170.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076174.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076178.jpg\"]', null, '75423', '0', '1', null, null, '[\"31\",\"30\",\"29\",\"26\"]', '1', '2019-04-12 21:36:24', '2019-04-19 18:58:22', '2019-04-12 21:36:24', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('45', null, '5', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041918574810acb9f89f2ef29adcc1bc6ca12f8458', '这四种成都美食小吃，美味可口，看着图片就感觉口水直流', '不来成都吃一趟可能会让很多吃货觉得遗憾，成都美食的魅力不仅在于好吃，还在于比较能包容天南地北的饮食习惯，面食多，菜品多，可咸可甜。', '1', '2', null, null, null, null, null, '不来成都吃一趟可能会让很多吃货觉得遗憾，成都美食的魅力不仅在于好吃，还在于比较能包容天南地北的饮食习惯，面食多，菜品多，可咸可甜。 小吃的种类丰富，春天叶儿粑、蒸蒸糕，夏天糍粑冰粉、伤心凉粉，秋天咸甜豆花、蛋烘糕，冬天锅巴土豆、肥肠粉，一年四季都有好吃的。下面来盘点4种成都美食小吃，没吃过还敢说自己是吃货吗？最后一种有人吃出人生的味道。第一种叶儿粑。一般是用糯米粉制成的青绿色面团，外面用成都本地的大叶仙茅叶子包着，馅儿一般是芽菜肉糜的咸味馅儿和芝麻花生的甜味馅儿两种。有些外地人也比较喜欢吃叶儿粑，因为面皮看起来滑嫩软糯，样子又比较可爱，咬一口满口植物清香，咸甜口味各有特点。 第二种伤心凉粉。可能会有人不知道这是什么样的食物，伤心一名的由来很多人也或许不清楚。凉粉由豌豆制成，成都这边通常的做法是切成片状或块状和各种调料加花生凉拌，白白的凉粉和鲜红的辣椒油相得益彰，颜色看起来比较诱人。据某些本地人解释，伤心凉粉这道小吃比较辣，很多人吃凉粉都要被辣出眼泪，因此而得名。 第三种甜水面，因其吃起来香辣，吃完回填而得名，喜欢甜辣口味的人或许会喜欢吃甜水面，它的面条比筷子还稍微粗一点，吃起来也比较有嚼劲。 第四种成都牛王庙怪味面，吃过的人形容用五味陈杂来形容怪味面，还有人开玩笑说是人生的味道，因为吃起来又麻又辣又甜又酸。可能有些人接受不了这种复杂的口感，但是没吃过的话去体验一下或许也是不错的选择。 以上4种成都美食小吃，你都吃过吗？', null, '<p><br/></p><p>不来成都吃一趟可能会让很多吃货觉得遗憾，成都美食的魅力不仅在于好吃，还在于比较能包容天南地北的饮食习惯，面食多，菜品多，可咸可甜。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191708251949e4522f05e96f0f8dc21bdf22433a\"/></p><p>小吃的种类丰富，春天叶儿粑、蒸蒸糕，夏天糍粑冰粉、伤心凉粉，秋天咸甜豆花、蛋烘糕，冬天锅巴土豆、肥肠粉，一年四季都有好吃的。下面来盘点4种成都美食小吃，没吃过还敢说自己是吃货吗？最后一种有人吃出人生的味道。</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076303.jpg\"/></p><p>第一种叶儿粑。一般是用糯米粉制成的青绿色面团，外面用成都本地的大叶仙茅叶子包着，馅儿一般是芽菜肉糜的咸味馅儿和芝麻花生的甜味馅儿两种。有些外地人也比较喜欢吃叶儿粑，因为面皮看起来滑嫩软糯，样子又比较可爱，咬一口满口植物清香，咸甜口味各有特点。&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076308.jpg\"/></p><p>第二种伤心凉粉。可能会有人不知道这是什么样的食物，伤心一名的由来很多人也或许不清楚。凉粉由豌豆制成，成都这边通常的做法是切成片状或块状和各种调料加花生凉拌，白白的凉粉和鲜红的辣椒油相得益彰，颜色看起来比较诱人。据某些本地人解释，伤心凉粉这道小吃比较辣，很多人吃凉粉都要被辣出眼泪，因此而得名。&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076314.jpg\"/></p><p>第三种甜水面，因其吃起来香辣，吃完回填而得名，喜欢甜辣口味的人或许会喜欢吃甜水面，它的面条比筷子还稍微粗一点，吃起来也比较有嚼劲。</p><p>&nbsp;</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076318.jpg\"/></p><p>第四种成都牛王庙怪味面，吃过的人形容用五味陈杂来形容怪味面，还有人开玩笑说是人生的味道，因为吃起来又麻又辣又甜又酸。可能有些人接受不了这种复杂的口感，但是没吃过的话去体验一下或许也是不错的选择。</p><p>&nbsp;</p><p>以上4种成都美食小吃，你都吃过吗？</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/201904191708251949e4522f05e96f0f8dc21bdf22433a\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076303.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076308.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076314.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076318.jpg\"]', null, '34543', '0', '1', null, null, '[\"30\",\"28\",\"26\"]', '1', '2019-04-12 21:41:51', '2019-04-19 18:57:59', '2019-04-12 21:38:43', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('46', null, '3', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191857248ec851d37ae6f8b3704fad2ea59521ff', '快来看谁才是川菜中的“扛把子”，哪道菜能征服你挑剔的胃？', '​天府之国，美食之都，成都的美景和美食吸引了大批游客，川蜀地区的风情在成都体现得淋漓尽致。', '1', '2', null, null, null, null, null, '天府之国，美食之都，成都的美景和美食吸引了大批游客，川蜀地区的风情在成都体现得淋漓尽致。 川菜是中国著名的传统菜系，而成都菜又是川菜组成部分中的佼佼者。下面来说说3道成都菜中的“扛把子”，你吃过几道呢？ 第一道，回锅肉。来成都没吃过回锅肉？那你可能还没有完全感受到成都菜的魅力和精髓，各大菜炒回锅是成都几乎每家馆子都会有的菜。 它一般是选用肥瘦相间的五花肉，冷水下锅去掉浮沫，捞起冷却，然后热油下锅大火煸炒至肉片微微卷起，配上葱段青椒出锅。脆香的回锅肉肥而不腻、色香味俱全，是下饭良品。 第二道，水煮肉片。成都菜的“扛把子”之一，听起来像是比较清淡的菜品，实际上以麻辣滑嫩出名。 这道菜里面加入了较多的干辣椒、花椒和葱段，肉一般会提前用嫩肉粉腌制片刻，汤红油亮，肉质鲜嫩入味，也是成都菜中的下饭常备之一。 第三道夫妻肺片，这道成都名菜之一，是由以前一对成都夫妇创办的，那个年代的人们生活物质条件匮乏，很少能吃到牛肉，于是把一些廉价的牛杂边角料卤煮后伴上胡椒面、花椒粉、红油和芝麻面等调料。由于味道吃起来麻辣香鲜，价格也比较低廉，受到了当时穷学生们的喜爱。 直至今天，虽然夫妻肺片已经不再像当时一样用边角料，而是选用牛肉和牛杂等作为主料，但是夫妻肺片鲜辣的味道被传承了下来成为了今天的川成名菜。上面3道成都菜中的“扛把子”，哪道能满足你挑剔的味蕾？', null, '<p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041917092707f73b4b3ade000a4e52a97421dbf504\"/></p><p>天府之国，美食之都，成都的美景和美食吸引了大批游客，川蜀地区的风情在成都体现得淋漓尽致。<br/></p><p>&nbsp;</p><p>川菜是中国著名的传统菜系，而成都菜又是川菜组成部分中的佼佼者。下面来说说3道成都菜中的“扛把子”，你吃过几道呢？</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076466.jpg\"/></p><p>第一道，回锅肉。来成都没吃过回锅肉？那你可能还没有完全感受到成都菜的魅力和精髓，各大菜炒回锅是成都几乎每家馆子都会有的菜。</p><p>&nbsp;<img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076471.jpg\"/></p><p>它一般是选用肥瘦相间的五花肉，冷水下锅去掉浮沫，捞起冷却，然后热油下锅大火煸炒至肉片微微卷起，配上葱段青椒出锅。脆香的回锅肉肥而不腻、色香味俱全，是下饭良品。</p><p>&nbsp;</p><p>第二道，水煮肉片。成都菜的“扛把子”之一，听起来像是比较清淡的菜品，实际上以麻辣滑嫩出名。</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076477.jpg\"/>&nbsp;</p><p>这道菜里面加入了较多的干辣椒、花椒和葱段，肉一般会提前用嫩肉粉腌制片刻，汤红油亮，肉质鲜嫩入味，也是成都菜中的下饭常备之一。</p><p><br/></p><p>&nbsp;</p><p>第三道夫妻肺片，这道成都名菜之一，是由以前一对成都夫妇创办的，那个年代的人们生活物质条件匮乏，很少能吃到牛肉，于是把一些廉价的牛杂边角料卤煮后伴上胡椒面、花椒粉、红油和芝麻面等调料。由于味道吃起来麻辣香鲜，价格也比较低廉，受到了当时穷学生们的喜爱。</p><p><img src=\"http://cihe-app.oss-cn-beijing.aliyuncs.com/1555076482.jpg\"/>&nbsp;</p><p>直至今天，虽然夫妻肺片已经不再像当时一样用边角料，而是选用牛肉和牛杂等作为主料，但是夫妻肺片鲜辣的味道被传承了下来成为了今天的川成名菜。</p><p>上面3道成都菜中的“扛把子”，哪道能满足你挑剔的味蕾？</p><p><br/></p>', null, null, null, '0', '0', '0', null, '[\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/2019041917092707f73b4b3ade000a4e52a97421dbf504\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076466.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076471.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076477.jpg\",\"http:\\/\\/cihe-app.oss-cn-beijing.aliyuncs.com\\/1555076482.jpg\"]', null, '89654', '0', '1', null, null, '[\"30\",\"26\"]', '1', '2019-04-12 21:41:50', '2019-04-19 18:58:07', '2019-04-12 21:41:47', '0', '3', '1', '1');
INSERT INTO `videos` VALUES ('47', null, '2', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191746222e07bd53832af6c6fc0fe52f6a017a35', '成都麻辣火锅', '成都火锅，以麻辣鲜香著称，它来源于民间，升华于庙堂。其消费群体涵盖广泛，人均消费次数之大，都是其他的望尘莫及', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191746222e07bd53832af6c6fc0fe52f6a017a35\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174941c1878c73202b25661011cd3b5226cabf\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174946afa12aab539d8c5f83cd1f0a55da0182\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174951c695ad846645509a0d94141f8f1a41a0\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191749552338026bbc4b3e8a575e84d2df304619\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174959e23852ad63f98e09d9dbf793ae8714a7\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041917500315521e4a5a9b5e0088a98f06d11e4631\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419175010c237577e9266cb5bfc38cf730752ca75\",\"imageDesc\":\"\"}]', null, '71656', '0', '1', null, null, '[\"31\",\"30\",\"26\"]', '1', '2019-04-12 21:52:47', '2019-04-19 17:50:18', '2019-04-12 21:52:47', '0', '2', '1', '1');
INSERT INTO `videos` VALUES ('48', null, '3', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/汉堡.gif', '酷夏至尊堡', '炎热的夏天，有我激情陪伴', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/汉堡.gif\",\"imageDesc\":\"酷夏至尊堡套餐\"}]', null, '67575', '0', '1', null, null, '[\"32\",\"28\",\"26\"]', '1', '2019-04-12 21:47:52', null, '2019-04-12 21:47:52', '0', '2', '1', '1');
INSERT INTO `videos` VALUES ('49', null, '7', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191746025fd9c429cfed4b1c40fddac69a4b1481', '成都面食', '成都有上万家面馆子，对于一个千万级人口的城市，这个数字不能算多，可咋一听依然十分惊人。仔细想一下，除了大部分只能解决果腹这个基本项的大路货，真正担得起成都面条精髓的，怕是并不多，保守点估计有个几十上百家已然不容易了。', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '[{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191746025fd9c429cfed4b1c40fddac69a4b1481\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174833f7546f552036230256e234c724b80d36\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191748429c2d58f388d84c6c22847e0c81a73793\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174849de3151c629c130e5f6270bc6d6d6e56e\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174855dbab02ebb8694b7c860351e0c09ab492\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174908c0f9f4d842ee3e82be8c632d5e51fcd6\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/2019041917491461c2a5768569c6c3ca8e27de687a7e1b\",\"imageDesc\":\"\"},{\"imageUrl\":\"http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419174920d973a5fb548f523eacdfeba56e035b20\",\"imageDesc\":\"\"}]', null, '12288', '0', '1', null, null, '[\"30\",\"28\",\"26\"]', '1', '2019-04-12 21:53:02', '2019-04-19 17:49:27', '2019-04-12 21:53:02', '0', '2', '1', '1');
INSERT INTO `videos` VALUES ('55', null, '7', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419182516422a3eb7cb08496871f00dd1039b7f7b', '三样菜&西月城谭豆花', '选择困难症来这家店就对了', '1', '1', null, null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/35cbf246-16a293a8044/35cbf246-16a293a8044.mp4?Expires=1558061861&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=Y5wxLGPu7xR6hbReyRO05lmjz98%3D', '', '', '56.408', '1920', '1080', '1', '1558261519', null, null, '747', '0', '1', null, null, '[\"26\"]', '1', '2019-04-17 11:00:41', '2019-04-19 18:25:19', '2019-04-17 11:00:41', '410', '1', '1', '1');
INSERT INTO `videos` VALUES ('56', null, '7', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/20190419182427022c0d60550e2fa96ccc33e534ca658a', '哪个说我海鲜过敏，看了菜，我病都好了', '2015动虾吧，蒸煮煎烤炸', '1', '1', null, null, null, null, null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/1846fd9b-16a293e5137/1846fd9b-16a293e5137.mp4?Expires=1558062111&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=LM7lvTYI3u3wIOc22Vr0%2BMS0uyU%3D', '', '', '62.573', '1920', '1080', '1', '1558263961', null, null, '822', '0', '1', null, null, '[\"26\"]', '1', '2019-04-17 11:03:37', '2019-04-19 19:06:01', '2019-04-17 11:03:37', '15', '1', '1', '1');
INSERT INTO `videos` VALUES ('57', null, '7', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191824075a1644d936527e018c3e1b0200856008', '小时候最喜欢吃的小吃', '连张靓颖来了都要排队叻小吃', '2', '1', '0.01', 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/3401e211-16a3f6fbea0/3401e211-16a3f6fbea0.mp4?Expires=1558434449&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=Bq2%2BEGNJdrhAZqnF0D7m4mK7a%2BQ%3D', 'eyJTZWN1cml0eVRva2VuIjoiQ0FJUzF3SjFxNkZ0NUIyeWZTaklyNHZlUE5EVnA3MWJ6YUNaYVI3WHZHY1NPcjRVdG83bm96ejJJSDlJZEhWb0FPOGZ2dlUwbTJ0WTdQc1pscnNvRnNJVUdSQ2ZNNDVvNnAxR3pRU2lib3laYlhwSGVIZEIydk9mQW1HMkowUFJMNmF3Q3J5THNicS9GOTZwYjFmYjdDd1JwWkx4YVRTbFdYRzhMSlNOa3VRSlI5OExYdzYrSHdFa1k4bFJLbGxOcGRNaU1YTEFGUENqTlh5UW5HM2NYbVZscGpSOWhXNTR3cU81ek15VGlIemJrRWFvOHVzY3RvbnJDNFc0YjZzSU9ZdGtBZSt4MWYxWGNLVEdza2hWOXdNWTJLcDlscjFjNVJUS3I2dnFZVDlyN2c2Qkx2RGYvL0IyTVFaOWZkSmFJYU5mcStYbW52QUswWTY2MWFhUGtrY1RiYkFORG42QUh0djduWkNjUWRuRWJJaHBLZXpKWEYzV3ljMktPNVhQdEFjcFhHa1dMZ3NpZWFCNmRTTWdWVVIxRldpS2UvVDRvd0NRUDF5NU40R0IwYkFyMTZSeXcyN2g5TUd4TzBPMVJMR1V3WXZIdUMyRDBaUkRHb0FCTUZEZms2YzU5Z0t0czN2d3FYQmpxSXJhb2I5MFlHclJ3SWVUSW1udldFYWdUVmdhWnlPOEJuVU1aamxzcFhuVWhudHFLallMOURUM0piWDFPTnZYZ2lhc2twOU4vRms2aFZkb1p2b1NMY1M5Y3ZRNVVGV3NacXdvRVd2SThQcVlPNFVuZ3hOa0Q2dnA3NU5vMkNTQXVvdllzMDdVRGhPRUdrcUsvYVFBL1dBPSIsIkF1dGhJbmZvIjoie1wiQ0lcIjpcIjNKbHZsLzhtb1pWWkhOazdpK2JaOWMzK04vbDFaTkRocEFPdzVHVmYzK2JrcGJBTG1wNEhiMDNMWGtjU2NrVnkyaUNLOVU0M29FVlhcXHJcXG5pUktxMkhCZGFnPT1cXHJcXG5cIixcIkNhbGxlclwiOlwidjdtSGtzd3NDWUpTZ3J6bzF0L0lnQT09XFxyXFxuXCIsXCJFeHBpcmVUaW1lXCI6XCIyMDE5LTA0LTIxVDEwOjI5OjA5WlwiLFwiTWVkaWFJZFwiOlwiMTY3MTRjOWRiMmE4NGU4MmI3OTkxY2MyYzMwOTNlMWZcIixcIlNpZ25hdHVyZVwiOlwiQml6aTNzUXNic0ordmhYSjZGWWZjQjhUL2dVPVwifSIsIlZpZGVvTWV0YSI6eyJTdGF0dXMiOiJVcGxvYWRpbmciLCJWaWRlb0lkIjoiMTY3MTRjOWRiMmE4NGU4MmI3OTkxY2MyYzMwOTNlMWYiLCJUaXRsZSI6IlVwbG9hZExvY2FsVmlkZW8iLCJEdXJhdGlvbiI6MC4wfSwiQWNjZXNzS2V5SWQiOiJTVFMuTkhrd2phSmJ6emJyazhmWGdHNjE4WUtMQSIsIkFjY2Vzc0tleVNlY3JldCI6IjdRekdRa2o1OHFVaXlocHpMWVZzMmJBVXkxcU1iZ2hhOXlBWVNVY25jR21BIiwiUmVnaW9uIjoiY24tYmVpamluZyIsIkN1c3RvbWVySWQiOjM1NTk0NDM2fQ==', '16714c9db2a84e82b7991cc2c3093e1f', null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/1243a791-16a294100bd/1243a791-16a294100bd.mp4?Expires=1558062287&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=Nh4YjiOnM2AMzvHtk4fHPoeDco0%3D', '', '', '55.168', '1920', '1080', '1', '1558434474', null, null, '573', '0', '1', null, null, '[\"26\"]', '1', '2019-04-17 11:05:55', '2019-04-21 18:27:54', '2019-04-17 11:05:55', '603', '1', '1', '1');
INSERT INTO `videos` VALUES ('61', null, '2', 'http://cihe-app.oss-cn-beijing.aliyuncs.com/201904191823494070cfb9f46488464b347543e20448d2', '来，成都装潢最巴适的一家餐厅', '位于春熙路，你们来猜猜是哪家？', '2', '1', '10.00', 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/8709d43-16a3e93ba08/8709d43-16a3e93ba08.mp4?Expires=1558420030&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=11aHWpONjNSWaWTktEvFeXLuVDU%3D', 'eyJTZWN1cml0eVRva2VuIjoiQ0FJUzF3SjFxNkZ0NUIyeWZTaklyNG1OTE96TWhZMUU3YVc3UVVXSnFEaHNmdDFPbHE3N2dUejJJSDlJZEhWb0FPOGZ2dlUwbTJ0WTdQc1pscnNvRnNJVUdSQ2ZNNDVvNnAxR3pRU2lib3laWFhGM2MzZEIydk9mQW1HMkowUFJMNmF3Q3J5THNicS9GOTZwYjFmYjdDd1JwWkx4YVRTbFdYRzhMSlNOa3VRSlI5OExYdzYrSHdFa1k4bFJLbGxOcGRNaU1YTEFGUENqTlh5UW5HM2NYbVZscGpSOWhXNTR3cU81ek15VGlIemJrRWFvOHVzY3RvbnJDNFc0YjZzSU9ZdGtBZSt4MWYxWGNLVEdza2hWOXdNWTJLcDlscjFjNVJUS3I2dnFZVDlyN2c2Qkx2RGYvL0IyTVFaOWZkSmFJYU5mcStYbW52QUswWTY2MWFhUGtrY1RiYkFORG42QUh0djduWkNjUWRuRWJJaHBLZXpKWEYzV3ljMktPNVhQdEFjcFhHa1dMZ3NpZWFCNmRTTWdWVVIxRldpS2UvVDRvd0NRUDF5NU40R0IwYkFyMTZSeXcyN2g5TUd4TzBPMVJMR1V3WXZIdUMyRDBaUkRHb0FCZlRnL3pxbGJWUFZFUjNQZGs2TkxQMU9GL09kS0MvbHk1MUhUU2RBVEh0Q2dWS3FUemM2MDNzK2hCTUFkZ3ErMk04VDV1dCtpVW03cWVKRmwwenNvL1RvbkZHNWVWQlJqYVNpWjd6d3o4SXZkWTFwQlJyMDhKN2lieVpoZDVKQUJBWnJubHZUVU11VWRnZlJKeVFUZHZCL1B1K2lkQ24xTFVOODlKTThWYUtVPSIsIkF1dGhJbmZvIjoie1wiQ0lcIjpcIlh1T1FxQUIyaEFhalI0U2d1NTJPSGpzMWtRRGxwMkUwdzdWajZTR1BpblMzcDhpa0lFeW9sOXllMDMwcXQ2MGxaREkzSGRyeTZacVJcXHJcXG5Tbk1OQUFEWHZBPT1cXHJcXG5cIixcIkNhbGxlclwiOlwiRkRlVUluYVF2ekc5SUlIWWROVzJOQT09XFxyXFxuXCIsXCJFeHBpcmVUaW1lXCI6XCIyMDE5LTA0LTIxVDA2OjI4OjUwWlwiLFwiTWVkaWFJZFwiOlwiMmE2NTg1MzhmYzhhNGNlM2E1ZGNiZGU3MDc2OGRiOGVcIixcIlNpZ25hdHVyZVwiOlwiOU5vSWVmcXhON3NnM1dwUFZ0MlhnVkVzTUNvPVwifSIsIlZpZGVvTWV0YSI6eyJTdGF0dXMiOiJVcGxvYWRpbmciLCJWaWRlb0lkIjoiMmE2NTg1MzhmYzhhNGNlM2E1ZGNiZGU3MDc2OGRiOGUiLCJUaXRsZSI6IlVwbG9hZExvY2FsVmlkZW8iLCJEdXJhdGlvbiI6MC4wfSwiQWNjZXNzS2V5SWQiOiJTVFMuTko4Z1Z4aFJlWmdQQ2M4TDg5clJieWtQYyIsIkFjY2Vzc0tleVNlY3JldCI6IjRzMlR3QkNWNjlSQ2FnNHI3S25yMmRObnBpVFFUYmNTN0dlM1B2NDI5azV2IiwiUmVnaW9uIjoiY24tYmVpamluZyIsIkN1c3RvbWVySWQiOjM1NTk0NDM2fQ==', '2a658538fc8a4ce3a5dcbde70768db8e', null, null, null, 'https://outin-33c2e53c590511e9949f00163e00b174.oss-cn-beijing.aliyuncs.com/sv/42a1f851-16a339fb08f/42a1f851-16a339fb08f.mp4?Expires=1558236264&OSSAccessKeyId=LTAItL9Co9nUDU5r&Signature=gcL2td6YoIVX%2BX13qbhbKkdQHA4%3D', '', '', null, '0', '0', '-1', '1558420042', null, null, '684', '0', '1', null, null, '[\"31\",\"28\"]', '1', '2019-04-19 11:25:17', '2019-04-21 14:27:22', '2019-04-19 11:25:17', '537', '1', '1', '1');
