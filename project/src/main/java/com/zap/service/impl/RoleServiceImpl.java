package com.zap.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.zap.dao.RoleMapper;
import com.zap.dao.RolePermissionMapper;
import com.zap.entity.Role;
import com.zap.service.RoleService;
import com.zap.shiro.MyRealm;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private MyRealm myRealm;

	@Autowired
	private RolePermissionMapper rolePermissionMapper;


	@Override
	public Set<Role> queryAllRole() {
		return roleMapper.selectAll();
	}

	@Override
	public Role queryRoleByRoleId(int roleId) {
		return roleMapper.selectByRoleId(roleId);
	}

	@Override
	public Set<Role> queryRoleByUserId(int userId) {
		return roleMapper.selectByUserId(userId);
	}

	@Override
	public Set<Role> queryRolesByUsername(String username) {		
		return roleMapper.selectByUsername(username);
	}

}
