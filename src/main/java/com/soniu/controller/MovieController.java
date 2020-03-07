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
	

	/* �翬 */	
	@GetMapping("/recommend")
	public void recommendPage() {
		
	}
	
	/* �翬 */
	@GetMapping("/movieinfo")
	public void movieInfoPage() {
		
	}
	
	/* ���� */
	@GetMapping("/movieselect")
	public void movieSelect(Model model) {
		/* movie ���� (id, �ּ� ) �� ������ movieselect �������� �Ѹ��� */
		
		log.info("list ...");
		model.addAttribute("list", movieService.getList());
	}
	
	/* ���� */
	@PostMapping("/movieselect")
	public void movieSelectInsert(){
		
	}
	

}
