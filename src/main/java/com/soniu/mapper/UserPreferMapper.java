package com.soniu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.soniu.domain.userPreferMovie_VO;
import com.soniu.domain.userPreferSchedule_VO;
import com.soniu.domain.userPrefer_VO;

@Mapper
public interface UserPreferMapper {
	public void update(userPrefer_VO us_vo);
	public void insert(userPrefer_VO us_vo);
	public void insertNow(userPrefer_VO us_vo);
	public void changeNow(@Param("user_id") String user_id, @Param("movie_id") String movie_id, @Param("schedule_id") String schedule_id, @Param("prev_schedule") String prev_schedule);
	public List<userPrefer_VO> getNotSeeList(String user_id);
	public List<userPreferMovie_VO> getUserPrefer(String user_id);
	public List<userPreferSchedule_VO> getUserPreferSchedule(String user_id);
}
