package com.zap.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zap.entity.User;
import com.zap.service.UserService;
import com.zap.vo.SimpleResult;

@Controller
@RequestMapping("user")
public class UserController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/registerCheck")
	public SimpleResult register(User user, HttpServletRequest request) {
		userService.addUser(user);
		return new SimpleResult(true);
	}

}
