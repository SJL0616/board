package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.UserMapper;
import jmp.spring.vo.UserVo;
@Service
public class UserServiceimpl implements UserService {

	@Autowired
	UserMapper mapper;
	
	@Override
	public UserVo login(String id, String pwd) {
		// TODO Auto-generated method stub
		return mapper.login(id, pwd);
	}

	@Override
	public List<String> userRole(String id) {
		// TODO Auto-generated method stub
		return mapper.userRole(id);
	}

}
