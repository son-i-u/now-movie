package com.soniu.service;

import java.util.List;

import com.soniu.domain.movie_VO;
import com.soniu.domain.userPrefer_VO;
import com.soniu.domain.userPreferMovie_VO;
import com.soniu.domain.movieLocationSchedule_VO;

public interface MovieService {
	
	/* movie */
	public List<movie_VO> getList();
	public List<movie_VO> getMovieInfo(String movie_id);
	public List<movie_VO> getMovieNotSee(String user_id);
	
	/* user_prefer */
	public void preferInsert(userPrefer_VO pr_vo);
	public void preferInsert(String[] movieArray);
	public void preferInsert(String[] movieArray, String[] scoreArray);
	public List<userPrefer_VO> getNotSeeList(String user_id);
	
	/* USER x USER_PREFER join */
	public List<userPreferMovie_VO> getUserPrefer(String user_id);

	/* MOVIE x THEATOR x SCHEDULE join */
	public List<movieLocationSchedule_VO> getMovieLocationSchedule();
}                       
