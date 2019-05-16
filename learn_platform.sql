# Host: 47.96.94.235  (Version 5.7.22-log)
# Date: 2019-03-31 21:30:01
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "banners"
#

DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转链接  应该是视频链接，ios给个视频id过去就好',
  `position` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '首页' COMMENT '出现位置 例如 首页',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-发布, 2-隐藏',
  `order` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '排序 正序排列',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "banners"
#

INSERT INTO `banners` VALUES (1,'https://lorempixel.com/640/480/?68857',NULL,'首页',1,19),(2,'https://lorempixel.com/640/480/?19234',NULL,'首页',1,14),(3,'https://lorempixel.com/640/480/?57617',NULL,'首页',1,20),(4,'https://lorempixel.com/640/480/?27912',NULL,'首页',2,10),(5,'https://lorempixel.com/640/480/?94159',NULL,'首页',2,2),(6,'https://sketing.oss-cn-beijing.aliyuncs.com/image/WechatIMG19.png','http://www.360doc.com/content/17/0408/00/29234429_643753937.shtml','首页',1,0);

#
# Structure for table "channels"
#

DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专家名字',
  `avatar` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专家头像',
  `desc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专家介绍',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "channels"
#

INSERT INTO `channels` VALUES (1,'曹智明','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Nobis et sequi in rerum qui pariatur deserunt.','2018-05-30 17:42:41','2018-05-30 17:42:41'),(2,'简秀兰','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Non quis doloremque autem vero adipisci. Quisquam magni ullam amet enim consequuntur ratione aliquam.','2018-05-30 17:42:41','2018-05-30 17:42:41'),(3,'霍伦','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Esse consequuntur amet sit fugiat sunt quasi dignissimos. Nihil architecto quibusdam placeat id nemo.','2018-05-30 17:42:41','2018-05-30 17:42:41'),(4,'丛莹','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Harum et corporis qui.','2018-05-30 17:42:41','2018-05-30 17:42:41'),(5,'熊丽丽','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Optio omnis eos veniam.','2018-05-30 17:42:41','2018-05-30 17:42:41'),(6,'谈文','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Ab blanditiis expedita quo sit nostrum est laboriosam in.','2018-05-30 17:42:41','2018-05-30 17:42:41'),(7,'裴坤','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Id qui voluptatibus voluptates consequuntur culpa minus laborum voluptatum. Impedit qui eos dolore fugit aliquid explicabo quis.','2018-05-30 17:42:41','2018-05-30 17:42:41'),(8,'党玉梅','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Laudantium molestiae repellendus in dolorum.','2018-05-30 17:42:41','2018-05-30 17:42:41'),(9,'冷雪梅','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Aut vel impedit perferendis in. Quidem odit excepturi et.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(10,'史淑英','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Aut qui distinctio id et temporibus velit exercitationem. Deserunt fugit voluptatum alias eos.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(11,'阎华','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Debitis atque similique laboriosam officiis quo.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(12,'毛哲彦','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Ut magni amet id aspernatur.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(13,'谌霞','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Quasi est dolorem expedita dolorum et facilis.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(14,'彭正业','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Tempore vel incidunt ut et ipsa quos.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(15,'凌晨','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Dolores est voluptatem deserunt pariatur natus. Nisi nam sed animi qui aut temporibus qui.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(16,'莫旭','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Itaque delectus cumque quos velit. Quia eos quia ipsa cupiditate ut facilis.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(17,'牟捷','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Explicabo quo earum at non. Ullam animi maxime iure id.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(18,'乐志明','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Magnam pariatur id vero dolores modi. Vero expedita tempora quaerat atque cum aperiam quia.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(19,'窦毅','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Magni commodi magnam accusantium dignissimos itaque perspiciatis nulla. Et in voluptatem animi.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(20,'匡正豪','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Aut excepturi qui sequi officia.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(21,'覃新华','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Non eos harum veritatis voluptatum ex voluptatem.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(22,'鄢超','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Tempore ex veniam non ipsam est. A nobis maiores architecto praesentium et tenetur corporis.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(23,'木莉','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Aut expedita vitae vitae dicta et. Pariatur ab quam sint ut aut.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(24,'甄瑞','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Animi tempore dolores nihil deleniti optio quae qui. Dolores illum id id hic ut quis.','2018-05-30 17:42:42','2018-05-30 17:42:42'),(25,'时欢','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Id quo quia quidem dicta minus velit. Ut dolores libero sed autem.','2018-05-30 17:42:43','2018-05-30 17:42:43'),(26,'迟瑜','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Beatae qui hic quibusdam aut.','2018-05-30 17:42:43','2018-05-30 17:42:43'),(27,'许玉华','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Consectetur qui consequuntur reiciendis id sunt qui voluptas.','2018-05-30 17:42:43','2018-05-30 17:42:43'),(28,'景志文','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Qui quasi dolorum nihil repellendus. Officiis quia odit saepe ducimus.','2018-05-30 17:42:43','2018-05-30 17:42:43'),(29,'谈杨','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Libero molestiae voluptatem mollitia est ut tempora. Commodi quod aut ducimus vel ipsa similique nisi dolore.','2018-05-30 17:42:43','2018-05-30 17:42:43'),(30,'杜倩','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','Eum iure sunt et corrupti tempore sunt recusandae. Optio nam laborum ad enim.','2018-05-30 17:42:43','2018-05-30 17:42:43'),(31,'测试','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG30.png','测试简介','2018-06-08 14:31:08','2018-06-08 14:31:08'),(32,'测试','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/WechatIMG3.png','测试机','2018-06-12 12:06:01','2018-06-12 12:09:25'),(33,'MDJ','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo.jpg','James Douglas，美国艺术家、设计师','2018-06-12 16:12:50','2018-06-12 16:12:50'),(34,'盒子大师','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo1.jpg','Draw a Box | 盒子大师，本名Irshad Karim ，加拿大概念原画师、插画家','2018-06-13 19:41:32','2018-06-13 19:44:09'),(35,'工业设计师吉米','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/unnamed.jpg','Jimmy Huynh | 美国工业设计师，分享有关工业设计的日常','2018-06-14 19:18:18','2018-06-14 19:18:18'),(36,'小鲜肉比尔','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo2.jpg','Dan Beardshaw，英国21岁小鲜肉，5年手绘学习时间。','2018-06-18 15:45:05','2018-06-18 16:10:19'),(37,'大嘴猴手绘','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/TheSketchMonkeyCi-150x10.png','设计师费莱尼的手绘频道，更新有关汽车和产品的设计手绘。\r\n','2018-06-18 15:52:44','2018-06-18 15:52:44'),(38,'Scott Robertson','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo5.jpg','手绘大师，ACCD设计中心艺术学院手绘老师，丰富的手绘教学经验。','2018-06-18 16:09:28','2018-06-18 16:09:28'),(39,'小黑人','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/photo7.jpg','Spencer Nugent，美国工业设计师。','2018-06-18 17:14:03','2018-06-18 17:14:03'),(40,'环线艺术学院','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/77.jpg','Tom McPherson，每周六更新，手绘透视、建筑、风景、人物和产品。','2018-06-18 17:20:05','2018-06-18 17:20:05'),(41,'朱峰FengZhu','https://sketing.oss-cn-beijing.aliyuncs.com/avatar/80cfbca6jw8expyclukoij208m05kjru.jpg','朱峰，华裔概念设计师，新加坡FZD设计学院 创始人。','2018-06-18 17:46:29','2018-06-18 17:48:34');

#
# Structure for table "migrations"
#

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "migrations"
#

INSERT INTO `migrations` VALUES (14,'2014_10_12_000000_create_users_table',1),(15,'2018_05_27_174853_create_articles_table',1),(16,'2018_05_27_180725_create_article_categories_table',1),(17,'2018_05_27_180950_create_expert_categories_table',1),(18,'2018_05_27_181005_create_experts_table',1),(19,'2018_05_27_181140_create_banners_table',1),(20,'2018_05_27_181227_create_orders_table',1),(21,'2018_05_27_181351_create_courses_table',1),(22,'2018_05_27_181501_create_user_histories_table',1),(23,'2018_05_27_181948_create_user_favorite_courses_table',1),(24,'2018_05_27_182058_create_user_comments_table',1),(25,'2018_05_28_205849_create_course_categories_table',1),(26,'2018_05_28_210059_create_lessons_table',1);

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `out_trade_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '本地生成订单号',
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付平台生成的订单号',
  `pay_type` int(11) NOT NULL COMMENT '支付方式 1-支付宝,2-微信',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单状态 1-未支付、2-已支付、3-退款中、4-已退款、5-取消订单',
  `payment_end_time` timestamp NULL DEFAULT NULL COMMENT '支付成功时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (1,10,16,'LP_u2DUR1527673473',NULL,2,5,'2018-06-11 01:26:15','2018-05-30 17:44:33','2018-05-30 17:44:33'),(2,3,18,'LP_hB4x01527673473',NULL,2,1,'2018-06-09 11:28:13','2018-05-30 17:44:33','2018-05-30 17:44:33'),(3,4,18,'LP_tUUky1527673473',NULL,2,5,'2018-05-15 03:45:58','2018-05-30 17:44:33','2018-05-30 17:44:33'),(4,6,9,'LP_dqJy51527673473',NULL,1,1,'2018-06-29 04:39:39','2018-05-30 17:44:33','2018-05-30 17:44:33'),(5,10,5,'LP_AhDx71527673473',NULL,2,5,'2018-05-04 07:36:28','2018-05-30 17:44:33','2018-05-30 17:44:33'),(6,8,11,'LP_QkYa01527673473',NULL,1,3,'2018-05-27 10:39:41','2018-05-30 17:44:33','2018-05-30 17:44:33'),(7,2,4,'LP_5FIQs1527673473',NULL,2,3,'2018-06-22 14:46:47','2018-05-30 17:44:33','2018-05-30 17:44:33'),(8,4,8,'LP_ivn0f1527673473',NULL,1,3,'2018-06-11 01:31:34','2018-05-30 17:44:33','2018-05-30 17:44:33'),(9,4,16,'LP_dsau11527673473',NULL,2,1,'2018-06-16 04:34:14','2018-05-30 17:44:33','2018-05-30 17:44:33'),(10,9,14,'LP_STs1U1527673473',NULL,1,2,'2018-05-07 22:57:57','2018-05-30 17:44:33','2018-05-30 17:44:33'),(11,8,17,'LP_H012W1527673473',NULL,2,2,'2018-05-18 16:19:14','2018-05-30 17:44:33','2018-05-30 17:44:33'),(12,4,15,'LP_MeLnp1527673473',NULL,2,5,'2018-06-25 07:38:43','2018-05-30 17:44:33','2018-05-30 17:44:33'),(13,7,6,'LP_Wcxf01527673473',NULL,1,1,'2018-05-08 13:12:52','2018-05-30 17:44:33','2018-05-30 17:44:33'),(14,3,3,'LP_9A3jT1527673473',NULL,1,2,'2018-06-24 23:13:01','2018-05-30 17:44:33','2018-05-30 17:44:33'),(15,9,12,'LP_oLGRQ1527673473',NULL,1,3,'2018-05-02 06:26:17','2018-05-30 17:44:34','2018-05-30 17:44:34'),(16,1,16,'LP_NqAGb1527673473',NULL,2,2,'2018-06-02 05:07:08','2018-05-30 17:44:34','2018-05-30 17:44:34'),(17,8,4,'LP_o25NO1527673473',NULL,2,2,'2018-05-22 07:50:28','2018-05-30 17:44:34','2018-05-30 17:44:34'),(18,8,3,'LP_zse0Q1527673473',NULL,1,5,'2018-05-15 19:37:19','2018-05-30 17:44:34','2018-05-30 17:44:34'),(19,1,15,'LP_WtGHm1527673473',NULL,1,5,'2018-06-20 16:58:23','2018-05-30 17:44:34','2018-05-30 17:44:34'),(20,4,13,'LP_qwcYg1527673473',NULL,2,3,'2018-05-07 13:54:16','2018-05-30 17:44:34','2018-05-30 17:44:34'),(21,9,5,'LP_xLC3E1527673473',NULL,2,2,'2018-05-17 02:22:33','2018-05-30 17:44:34','2018-05-30 17:44:34'),(22,8,20,'LP_LM6IQ1527673473',NULL,2,4,'2018-06-13 10:19:16','2018-05-30 17:44:34','2018-05-30 17:44:34'),(23,5,5,'LP_pkEV41527673473',NULL,1,2,'2018-05-08 07:04:58','2018-05-30 17:44:34','2018-05-30 17:44:34'),(24,2,19,'LP_JrjNl1527673473',NULL,2,5,'2018-05-03 20:15:01','2018-05-30 17:44:34','2018-05-30 17:44:34'),(25,8,6,'LP_zEpDV1527673473',NULL,1,4,'2018-06-13 16:40:59','2018-05-30 17:44:34','2018-05-30 17:44:34'),(26,6,5,'LP_y8Qib1527673473',NULL,1,5,'2018-05-18 07:15:04','2018-05-30 17:44:34','2018-05-30 17:44:34'),(27,4,10,'LP_msOy41527673473',NULL,2,5,'2018-05-30 20:29:25','2018-05-30 17:44:35','2018-05-30 17:44:35'),(28,10,1,'LP_D33oG1527673473',NULL,1,3,'2018-05-26 19:40:02','2018-05-30 17:44:35','2018-05-30 17:44:35'),(29,2,9,'LP_AlIwZ1527673473',NULL,2,3,'2018-05-04 14:52:07','2018-05-30 17:44:35','2018-05-30 17:44:35'),(30,9,1,'LP_CsCdW1527673473',NULL,1,5,'2018-05-11 06:39:44','2018-05-30 17:44:35','2018-05-30 17:44:35');

