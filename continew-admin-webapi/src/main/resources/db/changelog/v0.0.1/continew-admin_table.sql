-- liquibase formatted sql

-- changeset Charles7c:1
CREATE TABLE IF NOT EXISTS `sys_menu`  (
    `menu_id` bigint(20) unsigned AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name` varchar(255) NOT NULL COMMENT '菜单名称',
    `parent_id` bigint(20) unsigned DEFAULT 0 COMMENT '上级菜单ID',
    `menu_type` tinyint(1) unsigned DEFAULT 1 COMMENT '菜单类型（1目录 2菜单 3按钮）',
    `path` varchar(512) DEFAULT NULL COMMENT '路由地址',
    `name` varchar(255) DEFAULT NULL COMMENT '组件名称',
    `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
    `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
    `is_external` bit(1) DEFAULT b'0' COMMENT '是否外链',
    `is_cache` bit(1) DEFAULT b'0' COMMENT '是否缓存',
    `is_hidden` bit(1) DEFAULT b'0' COMMENT '是否隐藏',
    `permission` varchar(255) DEFAULT NULL COMMENT '权限标识',
    `menu_sort` int(11) unsigned DEFAULT 999 COMMENT '菜单排序',
    `status` tinyint(1) unsigned DEFAULT 1 COMMENT '状态（1启用 2禁用）',
    `create_user` bigint(20) unsigned NOT NULL COMMENT '创建人',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user` bigint(20) unsigned NOT NULL COMMENT '修改人',
    `update_time` datetime NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`) USING BTREE,
    INDEX `idx_parent_id`(`parent_id`) USING BTREE,
    INDEX `idx_create_user`(`create_user`) USING BTREE,
    INDEX `idx_update_user`(`update_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

CREATE TABLE IF NOT EXISTS `sys_dept`  (
    `dept_id` bigint(20) unsigned AUTO_INCREMENT COMMENT '部门ID',
    `dept_name` varchar(255) NOT NULL COMMENT '部门名称',
    `parent_id` bigint(20) unsigned DEFAULT 0 COMMENT '上级部门ID',
    `description` varchar(512) DEFAULT NULL COMMENT '描述',
    `dept_sort` int(11) unsigned DEFAULT 999 COMMENT '部门排序',
    `status` tinyint(1) unsigned DEFAULT 1 COMMENT '状态（1启用 2禁用）',
    `create_user` bigint(20) unsigned NOT NULL COMMENT '创建人',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user` bigint(20) unsigned NOT NULL COMMENT '修改人',
    `update_time` datetime NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`dept_id`) USING BTREE,
    INDEX `idx_parent_id`(`parent_id`) USING BTREE,
    INDEX `idx_create_user`(`create_user`) USING BTREE,
    INDEX `idx_update_user`(`update_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

CREATE TABLE IF NOT EXISTS `sys_role`  (
    `role_id` bigint(20) unsigned AUTO_INCREMENT COMMENT '角色ID',
    `role_name` varchar(255) NOT NULL COMMENT '角色名称',
    `role_code` varchar(255) DEFAULT NULL COMMENT '角色编码',
    `data_scope` tinyint(1) DEFAULT 4 COMMENT '数据权限（1全部数据权限 2本部门及以下数据权限 3本部门数据权限 4仅本人数据权限 5自定义数据权限）',
    `description` varchar(512) DEFAULT NULL COMMENT '描述',
    `role_sort` int(11) unsigned DEFAULT 999 COMMENT '角色排序',
    `status` tinyint(1) unsigned DEFAULT 1 COMMENT '状态（1启用 2禁用）',
    `create_user` bigint(20) unsigned NOT NULL COMMENT '创建人',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user` bigint(20) unsigned NOT NULL COMMENT '修改人',
    `update_time` datetime NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`role_id`) USING BTREE,
    INDEX `idx_create_user`(`create_user`) USING BTREE,
    INDEX `idx_update_user`(`update_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

CREATE TABLE IF NOT EXISTS `sys_role_menu`  (
    `role_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
    `menu_id` bigint(20) unsigned NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

CREATE TABLE IF NOT EXISTS `sys_role_dept`  (
    `role_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
    `dept_id` bigint(20) unsigned NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

CREATE TABLE IF NOT EXISTS `sys_post`  (
    `post_id` bigint(20) unsigned AUTO_INCREMENT COMMENT '岗位ID',
    `post_name` varchar(255) NOT NULL COMMENT '岗位名称',
    `description` varchar(512) DEFAULT NULL COMMENT '描述',
    `post_sort` int(11) unsigned DEFAULT 999 COMMENT '岗位排序',
    `status` tinyint(1) unsigned DEFAULT 1 COMMENT '状态（1启用 2禁用）',
    `create_user` bigint(20) unsigned NOT NULL COMMENT '创建人',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user` bigint(20) unsigned NOT NULL COMMENT '修改人',
    `update_time` datetime NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`post_id`) USING BTREE,
    INDEX `idx_create_user`(`create_user`) USING BTREE,
    INDEX `idx_update_user`(`update_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位表';

CREATE TABLE IF NOT EXISTS `sys_user`  (
    `user_id` bigint(20) unsigned AUTO_INCREMENT COMMENT '用户ID',
    `username` varchar(255) NOT NULL COMMENT '用户名',
    `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
    `password` varchar(255) DEFAULT NULL COMMENT '密码',
    `gender` tinyint(1) unsigned DEFAULT 0 COMMENT '性别（0未知 1男 2女）',
    `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
    `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
    `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
    `description` varchar(512) DEFAULT NULL COMMENT '描述',
    `status` tinyint(1) unsigned DEFAULT 1 COMMENT '状态（1启用 2禁用）',
    `pwd_reset_time` datetime DEFAULT NULL COMMENT '最后一次修改密码时间',
    `dept_id` bigint(20) unsigned DEFAULT NULL COMMENT '部门ID',
    `create_user` bigint(20) unsigned NOT NULL COMMENT '创建人',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user` bigint(20) unsigned NOT NULL COMMENT '修改人',
    `update_time` datetime NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE INDEX `uk_username`(`username`) USING BTREE,
    UNIQUE INDEX `uk_email`(`email`) USING BTREE,
    INDEX `idx_dept_id`(`dept_id`) USING BTREE,
    INDEX `idx_create_user`(`create_user`) USING BTREE,
    INDEX `idx_update_user`(`update_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

CREATE TABLE IF NOT EXISTS `sys_user_role`  (
    `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
    `role_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

CREATE TABLE IF NOT EXISTS `sys_user_post`  (
    `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
    `post_id` bigint(20) unsigned NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和岗位关联表';

CREATE TABLE IF NOT EXISTS `sys_log` (
    `log_id` bigint(20) unsigned AUTO_INCREMENT COMMENT '日志ID',
    `description` varchar(255) NOT NULL COMMENT '日志描述',
    `module` varchar(255) NOT NULL COMMENT '所属模块',
    `request_url` varchar(512) NOT NULL COMMENT '请求URL',
    `request_method` varchar(10) NOT NULL COMMENT '请求方式',
    `request_headers` text DEFAULT NULL COMMENT '请求头',
    `request_body` text DEFAULT NULL COMMENT '请求体',
    `status_code` int(11) unsigned NOT NULL COMMENT '状态码',
    `response_headers` text DEFAULT NULL COMMENT '响应头',
    `response_body` mediumtext DEFAULT NULL COMMENT '响应体',
    `elapsed_time` bigint(20) unsigned NOT NULL COMMENT '请求耗时（ms）',
    `status` tinyint(1) unsigned DEFAULT 1 COMMENT '操作状态（1成功 2失败）',
    `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端IP',
    `location` varchar(512) DEFAULT NULL COMMENT 'IP归属地',
    `browser` varchar(255) DEFAULT NULL COMMENT '浏览器',
    `error_msg` text DEFAULT NULL COMMENT '错误信息',
    `exception_detail` mediumtext DEFAULT NULL COMMENT '异常详情',
    `create_user` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`log_id`) USING BTREE,
    INDEX `idx_createUser`(`create_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统日志表';
