package com.soniu.mapper;

import java.util.List;

import com.soniu.domain.Schedule_VO;
import com.soniu.domain.page.Criteria;

public interface ScheduleMapper {
	public List<Schedule_VO> getListWithPaging(Criteria cri);
	public void movieInsert(Schedule_VO sv);
	public boolean remove(String schedule_id);
}
