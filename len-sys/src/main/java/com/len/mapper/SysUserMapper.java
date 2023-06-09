package com.len.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.len.entity.SysUser;

/**
 * 账户菜单 mapper
 */
@Mapper
public interface SysUserMapper extends com.len.base.BaseMapper<SysUser> {

    SysUser login(@Param("username") String username);

    int count();

    int add(SysUser user);

    int delById(String id);

    int checkUser(String username);

    /**
     * 更新密码
     *
     * @param user
     * @return
     */
    int rePass(SysUser user);

    List<SysUser> getUserByRoleId(@Param("roleId") String roleId);
}