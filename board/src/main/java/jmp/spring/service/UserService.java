package jmp.spring.service;



import jmp.spring.vo.UserVo;

public interface UserService {
	public UserVo login(String id, String pwd);
}
