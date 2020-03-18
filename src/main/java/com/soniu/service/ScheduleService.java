package com.soniu.service;

import java.util.List;

import com.soniu.domain.Schedule_VO;
import com.soniu.domain.page.Criteria;

public interface ScheduleService {
	public List<Schedule_VO> getList(Criteria cri);
	public void insertSchedule(Schedule_VO sv);
}
