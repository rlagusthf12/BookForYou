package com.bookforyou.bk4u.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") == null) {
			session.setAttribute("loginMsg", "로그인 후 이용 가능한 서비스입니다.");
			response.sendRedirect("main.me");
			
			return false;
		}

		return true;
	}
}
