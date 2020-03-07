package com.soniu.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {

	/* 상학 */
	@GetMapping("/register")
	public void accessDenied(Authentication auth, Model model) {
		log.info("register called..");

	}
	
	/* 지경 */
	@GetMapping("/movieselect")
	public void movieSelect() {
		
	}
}
