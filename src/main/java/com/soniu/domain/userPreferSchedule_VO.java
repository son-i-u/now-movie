package com.soniu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class userPreferSchedule_VO {
	private String user_id;
	private String schedule_id;
	private int score;

	private String movie_id;
	private Date start_time;
	private Date end_time;
}
