/*
 * Copyright (c) 2022-present Charles7c Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package top.charles7c.cnadmin.system.model.entity;

import lombok.Data;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import top.charles7c.cnadmin.common.base.BaseDO;
import top.charles7c.cnadmin.common.enums.DisEnableStatusEnum;

/**
 * 岗位实体
 *
 * @author Charles7c
 * @since 2023/2/25 22:25
 */
@Data
@TableName("sys_post")
public class PostDO extends BaseDO {

    private static final long serialVersionUID = 1L;

    /**
     * 岗位 ID
     */
    @TableId
    private Long postId;

    /**
     * 岗位名称
     */
    private String postName;

    /**
     * 描述
     */
    private String description;

    /**
     * 岗位排序
     */
    private Integer postSort;

    /**
     * 状态（1启用 2禁用）
     */
    private DisEnableStatusEnum status;
}
