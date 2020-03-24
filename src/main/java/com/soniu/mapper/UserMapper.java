package com.soniu.mapper;

import com.soniu.domain.userInfo_VO;
import com.soniu.domain.userInfoAuth_VO;
import com.soniu.domain.userPrefer_VO;

public interface UserMapper {
	
	/*method name과 mapper.xml id와 같아야한다. */
	public userInfo_VO read(/* String USER_ID */);
	public void join(userInfo_VO us_vo);
	

}
