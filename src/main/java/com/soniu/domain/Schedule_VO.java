package com.soniu.domain;

import lombok.Data;

@Data
public class Schedule_VO {
	private String theatorId;
	private String movieId;
	private String startTime;	//시간포맷은 일단 String 으로 해둠
	private String endTime;		//아마 Controller에서 @InitBinder로 처리하면 될듯?
}
