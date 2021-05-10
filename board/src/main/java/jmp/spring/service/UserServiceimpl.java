package jmp.spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import jmp.spring.mapper.UserMapper;
import jmp.spring.vo.UserVo;

public class UserServiceimpl implements UserService {

	@Autowired
	UserMapper mapper;
	
	@Override
	public UserVo login(String id, String pwd) {
		// TODO Auto-generated method stub
		return mapper.login(id, pwd);
	}

}
