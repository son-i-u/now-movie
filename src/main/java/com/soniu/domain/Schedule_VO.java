package com.soniu.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Schedule_VO {
	private String schedule_id;
	private String theator_id;
	private String movie_id;
	private String start_time;	//시간포맷은 일단 String 으로 해둠
	private String end_time;		//아마 Controller에서 @InitBinder로 처리하면 될듯?
}