#
# Structure for table "tags"
#

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL COMMENT '名字',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序  正序排列',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1-显示，2-隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "tags"
#

INSERT INTO `tags` VALUES (1,'建筑',4,1),(2,'美术',6,1),(3,'工业设计',7,1),(4,'风景园林',3,1),(5,'关注',1,1),(6,'全部',2,1),(7,'原画CG',8,1),(8,'基础教程',9,1),(9,'概念设计',0,1),(10,'建筑手绘',6,1),(11,'水彩',0,1),(12,'油画',0,1),(13,'彩铅',0,1),(14,'素描',0,1),(15,'水粉教程',0,1),(16,'速写',0,1),(17,'珠宝手绘',0,1),(18,'手绘基础',0,1),(19,'干货',0,1),(20,'小技巧',0,1),(21,'环线艺术学院',0,1),(22,'Demo示范',0,1),(23,'设计杂谈',0,1);

#
# Structure for table "user_comments"
#

DROP TABLE IF EXISTS `user_comments`;
CREATE TABLE `user_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL COMMENT '课程章节id',
  `user_id` int(11) NOT NULL COMMENT '发布评论用户id',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `zan` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `is_reported` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否被举报 1-正常，2-举报',
  `reported_type` tinyint(4) DEFAULT NULL COMMENT '1-广告, 2-色情, 3-过多相同内容',
  `is_show` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-显示, 2-隐藏',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "user_comments"
#

INSERT INTO `user_comments` VALUES (1,11,2,'Officia qui quia explicabo sed iusto expedita at. Eum quisquam saepe fugiat nihil fugiat animi.',41,1,NULL,2,'2018-05-30 17:44:58','2018-05-30 17:44:58'),(2,27,3,'Non neque blanditiis exercitationem ipsa molestiae.',96,1,NULL,2,'2018-05-30 17:44:58','2018-05-30 17:44:58'),(3,22,7,'Occaecati culpa vel eius iste eos harum impedit.',8,1,NULL,1,'2018-05-30 17:44:58','2018-05-30 17:44:58'),(4,18,6,'Reiciendis explicabo minus consequatur tenetur.',30,1,NULL,1,'2018-05-30 17:44:58','2018-05-30 17:44:58'),(5,9,4,'Officiis cum perspiciatis et nulla nam voluptatem.',71,1,NULL,2,'2018-05-30 17:44:58','2018-05-30 17:44:58'),(6,20,1,'Beatae iste numquam voluptatem nihil repellendus ad ipsa.',73,1,NULL,2,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(7,17,1,'Hic laboriosam minima consectetur.',30,1,NULL,2,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(8,1,1,'Id itaque voluptate sed autem.',35,1,NULL,2,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(9,29,4,'Omnis enim rerum architecto corrupti odit quisquam voluptatum quisquam.',77,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(10,19,4,'Porro maxime exercitationem odit reiciendis animi in quia.',73,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(11,29,5,'Quia esse voluptatibus ipsum. Aut eaque nostrum quibusdam tenetur eligendi qui.',49,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(12,28,6,'Sapiente cupiditate quam quidem a. A nisi necessitatibus ea similique nulla.',30,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(13,24,6,'Sed praesentium nihil nam eveniet rerum dolorum. Culpa praesentium quidem suscipit dolorem odit ullam cumque.',92,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(14,12,9,'Rem illo ullam odit incidunt quidem fugit sit laboriosam. Nobis aliquam sunt quam ut possimus.',70,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(15,29,9,'Qui magni repudiandae nisi autem recusandae est corporis. Earum omnis perferendis voluptas.',37,1,NULL,2,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(16,18,6,'Assumenda mollitia excepturi fugit deserunt neque placeat eligendi.',30,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(17,24,6,'Voluptas porro doloremque maiores soluta est. Animi nihil a cumque ut.',60,1,NULL,2,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(18,19,6,'Omnis repellat ut ut voluptatibus temporibus sit.',83,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(19,11,6,'Aut sequi aspernatur consequuntur facilis. Rerum eius dolorum est nihil suscipit.',8,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(20,8,7,'Et tempora consequatur voluptatum id rerum hic corporis. Esse commodi maiores aut minima aspernatur dicta iste.',100,1,NULL,1,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(21,16,1,'Error non earum occaecati officia. Facere quia impedit nulla libero nam sint ullam assumenda.',16,1,NULL,2,'2018-05-30 17:44:59','2018-05-30 17:44:59'),(22,28,6,'Mollitia ratione aliquam nemo est cupiditate.',16,1,NULL,2,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(23,22,9,'Et eos qui nobis rem.',81,1,NULL,1,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(24,21,2,'Porro velit molestiae et nihil in officiis sequi commodi.',13,1,NULL,2,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(25,14,9,'Et esse illo ea consequatur repudiandae et et officiis.',85,1,NULL,2,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(26,14,1,'Aut eos animi doloremque qui aut dicta quas. Omnis dolor qui nostrum quasi exercitationem ut saepe.',94,1,NULL,2,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(27,17,7,'Sequi deleniti enim cupiditate id. Reprehenderit cum vitae libero occaecati aut soluta.',87,1,NULL,1,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(28,20,5,'Illo consectetur delectus officia error quam sequi.',29,2,3,1,'2018-05-30 17:45:00','2018-06-06 22:51:01'),(29,25,10,'Aut rerum possimus qui a autem id.',98,1,NULL,1,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(30,17,8,'Aliquid laboriosam aliquid quasi vel aut.',32,1,NULL,1,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(31,29,4,'Voluptas natus consequatur fuga et a. Dicta aut velit placeat rerum veniam.',86,1,NULL,1,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(32,1,5,'Qui inventore quos voluptatum id.',97,1,NULL,1,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(33,29,7,'Molestiae beatae explicabo a dolor accusantium nulla.',56,1,NULL,1,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(34,9,5,'Non velit voluptates alias non et in. Et voluptatibus harum a.',25,1,NULL,1,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(35,24,3,'Aliquid minima commodi illo et sint.',20,1,NULL,2,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(36,25,4,'Autem nulla delectus optio totam incidunt in totam. Tenetur corporis expedita ab aperiam aut.',39,1,NULL,2,'2018-05-30 17:45:00','2018-05-30 17:45:00'),(37,5,4,'Saepe vel expedita est consectetur ea enim.',49,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(38,2,9,'Commodi sint quidem esse ut similique ad ullam voluptatem.',86,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(39,32,6,'Est sed voluptas molestiae magnam est.',41,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(40,32,4,'Quis rerum a amet quis dolores ex omnis eos. Provident incidunt officia non sit quos.',10,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(41,32,8,'Dolorum in cupiditate voluptas assumenda placeat.',60,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(42,32,3,'Asperiores ut soluta nobis eum voluptas. Dolores quibusdam commodi ducimus maxime.',78,1,NULL,1,'2018-05-30 17:45:01','2018-06-10 17:11:18'),(43,32,1,'Dolore molestiae harum distinctio molestiae.',15,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(44,17,1,'Maiores est nisi tempora harum omnis neque. Qui rerum rerum expedita.',36,1,NULL,2,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(45,20,3,'Impedit dolores et nulla non est voluptas. Sequi quis quos in nihil eos aspernatur.',8,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(46,8,1,'Et voluptates ut assumenda id at. Eius in et rerum voluptatem iure.',87,1,NULL,2,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(47,24,6,'Inventore sapiente odit sunt voluptas quo beatae.',81,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(48,28,18,'Pariatur quisquam ex eveniet in dolorem. Pariatur voluptatibus et fugit.',94,2,NULL,1,'2018-05-30 17:45:01','2018-06-06 11:14:42'),(49,28,8,'Rerum aut voluptates aut id.',5,1,NULL,1,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(50,28,2,'Qui distinctio consequuntur praesentium maiores eos magnam. Explicabo qui similique qui voluptatem.',21,1,NULL,2,'2018-05-30 17:45:01','2018-05-30 17:45:01'),(51,28,18,'Stay hungry. Stay foolish',0,1,NULL,1,'2018-06-06 11:37:39','2018-06-06 11:37:39'),(52,28,18,'1111',0,1,NULL,1,'2018-06-06 17:45:53','2018-06-06 17:45:53');

#
# Structure for table "user_favorite_videos"
#

DROP TABLE IF EXISTS `user_favorite_videos`;
CREATE TABLE `user_favorite_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `video_id` int(11) NOT NULL COMMENT '课程id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "user_favorite_videos"
#

