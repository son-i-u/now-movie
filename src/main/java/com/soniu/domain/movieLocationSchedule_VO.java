package com.soniu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class movieLocationSchedule_VO {
	private String movie_id;
	private String movie_nm;
	private String movie_nm_en;
	private String genre;
	private String director;
	private String actor;
	private String nation;
	private String img_loc;
	
	private String theator_id;
	private Date start_time;
	private Date end_time;
	private int left_min;
	//private long interval = end_time.getTime() - start_time.getTime();
}
