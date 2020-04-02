package com.soniu.mapper_test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soniu.mapper.UserPreferMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapper_test {

	private UserPreferMapper mapper;

	@Test
	public void testGetMovieJoin() {
		//System.out.println(mapper.getMovieLocationSchedule().get(0).getActor() + "입니다");
		mapper.getUserPreferSchedule("user10").forEach(movie -> log.info(movie));
	}
}
