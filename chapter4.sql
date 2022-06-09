SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_collection_group
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_group`;
CREATE TABLE `t_collection_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint NULL DEFAULT NULL COMMENT '用户id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注分组名称',
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注分组类型：0默认分组  1用户自定义分组',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收藏分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_danmu
-- ----------------------------
DROP TABLE IF EXISTS `t_danmu`;
CREATE TABLE `t_danmu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint NULL DEFAULT NULL COMMENT '用户id',
  `videoId` bigint NULL DEFAULT NULL COMMENT '视频Id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '弹幕内容',
  `danmuTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弹幕出现时间',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '弹幕记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
  `md5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件md5唯一标识串',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签名称',
  `createTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint NOT NULL COMMENT '用户id',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频链接',
  `thumbnail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '封面链接',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频标题',
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频类型：0原创 1转载',
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频时长',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所在分区：0鬼畜 1音乐 2电影',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '视频简介',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频投稿记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_coin
-- ----------------------------
DROP TABLE IF EXISTS `t_video_coin`;
CREATE TABLE `t_video_coin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '视频投稿id',
  `userId` bigint NULL DEFAULT NULL COMMENT '用户id',
  `videoId` bigint NULL DEFAULT NULL COMMENT '视频投稿id',
  `amount` int NULL DEFAULT NULL COMMENT '投币数',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频硬币表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_video_collection`;
CREATE TABLE `t_video_collection`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint NULL DEFAULT NULL COMMENT '视频投稿id',
  `userId` bigint NULL DEFAULT NULL COMMENT '用户id',
  `groupId` bigint NULL DEFAULT NULL COMMENT '收藏分组id',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频收藏记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_video_comment`;
CREATE TABLE `t_video_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint NOT NULL COMMENT '视频id',
  `userId` bigint NOT NULL COMMENT '用户id',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论',
  `replyUserId` bigint NULL DEFAULT NULL COMMENT '回复用户id',
  `rootId` bigint NULL DEFAULT NULL COMMENT '根节点评论id',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_like
-- ----------------------------
DROP TABLE IF EXISTS `t_video_like`;
CREATE TABLE `t_video_like`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint NOT NULL COMMENT '用户id',
  `videoId` bigint NOT NULL COMMENT '视频投稿id',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频点赞记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_video_tag`;
CREATE TABLE `t_video_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint NOT NULL COMMENT '视频id',
  `tagId` bigint NOT NULL COMMENT '标签id',
  `createTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频标签关联表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
