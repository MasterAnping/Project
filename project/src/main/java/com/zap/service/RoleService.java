package com.zap.service;

import java.util.Set;

import com.zap.entity.Role;

public interface RoleService {
	
	Role queryRoleByRoleId(int roleId);
			
	Set<Role> queryAllRole();

	Set<Role> queryRoleByUserId(int userId);
	
	Set<Role> queryRolesByUsername(String username);

}
