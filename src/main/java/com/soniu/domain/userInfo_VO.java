package com.soniu.domain;

import lombok.Data;

@Data
public class userInfo_VO {
	private String USER_ID;
	private String PWD;
	private String BIRTH;
	private String GENDER;
	private int ENABLED = 1;
	private String PHONE_NUM;
}
