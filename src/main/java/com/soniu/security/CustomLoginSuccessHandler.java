package com.soniu.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
		//일단 recommend로 보내고 나중에 admin 페이지 생기면 그쪽으로 redirect
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/movie/recommend");
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/movie/recommend");
			return;
		}
		
		response.sendRedirect("/movie/recommend");
	}

}
