package com.soniu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soniu.domain.Schedule_VO;
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
	public void ScheduleList(Criteria cri, Model model) {
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 20));
	}

	/* jk */
	@GetMapping("/insert")
	public void ScheduleInsertGet() {
		log.info("insert page called..");
	}

	/* jk */
	@PostMapping("/insert")
	public String ScheduleInsertPost(Schedule_VO sv, RedirectAttributes rttr) {
		log.info("insert...: " + sv);
		service.insertSchedule(sv);
		rttr.addFlashAttribute("result", sv.getTheator_id());

		return "redirect:/schedule/list";
	}
}
