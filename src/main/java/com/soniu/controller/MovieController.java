package com.soniu.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soniu.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
@AllArgsConstructor
public class MovieController {

	private MovieService movieService;
	
	@GetMapping("/NewFile")
	public void test(Model model) {
		model.addAttribute("movieInfoList", movieService.getMovieLocationSchedule());
		//return "NewFile";
	}

	@GetMapping("/recommend")
	public void recommendPage(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();
		
		model.addAttribute("preferList", movieService.getUserPrefer(user_id));
		model.addAttribute("movieInfoList", movieService.getMovieLocationSchedule());
	}

	/* jy */
	@GetMapping("/info")
	public void movieInfoPage(Model model, @RequestParam String id) {
		
		model.addAttribute("info", movieService.getMovieInfo(id));
	}

	/* jk */
	@GetMapping("/select")
	public void movieSelect(Model model) {

		/* get movie infomation and forward to select page */
		log.info("list ...");
		model.addAttribute("list", movieService.getList());
	}

	/* jk */
	@GetMapping("/evaluate")
	public void movieEvaluate(Model model) {

		/* user session id , static cause error at server start */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();

		/* stil not evaluated.. */
		log.info("evaluate page called.....");
		model.addAttribute("mncList", movieService.getMovieNotSee(user_id));
	}

	/* jk */
	@PostMapping("/evaluate")
	public String movieEvaluateInsert(String[] movieArray, String[] scoreArray) {
		log.info("movieEvaluateInsert called....");

		movieService.preferInsert(movieArray, scoreArray);
		
		return "redirect:/movie/recommend";
	}

	/* jk */
	@PostMapping("/select")
	public String movieSelectInsert(@RequestParam("test") String test,
			@RequestParam("movieArray") String[] movieArray) {

		log.info(movieArray.length + "개의 영화선호 선택됐습니다.");
		
		movieService.preferInsert(movieArray);

		return "redirect:/movie/recommend";
	}

}
