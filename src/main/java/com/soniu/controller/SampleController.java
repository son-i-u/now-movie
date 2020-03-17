package com.soniu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sample/*")
public class SampleController {
	
	@GetMapping("/all")
	public void doALL() {
		log.info("do all can access everybody");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("logined member");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("admin only");
	}
	
	@GetMapping("/gpstest")
	public void gpsTest() {
		log.info("gps test page is called..");
		
	}
	
	@PostMapping("gpstest")
	public String gpsGetTest(String lat, String lon, Model model) {
		log.info("lat 입니다 : " + lat);
		log.info("lon 입니다 : " + lon);
		
		return "return:/movie/recommend";
	}

}
