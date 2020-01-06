package com.khrd.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("🏳‍🌈 PRE Handle");
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("🏳‍🌈 POST Handle");
		
		Object loginId = modelAndView.getModel().get("login");
		Object nickname = modelAndView.getModel().get("nick");
		
		if(loginId != null) {
			//session영역의 Auth키에 userId 저장
			System.out.println("로그인 완료");
			request.getSession().setAttribute("Auth", loginId);
			request.getSession().setAttribute("Nick", nickname);
			
			String dest = (String) request.getSession().getAttribute("dest"); //기존 주소
			if(dest != null) {
				response.sendRedirect(dest); 
			}else {
				response.sendRedirect(request.getContextPath()); //home 이동
			}
		}
		
	}

}
