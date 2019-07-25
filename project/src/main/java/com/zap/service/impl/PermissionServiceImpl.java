package com.zap.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.zap.dao.PermissionMapper;
import com.zap.entity.Permission;
import com.zap.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionMapper;

	@Override
	public Set<Permission> queryPermissionsByRoleId(int roleId) {
		return permissionMapper.selectByRoleId(roleId);
	}

	@Override
	public Set<Permission> queryAllPermissions() {
		return permissionMapper.selectAll();
	}

	@Override
	public Set<Permission> queryPermissionsByRoleIds(int[] roleIds) {
		Set<Permission> permissions = new HashSet<Permission>();
		if(roleIds!=null&&roleIds.length>0){
			permissions = permissionMapper.selectByRoleIds(roleIds);
		}
		return permissions;
	}

}
