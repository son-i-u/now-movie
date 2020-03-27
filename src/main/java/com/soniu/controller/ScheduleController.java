package com.soniu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soniu.domain.Schedule_VO;
import com.soniu.domain.movie_VO;
import com.soniu.domain.page.Criteria;
import com.soniu.domain.page.PageDTO;
import com.soniu.service.ScheduleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/schedule/*")
@AllArgsConstructor
public class ScheduleController {

	ScheduleService service;

	/* jk */
	@GetMapping("/list")
	public void ScheduleList(Criteria cri, Model model, HttpServletRequest request) {
		log.info("list: " + cri);

		
		/* 스케쥴 리스트와 페이징을 리스트 길이 */
		List<Schedule_VO> svList = service.getList(cri);
		int svList_len = svList.size();

		model.addAttribute("auth", service.authCheck(request));
		model.addAttribute("list", svList);
		model.addAttribute("pageMaker", new PageDTO(cri, svList_len));
	}

	/* jk */
	@GetMapping("/insert")
	public void ScheduleInsertGet() {
		log.info("insert page called..");
	}

	/* jk */
	@GetMapping("/movieInsert")
	public void MovieInsertGet(movie_VO mv) {
		log.info("movieinsert page called..");

	}

	/* jk */
	@PostMapping("/movieInsert")
	public String movieInsertPost(movie_VO mv, MultipartFile[] uploadFile) {
		log.info("insert...: " + mv);

		/* DB insert*/
		service.movieInsert(mv,uploadFile);
		
		return "redirect:/schedule/list";
	}

	/* jk */
	@PostMapping("/insert")
	public String ScheduleInsertPost(Schedule_VO sv, RedirectAttributes rttr) {
		log.info("insert...: " + sv);
		service.insertSchedule(sv);
		rttr.addFlashAttribute("result", sv.getTheator_id());

		return "redirect:/schedule/list";
	}

	/* jk */
	@PostMapping("/remove")
	public String ScheduleRemove(String schedule_id, Criteria cri, RedirectAttributes rttr) {
		log.info("ScheduleRemove is called.. " + schedule_id);

		if (service.remove(schedule_id)) {
			rttr.addFlashAttribute("result", "success");
		}

		/* list �룎�븘媛덈븣 page �쑀吏� */
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/schedule/list";
	}
}