INSERT INTO `user_favorite_videos` VALUES (2,9,20,'2018-05-30 17:45:28','2018-05-30 17:45:28'),(3,3,9,'2018-05-30 17:45:28','2018-05-30 17:45:28'),(4,3,8,'2018-05-19 17:45:28','2018-05-30 17:45:28'),(8,10,1,'2018-05-30 17:45:28','2018-05-30 17:45:28'),(9,7,14,'2018-05-30 17:45:28','2018-05-30 17:45:28'),(10,5,3,'2018-05-30 17:45:28','2018-05-30 17:45:28'),(11,8,10,'2018-05-30 17:45:28','2018-05-30 17:45:28'),(12,7,2,'2018-05-30 17:45:28','2018-05-30 17:45:28'),(13,4,28,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(14,10,28,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(15,7,28,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(16,18,28,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(17,18,11,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(19,18,2,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(20,18,12,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(23,18,10,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(24,7,1,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(26,3,15,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(27,3,7,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(28,6,20,'2018-05-30 17:45:29','2018-05-30 17:45:29'),(29,7,11,'2018-05-30 17:45:30','2018-05-30 17:45:30'),(30,6,13,'2018-05-30 17:45:30','2018-05-30 17:45:30'),(33,1,28,'2018-06-06 16:47:21','2018-06-06 16:47:21'),(35,1,2,'2018-06-07 01:08:16','2018-06-07 01:08:16'),(36,1,28,'2018-06-07 01:08:17','2018-06-07 01:08:17'),(37,1,4,'2018-06-07 01:16:31','2018-06-07 01:16:31'),(38,1,32,'2018-06-10 16:57:45','2018-06-10 16:57:45');

#
# Structure for table "user_focus_channels"
#

DROP TABLE IF EXISTS `user_focus_channels`;
CREATE TABLE `user_focus_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "user_focus_channels"
#

INSERT INTO `user_focus_channels` VALUES (1,14,4),(4,1,18),(5,1,10),(6,18,2),(7,18,20);

#
# Structure for table "user_histories"
#

DROP TABLE IF EXISTS `user_histories`;
CREATE TABLE `user_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `video_id` int(11) NOT NULL COMMENT '视频章节id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "user_histories"
#

INSERT INTO `user_histories` VALUES (1,3,4,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(2,9,7,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(3,10,26,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(4,10,1,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(5,10,25,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(6,7,22,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(7,5,18,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(8,7,1,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(9,1,1,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(10,5,3,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(11,8,9,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(12,1,28,'2018-06-10 16:52:29','2018-06-10 16:52:29'),(13,4,23,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(14,1,6,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(15,10,28,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(16,7,13,'2018-05-30 17:45:55','2018-05-30 17:45:55'),(17,1,4,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(18,3,24,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(19,2,22,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(20,10,24,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(21,3,2,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(22,5,13,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(23,2,14,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(24,10,27,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(25,8,30,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(26,1,22,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(27,8,7,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(28,4,16,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(29,10,1,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(30,3,30,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(31,5,15,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(32,6,24,'2018-05-30 17:45:56','2018-05-30 17:45:56'),(33,7,24,'2018-05-30 17:45:57','2018-05-30 17:45:57'),(34,6,15,'2018-05-30 17:45:57','2018-05-30 17:45:57'),(35,2,4,'2018-05-30 17:45:57','2018-05-30 17:45:57'),(36,10,3,'2018-05-30 17:45:57','2018-05-30 17:45:57'),(37,9,30,'2018-05-30 17:45:57','2018-05-30 17:45:57'),(38,1,3,'2018-05-30 17:45:57','2018-05-30 17:45:57'),(39,4,27,'2018-05-30 17:45:57','2018-05-30 17:45:57');

#
# Structure for table "user_published_msg_zans"
#

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

#
# Data for table "user_published_msg_zans"
#

INSERT INTO `user_published_msg_zans` VALUES (4,1,51,1,'2018-06-06 22:51:01','2018-06-06 22:51:01'),(12,2,5,1,'2018-06-06 22:59:30','2018-06-06 22:59:30'),(13,1,52,1,'2018-06-06 23:22:03','2018-06-06 23:22:06'),(14,2,8,1,'2018-06-06 23:38:48','2018-06-06 23:38:51'),(15,1,6,3,'2018-06-08 21:11:34','2018-06-08 21:11:37'),(17,2,10,1,'2018-06-10 17:05:36','2018-06-10 17:05:39');

#
# Structure for table "user_replies"
#

DROP TABLE IF EXISTS `user_replies`;
CREATE TABLE `user_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '回复@对方的用户id',
  `content` varchar(150) NOT NULL,
  `is_reported` tinyint(4) DEFAULT '1' COMMENT '是否被举报 1-正常，2-举报',
  `reported_type` tinyint(4) DEFAULT NULL,
  `zan` int(11) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '状态 1-显示, 2-隐藏',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "user_replies"
#

INSERT INTO `user_replies` VALUES (1,12,1,0,'aaaa',1,NULL,0,1,'2018-06-06 09:35:40','2018-06-06 09:35:44'),(2,48,3,0,'bbbb',1,NULL,0,1,'2018-06-06 09:37:59','2018-06-06 09:38:01'),(3,48,5,0,'cccccc',1,NULL,0,1,'2018-06-06 09:38:26','2018-06-06 09:38:28'),(4,48,4,0,'ddddd',2,NULL,0,1,'2018-06-07 21:39:05','2018-06-06 11:15:50'),(5,48,1,0,'eeeeee',1,NULL,1,1,'2018-06-06 09:39:28','2018-06-06 22:59:30'),(6,48,1,4,'good good study, day day up',1,NULL,0,1,'2018-06-06 11:50:43','2018-06-06 11:50:43'),(7,12,1,0,'good good study, day day up',1,NULL,0,1,'2018-06-06 11:52:01','2018-06-06 11:52:01'),(8,46,18,1,'222333',1,NULL,0,1,'2018-06-06 17:52:03','2018-06-06 17:52:03'),(9,46,1,0,'4444444',1,NULL,0,1,'2018-06-07 17:48:07','2018-06-07 17:48:10'),(10,42,18,0,'so beautiful',1,NULL,0,1,'2018-06-10 17:04:43','2018-06-10 17:04:46');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名字',
  `mobile` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户手机号',
  `avatar` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT 'https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg' COMMENT '用户头像',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '用户性别, 1-男, 2-女, 3-保密，默认3',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '生日 Y-m-d H:i:s',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
  `signature` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个性化签名',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'jacky cheung','13800138000','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',2,'2014-09-01 01:54:59','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:17','2018-06-06 22:29:11'),(2,'范坤','13411372175','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',2,'1991-12-28 20:12:26','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:17','2018-05-30 17:46:17'),(3,'屠玉英','17195506023','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',1,'1985-08-21 07:25:48','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:17','2018-05-30 17:46:17'),(4,'施燕','14552223279','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',1,'1985-11-20 15:36:36','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:17','2018-05-30 17:46:17'),(5,'俞岩','13794497841','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',3,'2004-11-22 03:46:43','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:18','2018-05-30 17:46:18'),(6,'宇淑英','18423428137','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',3,'2014-09-01 01:54:59','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:18','2018-05-30 17:46:18'),(7,'姜斌','13031173536','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',2,'1976-02-21 05:56:12','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:18','2018-05-30 17:46:18'),(8,'汤玉梅','15799873337','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',3,'1976-08-20 19:19:34','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:18','2018-05-30 17:46:18'),(9,'任嘉','15202392677','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',3,'2014-08-24 03:54:06','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:18','2018-05-30 17:46:18'),(10,'隋敏','13983879601','https://sketing.oss-cn-beijing.aliyuncs.com/user/defult.jpg',1,'1998-04-23 23:17:18','$2y$10$c4kacj8nimMRiUJpVcYf1.M5eDFw3ZVllKbJDQOBOZfvol8HQshtG',NULL,'2018-05-30 17:46:18','2018-05-30 17:46:18'),(18,'jackydu','13726217518','https://sketing.oss-cn-beijing.aliyuncs.com/user/2018-06/21/25z4gluus73xwv8xbwnml60jriytdl1x.jpg',1,'1994-10-29 00:00:00','$2y$10$AR2D01TH8pSdOMNCWFWm0OyBjls7vceMxYatkaP24qzYou9IrRRWy','Stay hungry. Stay foolish','2018-06-21 11:38:05','2018-06-21 17:01:28');

#
# Structure for table "video_categories"
#

DROP TABLE IF EXISTS `video_categories`;
CREATE TABLE `video_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专家分类名字',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-发布, 2-隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "video_categories"
#

INSERT INTO `video_categories` VALUES (2,'视频分类名字_2',2),(3,'视频分类名字_3',1),(4,'视频分类名字_4',2),(5,'视频分类名字_5',1),(6,'视频分类名字_6',1),(7,'视频分类名字_7',1),(8,'视频分类名字_8',2),(9,'视频分类名字_9',1),(10,'视频分类名字_10',2),(11,'视频分类名字_11',1),(12,'视频分类名字_12',2),(13,'视频分类名字_13',2),(14,'视频分类名字_14',2),(15,'工业设计',1);

#
# Structure for table "videos"
#

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL COMMENT '分类id',
  `channel_id` int(11) NOT NULL,
  `poster` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面图',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `desc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `is_free` tinyint(4) DEFAULT '1' COMMENT '是否免费 1-免费，2-付费',
  `is_top` tinyint(3) DEFAULT '1' COMMENT '顶置',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格，后面可能需要',
  `demo_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '试看视频链接',
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频播放地址',
  `shares_count` int(11) DEFAULT NULL COMMENT '分享数',
  `played_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前章节播放次数',
  `download_count` int(11) DEFAULT '0',
  `downloadable` tinyint(4) DEFAULT '1' COMMENT '是否可以下载 1-可以，2-不可以',
  `share_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方分享使用的名字，默认使用name字段',
  `share_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享链接',
  `tag_list` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频标签，格式： "干货", "举铁" ps：英文逗号分隔',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 1-发布, 2-隐藏',
  `published_at` timestamp NULL DEFAULT NULL COMMENT '推送时间（用户不填，给当前时间）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "videos"
#

INSERT INTO `videos` VALUES (1,5,1,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Amet modi quis reprehenderit cum. Illum atque aut in vero.',0,1,NULL,NULL,'http://520qinggan.oss-cn-hangzhou.aliyuncs.com/20171024%20%E8%8A%B1%E9%95%8730%E7%A7%92%E3%80%8A%E5%A9%9A%E5%A7%BB%E4%BF%AE%E5%A4%8D%E7%AF%87%E3%80%8BFinal%EF%BC%8816%EF%BC%9A9%EF%BC%89.mp4',492,392,0,1,NULL,NULL,'语文,数学',2,'2018-06-05 22:19:52'),(2,14,1,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Sunt omnis fugiat provident voluptas non amet ea aut. Eum omnis blanditiis est consequatur.',0,1,NULL,NULL,'http://520qinggan.oss-cn-hangzhou.aliyuncs.com/20171024%20%E8%8A%B1%E9%95%8730%E7%A7%92%E3%80%8A%E5%A9%9A%E5%A7%BB%E4%BF%AE%E5%A4%8D%E7%AF%87%E3%80%8BFinal%EF%BC%8816%EF%BC%9A9%EF%BC%89.mp4',176,78,0,1,NULL,NULL,'语文',1,'2018-06-05 22:19:52'),(3,15,2,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Perferendis voluptate ut deserunt cumque libero.',0,1,NULL,NULL,'http://520qinggan.oss-cn-hangzhou.aliyuncs.com/20171024%20%E8%8A%B1%E9%95%8730%E7%A7%92%E3%80%8A%E5%A9%9A%E5%A7%BB%E4%BF%AE%E5%A4%8D%E7%AF%87%E3%80%8BFinal%EF%BC%8816%EF%BC%9A9%EF%BC%89.mp4',109,9,3,1,NULL,NULL,'语文',1,'2018-06-01 22:19:52'),(4,13,2,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Temporibus dolore vel omnis enim et quas vel.',0,1,NULL,NULL,'http://520qinggan.oss-cn-hangzhou.aliyuncs.com/20171024%20%E8%8A%B1%E9%95%8730%E7%A7%92%E3%80%8A%E5%A9%9A%E5%A7%BB%E4%BF%AE%E5%A4%8D%E7%AF%87%E3%80%8BFinal%EF%BC%8816%EF%BC%9A9%EF%BC%89.mp4',380,280,0,1,NULL,NULL,'语文',2,'2018-06-05 22:19:52'),(5,10,2,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Quas accusamus voluptas atque quae et ut sed. Culpa magni nihil et maxime aut deserunt.',0,1,NULL,NULL,'http://520qinggan.oss-cn-hangzhou.aliyuncs.com/20171024%20%E8%8A%B1%E9%95%8730%E7%A7%92%E3%80%8A%E5%A9%9A%E5%A7%BB%E4%BF%AE%E5%A4%8D%E7%AF%87%E3%80%8BFinal%EF%BC%8816%EF%BC%9A9%EF%BC%89.mp4',266,166,0,1,NULL,NULL,'语文',2,'2018-06-05 22:19:52'),(6,15,10,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Quasi voluptates cumque voluptatibus itaque reprehenderit.',0,1,NULL,NULL,'http://520qinggan.oss-cn-hangzhou.aliyuncs.com/20171024%20%E8%8A%B1%E9%95%8730%E7%A7%92%E3%80%8A%E5%A9%9A%E5%A7%BB%E4%BF%AE%E5%A4%8D%E7%AF%87%E3%80%8BFinal%EF%BC%8816%EF%BC%9A9%EF%BC%89.mp4',307,207,0,1,NULL,NULL,'语文',2,'2018-06-06 14:52:17'),(7,4,10,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Quia commodi aut nihil nobis.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',342,245,3,1,'背部训练 | 大力王',NULL,'语文',1,'2018-06-05 14:52:17'),(8,17,10,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','At dolorem officiis exercitationem harum. Expedita velit beatae beatae.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',258,158,0,1,'背部训练 | 大力王',NULL,'语文',1,'2018-06-04 14:52:17'),(9,15,2,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Sunt cum repellat aut neque. Omnis magnam dignissimos vero natus alias possimus.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',479,379,0,1,'背部训练 | 大力王',NULL,'语文',1,'2018-06-05 22:22:34'),(10,7,2,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Doloribus qui laudantium sit at aut. Quo suscipit non aut tempore.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',413,313,0,1,'背部训练 | 大力王',NULL,'语文',1,'2018-06-03 22:22:34'),(11,14,2,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Aut labore explicabo quia minima ipsam fuga vitae. Eum et eveniet sed enim voluptas nesciunt nostrum sequi.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',328,228,0,1,'背部训练 | 大力王',NULL,'语文',1,'2018-06-05 22:22:34'),(12,10,2,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Voluptatem inventore maxime ab laboriosam ut accusamus in.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',598,498,0,1,'背部训练 | 大力王',NULL,'语文',1,'2018-06-02 22:22:34'),(13,16,2,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王','Consequuntur et dolorem omnis debitis accusamus quia qui consequatur. Sed eum aspernatur rerum recusandae iste harum.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',551,451,0,1,'背部训练 | 大力王',NULL,'英语',1,'2018-06-05 22:22:34'),(14,10,9,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Dolor distinctio.','Qui nisi maiores eos earum.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',124,24,0,1,'Dolor distinctio.',NULL,'英语',1,'2018-06-05 22:22:34'),(15,10,9,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Aut et.','Ut asperiores et ullam est est qui amet. Ab autem nihil maiores nulla.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',376,276,0,1,'Aut et.',NULL,'英语',1,'2018-06-05 22:22:34'),(16,2,9,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Aut exercitationem dignissimos.','Nam temporibus rerum ut numquam. Molestiae laudantium nihil earum rerum est earum.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',578,478,0,1,'Aut exercitationem dignissimos.',NULL,'英语',1,'2018-06-05 22:22:34'),(17,17,10,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Error voluptas officia.','Tempore omnis voluptas fugit ratione atque. Sunt excepturi qui sit dolorum doloremque accusamus.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',149,49,0,1,'Error voluptas officia.',NULL,'英语',1,'2018-06-06 14:52:21'),(18,19,10,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Provident praesentium quam.','Est autem dicta et.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',253,153,0,1,'Provident praesentium quam.',NULL,'英语',1,'2018-06-06 14:52:21'),(19,19,10,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Nihil eos.','Distinctio ea veniam quos consectetur maxime nesciunt. Consequatur ab consectetur quos culpa aut iusto.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',485,385,0,1,'Nihil eos.',NULL,'英语',1,'2018-06-06 14:52:21'),(20,17,9,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Optio sapiente architecto.','Quaerat qui aliquam similique quo qui similique. Molestiae at eum minima labore sit est.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',341,241,0,1,'Optio sapiente architecto.',NULL,'英语',1,'2018-06-05 22:22:35'),(21,19,9,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Ea quia.','Culpa quis officiis amet molestiae illum optio temporibus. Hic voluptates et aut vel id corrupti est possimus.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',252,152,0,1,'Ea quia.',NULL,'英语',1,'2018-06-05 22:22:35'),(22,5,3,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Sed non.','Ad id consequatur odio maiores nihil. Aut et unde et dolores aperiam rerum nesciunt.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',463,363,0,1,'Sed non.',NULL,'数学',1,'2018-06-05 22:22:35'),(23,17,3,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Quia error.','Aut qui quia et natus illo unde sint sunt.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',349,249,0,1,'Quia error.',NULL,'数学',1,'2018-06-05 22:22:35'),(24,1,3,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Culpa doloribus rerum.','Dignissimos eum est nemo similique praesentium fuga.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',125,25,0,1,'Culpa doloribus rerum.',NULL,'数学',2,'2018-06-05 22:22:35'),(25,20,3,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','Illo ab.','Nostrum ut iusto impedit est.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',215,115,0,1,'Illo ab.',NULL,'数学',1,'2018-06-05 22:22:35'),(26,8,3,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王 | test','Sed occaecati est omnis. Sapiente suscipit dolorem tempore incidunt ratione.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',263,163,0,1,'背部训练 | 大力王 | test',NULL,'数学',2,'2018-06-05 22:22:35'),(27,12,4,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王 | test','Omnis numquam quia consequatur adipisci aspernatur. Saepe quia voluptas eveniet corporis consequatur omnis.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',453,353,0,1,'背部训练 | 大力王 | test',NULL,'数学',1,'2018-06-05 22:22:35'),(28,9,4,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王 | test','Molestiae qui culpa illo porro dolorem similique iste. Assumenda et ab fugiat aspernatur molestias.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',404,302,0,1,'背部训练 | 大力王 | test',NULL,'数学,英语,物理',1,'2018-06-06 16:53:05'),(29,14,4,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王 | test','Aut aut assumenda odio ea aut quasi rerum.',0,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',119,22,0,1,'背部训练 | 大力王 | test',NULL,'数学',1,'2018-06-05 22:22:35'),(30,17,4,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王 | test','Provident eligendi exercitationem eveniet et veniam omnis ut doloremque.',1,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',480,380,0,1,'背部训练 | 大力王 | test',NULL,'数学',1,'2018-06-05 22:22:35'),(31,14,4,'http://images.cdn.change.so/video-poster-766067a61bdccb62843c4af5a21e4301.jpeg?imageView/1/w/256/h/144','背部训练 | 大力王 | test',NULL,1,1,NULL,'http://videos.qiniu.cdn.change.so/video-demo-80cb93ae5ffdf299587c271a31e83f6a.mp4','http://videos.qiniu.cdn.change.so/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',322,222,0,2,'背部训练 | 大力王 | test',NULL,'数学',1,'2018-06-05 22:22:36'),(32,5,27,'https://sketing.oss-cn-beijing.aliyuncs.com/video/0381de85949053ca8012193a3339cc5.jpg','测试','测试',NULL,1,0,'https://sketing.oss-cn-beijing.aliyuncs.com/video/20160911035939137237913_1_06400360.mp4','https://sketing.oss-cn-beijing.aliyuncs.com/video/video-af324c12d6a3cede9bbfbd7a0877ba70.mp4',0,5,0,1,'','','数学,语文,物理',1,'2018-06-06 01:45:45'),(33,7,28,'https://sketing.oss-cn-beijing.aliyuncs.com/image/千库网c483c80acc965b9284559079ddeac1b0.jpg','随机获取','测试',1,1,0,'https://sketing.oss-cn-beijing.aliyuncs.com/video/第十讲.mp4','https://sketing.oss-cn-beijing.aliyuncs.com/video/第十讲.mp4',0,0,0,1,'','','数学,语文,物理',2,'2018-06-28 11:45:30'),(34,15,33,'https://sketing.oss-cn-beijing.aliyuncs.com/image/maxresdefault1副本2.jpg','透视基础I：一、二、三点透视 | MDJ','在这一系列中，我们后退一步，并涵盖绘画基础。视频包括练习，以提高您的绘图技巧，以及三种最常见的透视类型（1，2，3点）。\r\n\r\n',NULL,1,0,'https://sketing.oss-cn-beijing.aliyuncs.com/video/透视基础I：一、二、三点透视.mp4','https://sketing.oss-cn-beijing.aliyuncs.com/video/透视基础I：一、二、三点透视.mp4',0,0,0,2,'透视基础I：一、二、三点透视 | MDJ','','基础教程,工业设计,全部',1,'2018-06-12 00:30:00'),(35,15,34,'https://sketing.oss-cn-beijing.aliyuncs.com/image/Drawabox Lesson 6- Comput6er Mouse Demo.mp4副本.jpg','盒子大师 | 如何画鼠标','盒子大师的课程第六课：鼠标手绘示范',1,1,0,'','https://sketing.oss-cn-beijing.aliyuncs.com/video/鼠标demo.m4v',0,0,0,1,'','','工业设计,干货',1,'2018-06-13 00:45:00'),(36,15,35,'https://sketing.oss-cn-beijing.aliyuncs.com/image/maxresdefault888副本.jpg','工业设计师能赚多少钱？','美国工业设计师每小时赚多少钱？新人毕业的工资是多少？一起来看看吧。来源Jimmy Huynh',1,1,0,'','https://sketing.oss-cn-beijing.aliyuncs.com/video/工业设计师能赚多少钱.mp4',0,0,0,1,'','','工业设计',1,'2018-06-14 00:30:30'),(37,0,40,'https://sketing.oss-cn-beijing.aliyuncs.com/image/maxresdefault.jpg','如何徒手画一个完美的圆 | 环线艺术学院','一个徒手画圆的小技巧。来源Circle Line Art School\r\n',NULL,1,0,'','https://sketing.oss-cn-beijing.aliyuncs.com/video/如何徒手画圆.mp4',0,0,0,1,'','','环线艺术学院,小技巧,手绘基础,素描',1,'2018-06-18 21:45:15');
