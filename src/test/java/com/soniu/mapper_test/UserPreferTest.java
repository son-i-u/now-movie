package com.soniu.mapper_test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soniu.domain.userPrefer_VO;
import com.soniu.mapper.UserPreferMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserPreferTest {

	@Setter(onMethod_ = @Autowired)
	private UserPreferMapper mapper;
	
	@Test
	public void preferInsertTest() {
		
		int start_movie_id = 11;
		
		for(int i=1; i<80; i++) {
			userPrefer_VO uv = new userPrefer_VO();
			
			if(start_movie_id > 20) {
				start_movie_id -= 10;
			}
			
			int start_score = 1;
			
			for(int j=0;j<5; j++) {
				String user_id = "user" + i;
				int movie_id = start_movie_id + j;
				
				if(movie_id > 20) {
					movie_id -= 10;
				}
				String mv_id = String.valueOf(movie_id);
			
				uv.setUser_id(user_id);
				uv.setMovie_id(mv_id);
				
				if(start_score > 5) {
					start_score -= 5;
				}
				uv.setScore(start_score);
				
				mapper.insert(uv);
				start_score += 1;
			}
			
			start_movie_id += 1;
			
		}
		
		
		//mapper.scheduleInsert(sv);
	}
}
