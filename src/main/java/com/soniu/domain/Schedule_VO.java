package com.soniu.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Schedule_VO {
	private String schedule_id;
	private String theator_id;
	private String movie_id;
	private String start_time;
	private String end_time;
}
