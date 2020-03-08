package com.soniu.service;

import java.util.List;

import com.soniu.domain.movie_VO;
import com.soniu.domain.userPrefer_VO;

public interface MovieService {
	public List<movie_VO> getList();
	
	/* user_prefer */
	public void preferInsert(userPrefer_VO pr_vo);

}
