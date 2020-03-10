package com.soniu.controller;

import java.util.ArrayList;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soniu.domain.userPrefer_VO;
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

	/* jk */
	@GetMapping("/select")
	public void movieSelect(Model model) {

		/* movie 정보를 가져와 movieselect 페이지에 뿌린다 */
		log.info("list ...");
		model.addAttribute("list", movieService.getList());
	}

	/* jk */
	@GetMapping("/evaluate")
	public void movieEvaluate(Model model) {
		/* 사용자 id static으로 선언하면 서버 올릴 때 load 안돼서 에러 */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();

		/* 평가하지 못한 영화 list와 movie img를 부른다. */
		log.info("evaluate page called.....");
		model.addAttribute("nsList", movieService.getNotSeeList(user_id));
		model.addAttribute("mncList", movieService.getMovieNotSee(user_id));
	}

	/* jk */
	@PostMapping("/evaluate")
	public String movieEvaluateInsert(String[] movieArray, String[] scoreArray) {

		log.info(movieArray[0] + "movie_id");
		log.info(scoreArray[0] + "score..");

		/* 사용자 id static으로 선언하면 서버 올릴 때 load 안돼서 에러 */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();

		/* 사용자 아이디와 선택된 영화 = userprefer */
		for (int i = 0; i < movieArray.length; i++) {
			userPrefer_VO uf = new userPrefer_VO();
			uf.setUser_id(user_id);
			uf.setMovie_id(movieArray[i]);
			uf.setScore(Integer.parseInt(scoreArray[i]));

			movieService.preferInsert(uf);
		}

		return "redirect:/movie/recommend";
	}

	/* jk */
	@PostMapping("/select")
	public String movieSelectInsert(@RequestParam("test") String test,
			@RequestParam("movieArray") String[] movieArray) {

		log.info(movieArray.length + "개의 영화선호 선택됐습니다.");

		/* 사용자 id static으로 선언하면 서버 올릴 때 load 안돼서 에러 */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();

		/* 사용자 아이디와 선택된 영화 = userprefer */
		for (int i = 0; i < movieArray.length; i++) {
			userPrefer_VO uf = new userPrefer_VO();
			uf.setUser_id(user_id);
			uf.setMovie_id(movieArray[i]);
			uf.setScore(3);

			movieService.preferInsert(uf);
		}

		return "redirect:/movie/recommend";
	}

}
