INSERT INTO `media_process_history`
VALUES (null, 'd40978e576ab73cc6c0b141afd4782bf', '1265308212-1-16.avi', 'video', '1', '2023-09-24 19:29:49',
        '2023-09-24 19:43:01', '/video/d/4/d40978e576ab73cc6c0b141afd4782bf/d40978e576ab73cc6c0b141afd4782bf.avi',
        'd/4/d40978e576ab73cc6c0b141afd4782bf/d40978e576ab73cc6c0b141afd4782bf.avi', NULL, 0);

CREATE TABLE `media_process_history`
(
    `id`          bigint                                                         NOT NULL AUTO_INCREMENT,
    `file_id`     varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NOT NULL COMMENT '文件标识',
    `filename`    varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NOT NULL COMMENT '文件名称',
    `bucket`      varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NOT NULL COMMENT '存储源',
    `status`      varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci   NOT NULL COMMENT '状态,1:未处理，2：处理成功  3处理失败',
    `create_date` datetime                                                       NOT NULL COMMENT '上传时间',
    `finish_date` datetime                                                       NOT NULL COMMENT '完成时间',
    `url`         varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '媒资文件访问地址',
    `file_path`   varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NULL DEFAULT NULL COMMENT '文件路径',
    `errormsg`    varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '失败原因',
    `fail_count`  int                                                            NULL DEFAULT 0 COMMENT '失败次数',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;

CREATE TABLE `media_process`
(
    `id`          bigint                                                         NOT NULL AUTO_INCREMENT,
    `file_id`     varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NOT NULL COMMENT '文件标识',
    `filename`    varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NOT NULL COMMENT '文件名称',
    `bucket`      varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NOT NULL COMMENT '存储桶',
    `file_path`   varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NULL DEFAULT NULL COMMENT '存储路径',
    `status`      varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci   NOT NULL COMMENT '状态,1:未处理，2：处理成功  3处理失败',
    `create_date` datetime                                                       NOT NULL COMMENT '上传时间',
    `finish_date` datetime                                                       NULL DEFAULT NULL COMMENT '完成时间',
    `url`         varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '媒资文件访问地址',
    `errormsg`    varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '失败原因',
    `fail_count`  int                                                            NULL DEFAULT 0 COMMENT '失败次数',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unique_fileid` (`file_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci
  ROW_FORMAT = DYNAMIC;