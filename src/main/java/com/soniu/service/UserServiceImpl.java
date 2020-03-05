package com.soniu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soniu.mapper.UserMapper;
import com.soniu.domain.userInfo_VO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	@Transactional
	@Override
	public userInfo_VO getAllUserInfo() {
		return userMapper.read();
	}
}
