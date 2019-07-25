package com.zap.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.zap.dao.UserMapper;
import com.zap.dao.UserRoleMapper;
import com.zap.entity.User;
import com.zap.entity.UserRoleKey;
import com.zap.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Override
	public User queryUserByUserId(int userId) {
		return userMapper.selectByUserId(userId);
	}

	@Override
	public User queryUserByUsername(String username) {
		return userMapper.selectByUsername(username);
	}

	@Override
	public void addUser(User user) {
		user.setIsLocked(false);
		userMapper.insertSelective(user);		
		userRoleMapper.insert(new UserRoleKey(user.getUserId(), 2));
	}

	



	
	

}
