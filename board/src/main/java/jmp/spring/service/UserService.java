package jmp.spring.service;



import java.util.List;

import jmp.spring.vo.UserVo;

public interface UserService {
	public UserVo login(String id, String pwd);
	public List<String> userRole(String id);
	public int updateSessionkey(UserVo user);
	
	public UserVo loginSessionkey(String sessionkey);
	
}
