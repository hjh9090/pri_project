package com.sesoc.homework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInter extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle (HttpServletRequest request, HttpServletResponse response
			,Object handler) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id == null) {
			response.sendRedirect(request.getContextPath()+"/member/loginForm");
			return false;
		}
		return true;
	}
	
	
	
}
