package com.soniu.domain;

import lombok.Data;

@Data
public class movie_VO {
	private String movie_id;
	private String movie_nm;
	private String movie_nm_en;
	private String genre;
	private String director;
	private String actor;
	private String nation;
	private String img_loc;
}
