package com.soniu.security;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		// TODO Auto-generated method stub

		log.warn("login success");
		
		
		
		//session
		HttpSession session = request.getSession();
		String user_id = auth.getName();
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		
		log.warn("ROLE NAMES: " + roleNames);
		
		
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/movie/recommend");
			session.setAttribute("AUTH_ROLE", "ROLE_USER");
			session.setAttribute("USER_ID", user_id);
			session.setAttribute("logout", "로그아웃 되었습니다.");
			return;
			
			
		}
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/schedule/list");
			session.setAttribute("AUTH_ROLE", "ROLE_ADMIN");
			session.setAttribute("USER_ID", user_id);
			session.setAttribute("logout", "로그아웃 되었습니다.");
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/schedule/list");
			session.setAttribute("AUTH_ROLE", "ROLE_MEMBER");
			session.setAttribute("USER_ID", user_id);
			session.setAttribute("logout", "로그아웃 되었습니다.");
			return;
		}
		
		
		
		response.sendRedirect("/movie/recommend");
	}

}
