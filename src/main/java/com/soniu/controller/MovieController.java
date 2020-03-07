package com.soniu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
@AllArgsConstructor
public class MovieController {
	

	/* 재연 */	
	@GetMapping("/recommend")
	public void recommendPage() {
		
	}
	
	/* 재연 */
	@GetMapping("/movieinfo")
	public void movieInfoPage() {
		
	}
	
	

}
