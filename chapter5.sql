SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_video_binary_picture
-- ----------------------------
DROP TABLE IF EXISTS `t_video_binary_picture`;
CREATE TABLE `t_video_binary_picture` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint DEFAULT NULL COMMENT '视频id',
  `frameNo` int DEFAULT NULL COMMENT '帧数',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片链接',
  `videoTimestamp` bigint DEFAULT NULL COMMENT '视频时间戳',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3 COMMENT='视频二值图记录表';

-- ----------------------------
-- Table structure for t_video_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_video_operation`;
CREATE TABLE `t_video_operation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint DEFAULT NULL COMMENT '用户id',
  `videoId` bigint DEFAULT NULL COMMENT '视频id',
  `operationType` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作类型：0点赞、1收藏、2投币',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COMMENT='视频操作表';

-- ----------------------------
-- Table structure for t_video_view
-- ----------------------------
DROP TABLE IF EXISTS `t_video_view`;
CREATE TABLE `t_video_view` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint NOT NULL COMMENT '视频id',
  `userId` bigint DEFAULT NULL COMMENT '用户id',
  `clientId` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客户端id',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ip',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='视频观看记录表';

SET FOREIGN_KEY_CHECKS = 1;
