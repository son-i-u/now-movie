package com.soniu.mapper;

import com.soniu.domain.movie_VO;
import com.soniu.domain.theator_VO;

import java.util.List;

import com.soniu.domain.Schedule_VO;

public interface MovieMapper {
	public List<movie_VO> getList();
	public movie_VO read(String movie_id);
}
