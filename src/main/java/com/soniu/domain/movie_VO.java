package com.soniu.domain;

import lombok.Data;

@Data
public class movie_VO {
	private String movieId;
	private String movieName;
	private String movieNameEn;
	private String movieGenre;
	private String movieDirector;
	private String movieActor;
	private String movieNation;
	private String movieImageLoc;
}
