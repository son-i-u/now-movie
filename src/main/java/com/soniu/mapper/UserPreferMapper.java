package com.soniu.mapper;

import java.util.List;

import com.soniu.domain.userPrefer_VO;
import com.soniu.domain.userPreferMovie_VO;

public interface UserPreferMapper {
	public void insert(userPrefer_VO us_vo);
	public List<userPrefer_VO> getNotSeeList(String user_id);
	public List<userPreferMovie_VO> getUserPrefer(String user_id);
}
