package com.soniu.domain;

import lombok.Data;

@Data
public class userInfo_VO {
	private String userId;
	private String userPwd;
	private int userAge;
	private String userGender;
	private int enabled;
}
