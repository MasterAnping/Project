package com.zap.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zap.service.UserService;
import com.zap.vo.SimpleResult;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController{
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String loginPage(){
		return "login";
	}
	
	/**
	 * 登录验证
	 * @param username
	 * @param password
	 * @param rememberMe
	 * @return
	 */
	@RequestMapping("/loginCheck")
	@ResponseBody
	public SimpleResult loginCheck(String username,String password,boolean rememberMe,HttpSession session){
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username,password);
		token.setRememberMe(rememberMe);
		try{
			currentUser.login(token);	
			session.setAttribute("user", userService.queryUserByUsername(username));
		}catch(UnknownAccountException e){
			return new SimpleResult(false, "没有该账号");
		}catch(LockedAccountException e){
			return new SimpleResult(false, "该用户已被锁定");
		}catch(AuthenticationException e){
			return new SimpleResult(false, "用户名或密码错误");
		}
		return new SimpleResult(true);
	}
	
	

}
