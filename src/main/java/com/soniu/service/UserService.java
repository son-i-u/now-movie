package com.soniu.service;

import com.soniu.domain.userInfo_VO;
import com.soniu.domain.userInfoAuth_VO;

public interface UserService {
	public void joinUser(userInfo_VO uv, userInfoAuth_VO at);
	//public void authority(userInfoAuth_VO at);

}
