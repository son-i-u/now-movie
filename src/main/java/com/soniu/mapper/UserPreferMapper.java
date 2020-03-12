package com.soniu.mapper;

import java.util.List;

import com.soniu.domain.userPrefer_VO;

public interface UserPreferMapper {
	public void insert(userPrefer_VO us_vo);
	public List<userPrefer_VO> getNotSeeList(String user_id);
	public List<userPrefer_VO> getUserPrefer(String user_id);
}
