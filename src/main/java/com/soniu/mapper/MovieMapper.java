package com.soniu.mapper;

import com.soniu.domain.movie_VO;
import com.soniu.domain.movieLocationSchedule_VO;

import java.util.List;

public interface MovieMapper {
	public List<movie_VO> getList();
	public List<movie_VO> getMovieInfo(String movie_id);
	public List<movie_VO> getMovieNotSee(String user_id);
	public movie_VO read(String movie_id);
	public List<movieLocationSchedule_VO> getMovieLocationSchedule();
}
