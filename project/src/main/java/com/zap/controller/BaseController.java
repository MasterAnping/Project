package com.zap.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zap.entity.User;
import com.zap.exception.InnerErrorException;
import com.zap.vo.SimpleResult;

public class BaseController {

	@ExceptionHandler(value = { InnerErrorException.class })
	public String exception(HttpServletRequest request,
			HttpServletResponse response, Exception exception) {
		if (request.getHeader("X-Requested-With") != null
				&& request.getHeader("X-Requested-With").contains(
						"XMLHttpRequest")) {
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter writer = response.getWriter();
				Gson gson = new GsonBuilder().create();
				writer.write(gson.toJson(new SimpleResult(false, exception
						.getMessage())));
				writer.flush();
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
			return null;
		}
		request.setAttribute("message", exception.getMessage());
		return "error/error";
	}

	public User getCurrentUser() {
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		return (User) session.getAttribute("user");
	}
	
	
	
	public String toJson2(Object object) throws JsonProcessingException{
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(object);
	}

}
