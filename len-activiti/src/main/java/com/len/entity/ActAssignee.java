package com.len.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName(value = "act_assignee")
public class ActAssignee {
    @TableId(value = "id", type = IdType.UUID)
    private String id;

    /**
     * 节点id
     */
    @TableField(value = "sid")
    private String sid;

    /**
     * 办理人
     */
    @TableField(value = "assignee")
    private String assignee;

    /**
     * 候选组(角色)
     */
    @TableField(value = "role_id")
    private String roleId;

    /**
     * 办理人类型1办理人2候选人3组
     */
    @TableField(value = "assignee_type")
    private Integer assigneeType;

    /**
     * 节点名称
     */
    @TableField(value = "activti_name")
    private String activtiName;

    public ActAssignee() {}

    public ActAssignee(String sid) {
        this.sid = sid;
    }

    /**
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * 获取节点id
     *
     * @return sid - 节点id
     */
    public String getSid() {
        return sid;
    }

    /**
     * 设置节点id
     *
     * @param sid 节点id
     */
    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    /**
     * 获取办理人
     *
     * @return assignee - 办理人
     */
    public String getAssignee() {
        return assignee;
    }

    /**
     * 设置办理人
     *
     * @param assignee 办理人
     */
    public void setAssignee(String assignee) {
        this.assignee = assignee == null ? null : assignee.trim();
    }

    /**
     * 获取候选组(角色)
     *
     * @return role_id - 候选组(角色)
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * 设置候选组(角色)
     *
     * @param roleId 候选组(角色)
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    /**
     * 获取办理人类型1办理人2候选人3组
     *
     * @return assignee_type - 办理人类型1办理人2候选人3组
     */
    public Integer getAssigneeType() {
        return assigneeType;
    }

    /**
     * 设置办理人类型1办理人2候选人3组
     *
     * @param assigneeType 办理人类型1办理人2候选人3组
     */
    public void setAssigneeType(Integer assigneeType) {
        this.assigneeType = assigneeType;
    }

    /**
     * 获取节点名称
     *
     * @return activti_name - 节点名称
     */
    public String getActivtiName() {
        return activtiName;
    }

    /**
     * 设置节点名称
     *
     * @param activtiName 节点名称
     */
    public void setActivtiName(String activtiName) {
        this.activtiName = activtiName == null ? null : activtiName.trim();
    }
}