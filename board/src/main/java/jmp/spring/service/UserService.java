package jmp.spring.service;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.UserVo;

public interface UserService {
	public UserVo login(UserVo user);
	public UserVo findId(UserVo user);
	public UserVo findId2(UserVo user);
	public List<String> userRole(String id);
	public int updateSessionkey(UserVo user);
	
	public UserVo loginSessionkey(String sessionkey);
	public int insertUser(UserVo user);
	public int insertUserRole(String id, String role); 
	public String  sendMail(UserVo user); 
	public int updatePwd(UserVo user); 
}
