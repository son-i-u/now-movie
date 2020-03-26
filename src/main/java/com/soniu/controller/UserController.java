package com.soniu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soniu.domain.userInfo_VO;
import com.soniu.domain.userInfoAuth_VO;
import com.soniu.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	UserService userService;
	
	/* ���� */
	@GetMapping("/register")
	public void accessDenied(Authentication auth, Model model) {
		log.info("register called..");

	}
	
	/* sh */
	@GetMapping("/register_test")
	public void registerTest(Authentication auth, Model model) {
		log.info("register test called..");

	}
	
	/* sh */
	@PostMapping("/register_test")
	public String registerPostTest(userInfo_VO uv,userInfoAuth_VO at) {
		log.info("registerPostTest called_....");
		
		userService.joinUser(uv, at);
		
		return "redirect:/movie/select/";
	}
	
		
	@PostMapping("/register")
	public String registerPost(userInfo_VO uv, userInfoAuth_VO at) {
		log.info("registerPost called_....");
		userService.joinUser(uv, at);
		
		return "redirect:/customLogin";
	}
	

}
