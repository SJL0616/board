package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.UserVo;

public interface UserMapper {

	public UserVo login(@Param("id") String id, @Param("pwd") String pwd);
	public List<String> userRole(String id);
	public int updateSessionkey(UserVo user);
	public UserVo loginSessionkey(String sessionkey);
	public int insertUser(UserVo user); 
	public int insertUserRole(@Param("id") String id, @Param("role") String role);

}