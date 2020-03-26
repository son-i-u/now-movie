package com.soniu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soniu.mapper.UserMapper;
import com.soniu.domain.userInfoAuth_VO;
import com.soniu.domain.userInfo_VO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	@Override
	public void joinUser(userInfo_VO uv, userInfoAuth_VO at) {
		
		/* pw encreted */
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
		String ecPw = bc.encode(uv.getPWD());
		uv.setPWD(ecPw);
		at.setUSERID(uv.getUSER_ID());
		at.setAUTH("ROLE_USER");
	
		userMapper.join(uv);
		userMapper.join2(at);
		
	}
	
	
	
}
