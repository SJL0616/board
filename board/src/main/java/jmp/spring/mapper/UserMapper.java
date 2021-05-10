package jmp.spring.mapper;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.UserVo;

public interface UserMapper {

	public UserVo login(@Param("id") String id, @Param("pwd") String pwd);
}
