package com.soniu.domain;

import lombok.Data;

@Data
public class userInfoAuth_VO {
	private String userId;
	private String auth = "ROLE_USER";
}
