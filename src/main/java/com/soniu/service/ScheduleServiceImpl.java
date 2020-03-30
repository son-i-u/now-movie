package com.soniu.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.soniu.domain.Schedule_VO;
import com.soniu.domain.movie_VO;
import com.soniu.domain.page.Criteria;
import com.soniu.mapper.ScheduleMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {

	ScheduleMapper mapper;

	@Override
	public List<Schedule_VO> getList(Criteria cri) {
		log.info("geList with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void insertSchedule(Schedule_VO sv) {
		log.info("insertSchedule is called.. ");

		mapper.scheduleInsert(sv);
	}

	@Override
	public boolean remove(String schedule_id) {
		log.info("shcedule remove is called..");
		log.info(schedule_id);

		return mapper.remove(schedule_id);
	}

	@Override
	public void movieInsert(movie_VO mv, MultipartFile[] uploadFile) {

		/* 저장 위치 */
		String uploadFolder = "C:\\image";

		/* img_loc 을 위한 파싱 */
		String img_loc = "/img/"+mv.getMovie_nm_en()+".png";
		mv.setImg_loc(img_loc);
		/*
		 * for (MultipartFile multipartFile : uploadFile) {
		 * log.info("------------------------------------------------");
		 * log.info("Upload File Name: " + multipartFile.getOriginalFilename());
		 * log.info("Upload File Size :" + multipartFile.getSize());
		 * 
		 * /* 파일 타입 지정을 위한 파싱 String file_type = multipartFile.getContentType();
		 * String[] type_parse = file_type.split("/");
		 * 
		 * if (type_parse[1].equals("jpeg")) { type_parse[1] = "jpg"; }
		 * 
		 * 파일이름 movie_nm_en + jpg / png String file_name = mv.getMovie_id()+ "." +
		 * type_parse[1];
		 * 
		 * 파일 저장 File saveFile = new File(uploadFolder, file_name);
		 * 
		 * movie 객체 변경 img_loc = img_loc + file_name; mv.setImg_loc(img_loc);
		 * 
		 * transferTo = 저장 try { multipartFile.transferTo(saveFile); } catch (Exception
		 * e) { log.error(e.getMessage()); } }
		 */
		mapper.movieInsert(mv);
	}

	@Override
	public String authCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String object_role = (String) session.getAttribute("AUTH_ROLE");

		boolean member_check = false;

		log.info(object_role + "입니다");
		log.info(session);
		if (object_role.equals("ROLE_ADMIN")) {
			member_check = !member_check;
		}
		return Boolean.toString(member_check);
	}

	@Override
	public int getScheduleSize() {

		return mapper.getScheduleSize();
	}

}
