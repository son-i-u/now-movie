package com.soniu.service_test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soniu.service.MovieService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieService_test {
	
	@Setter(onMethod_ = {@Autowired})
	private MovieService service;
	
	@Test
	public void testCustom_VO() {
		service.getMovieLocationSchedule().forEach(movie -> log.info(movie));
	}
}
