package com.soniu.domain;

import lombok.Data;

@Data
public class userPreferMovie_VO {
	private String user_id;
	private int score;
	
	private String movie_id;
	private String movie_nm;
	private String movie_nm_en;
	private String genre;
	private String director;
	private String actor;
	private String nation;
	private String img_loc;
}
