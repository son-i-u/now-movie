package com.soniu.mapper_test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soniu.domain.Schedule_VO;
import com.soniu.mapper.ScheduleMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ScheduleMapper_test {


	@Setter(onMethod_ = @Autowired)
	private ScheduleMapper mapper;
	
	@Test
	public void scheduleInsertTest() {
		
		//mapper.scheduleInsert(sv);
	}
}
