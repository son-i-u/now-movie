package com.soniu.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.soniu.domain.movie_VO;
import com.soniu.domain.userPrefer_VO;
import com.soniu.mapper.MovieMapper;
import com.soniu.mapper.UserPreferMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MovieServiceImpl implements MovieService {

	private MovieMapper movieMapper;
	private UserPreferMapper userPreferMapper;

	@Override
	public List<movie_VO> getList() {
		log.info("getList.........");
		
		return movieMapper.getList();
	}

	@Override		
	public void preferInsert(userPrefer_VO pr_vo) {
		log.info("userprefer insert...");
		
		userPreferMapper.insert(pr_vo);
	}

	@Override
	public List<userPrefer_VO> getNotSeeList(String user_id) {
		
		return userPreferMapper.getNotSeeList(user_id);
	}

	@Override
	public List<movie_VO> getMovieNotSee(String user_id) {
		
		return movieMapper.getMovieNotSee(user_id);
	}

	@Override
	public void preferInsert(String[] movieArray) {
		
		/* user session id  , static cause error at server start */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();
		
		/* user id, selected id, default 3 score =  userprefer */
		for (int i = 0; i < movieArray.length; i++) {
			userPrefer_VO uf = new userPrefer_VO();
			uf.setUser_id(user_id);
			uf.setMovie_id(movieArray[i]);
			uf.setScore(3);

			userPreferMapper.insert(uf);
		}

	}

	@Override
	public void preferInsert(String[] movieArray, String[] scoreArray) {
		/* user session id , static cause error at server start */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();
		
		/* evaluated info to user_prefer */
		for (int i = 0; i < movieArray.length; i++) {
			userPrefer_VO uf = new userPrefer_VO();
			uf.setUser_id(user_id);
			uf.setMovie_id(movieArray[i]);
			uf.setScore(Integer.parseInt(scoreArray[i]));

			userPreferMapper.insert(uf);
		}
		
	}

}
