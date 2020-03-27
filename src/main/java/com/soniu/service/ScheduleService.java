package com.soniu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.soniu.domain.Schedule_VO;
import com.soniu.domain.movie_VO;
import com.soniu.domain.page.Criteria;

public interface ScheduleService {
	public List<Schedule_VO> getList(Criteria cri);
	public void insertSchedule(Schedule_VO sv);
	public boolean remove(String schedule_id);
	public String authCheck(HttpServletRequest request);
	
	/*movie*/
	public void movieInsert(movie_VO mv, MultipartFile[] uploadFile);
}
