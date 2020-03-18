package com.soniu.service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Service;

import com.soniu.domain.Schedule_VO;
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
		
		mapper.movieInsert(sv);
	}

}
