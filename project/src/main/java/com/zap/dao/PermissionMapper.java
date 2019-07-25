package com.zap.dao;

import java.util.Set;

import com.zap.entity.Permission;

public interface PermissionMapper {
    int deleteByPermissionId(Integer permissionId);

    int insert(Permission permission);

    int insertSelective(Permission permission);

    Permission selectByPermissionId(Integer permissionId);

    int updateByPermissionIdSelective(Permission permission);

    int updateByPermissionId(Permission permission);

	Set<Permission> selectAll();
	
	Set<Permission> selectByRoleId(int roleId);
	
	Set<Permission> selectByRoleIds(int[] roleIds);
}