package com.zap.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zap.entity.Permission;
import com.zap.entity.Role;
import com.zap.entity.User;
import com.zap.service.PermissionService;
import com.zap.service.RoleService;
import com.zap.service.UserService;

public class MyRealm extends AuthorizingRealm {

	private static final Logger log = LoggerFactory.getLogger(MyRealm.class);

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private PermissionService permissionService;

	public void clearUserCache(String userId) {
		SimplePrincipalCollection pc = new SimplePrincipalCollection();
		pc.add(userId, super.getName());
		super.clearCachedAuthorizationInfo(pc);
	}

	public void clearAllCache() {
		getAuthorizationCache().clear();
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principal) {
		String logonName = (String) principal.getPrimaryPrincipal();
		log.debug(logonName);
		if (logonName != null) {
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			for (Role role : roleService.queryRolesByUsername(logonName)) {
				info.addRole(role.getRoleName());
				for (Permission permission : permissionService.queryPermissionsByRoleId(role
						.getRoleId())) {
					info.addStringPermission(permission.getPermissionName());
				}
			}
			return info;
		}
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		String logonName = token.getUsername();
		log.debug(logonName);
		User user = userService.queryUserByUsername(logonName);
		return new SimpleAuthenticationInfo(logonName, user.getPassword(),
				getName());
	}

}

