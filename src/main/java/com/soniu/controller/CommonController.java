package com.soniu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.soniu.service.MovieService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	private MovieService movieService;

	@GetMapping("/")
	public String home() {

		return "redirect:/customLogin";
	}

	@GetMapping("/test")
	public String test() {
		return "/movie/APItest";
	}

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denied: " + auth);

		model.addAttribute("msg", "Access Denied");
	}

	/* ���� */
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);

		/* session user_id .. */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();
		log.info(user_id + "...login id");

		if (error != null) {
			model.addAttribute("error", "login error check your account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}

	/*
	 * @PostMapping("/customLogout") public void logoutPost() {
	 * log.info("post custom logout"); }
	 */

	@PostMapping("/logout_force")
	public String logoutPost(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		// SecurityContextHolder.clearContext();

		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication((Authentication) null);

		SecurityContextHolder.clearContext();
		
		return "redirect:/customLogin";

	}

}
