package com.soniu.service;

import java.util.List;

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
		// TODO Auto-generated method stub
		log.info("getList.........");
		log.info("first data... " + movieMapper.getList().get(0).getActor()+"");

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

}
