package com.soniu.mapper_test;

import java.util.Random;

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
		
		
		for (int i = 1; i <200 ; i++) {
			userPrefer_VO uv = new userPrefer_VO();
			Random rand = new Random();
			
			double dValue = Math.random();
			int iValue = (int) (dValue * 79) + 1;

			String user_id = "user" + iValue;
			
			int min = 57;
			int max = 129;

			int randomNum = rand.nextInt(max - min + 1) + min;
			String mv_id = String.valueOf(randomNum);

			dValue = Math.random();
			iValue = (int) (dValue * 5) + 1;
					
			uv.setScore(iValue);
			uv.setUser_id(user_id);
			uv.setMovie_id(mv_id);

			mapper.insert(uv);

		}
		

		// mapper.scheduleInsert(sv);
	}
}
