package com.soniu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soniu.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
@AllArgsConstructor
public class MovieController {
	
	private MovieService movieService;
	

	/* 재연 */	
	@GetMapping("/recommend")
	public void recommendPage() {
		
	}
	
	/* 재연 */
	@GetMapping("/movieinfo")
	public void movieInfoPage() {
		
	}
	
	/* 지경 */
	@GetMapping("/movieselect")
	public void movieSelect(Model model) {
		/* movie 정보 (id, 주소 ) 를 가져와 movieselect 페이지에 뿌린다 */
		
		log.info("list ...");
		model.addAttribute("list", movieService.getList());
	}
	
	/* 지경 */
	@PostMapping("/movieselect")
	public void movieSelectInsert(){
		
	}
	

}
