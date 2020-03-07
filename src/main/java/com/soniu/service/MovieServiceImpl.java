package com.soniu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.soniu.domain.movie_VO;
import com.soniu.mapper.MovieMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MovieServiceImpl implements MovieService {

	private MovieMapper movieMapper;

	@Override
	public List<movie_VO> getList() {
		// TODO Auto-generated method stub
		log.info("getList.........");
		log.info("first data... " + movieMapper.getList().get(0).getActor()+"");

		return movieMapper.getList();
	}


}
