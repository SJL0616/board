package jmp.spring.service;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.ManuMapper;
import jmp.spring.mapper.UserMapper;
import jmp.spring.vo.ManuVo;
import jmp.spring.vo.UserVo;
@Service
public class UserServiceimpl implements UserService {

	@Autowired
	UserMapper mapper;
	
	@Autowired
	ManuMapper mmapper;
	
	
	@Override
	public UserVo login(UserVo user) {
		UserVo loginUser = mapper.login(user);
		if(loginUser !=null) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			if(encoder.matches(user.getPwd(),loginUser.getPwd())){
			
			String encod = encoder.encode(user.getPwd()); //비밀번호 암호화
			user.setPwd(encod);//암호화된 비밀번호를 user객체에 넣어줌
			}
		}
		List<String> role = mapper.userRole(loginUser.getId());
		loginUser.setRole(role);
		return loginUser;
	}

	@Override
	public List<String> userRole(String id) {
		// TODO Auto-generated method stub
		
		return mapper.userRole(id);
	}

	@Override
	public int updateSessionkey(UserVo user) {
		// TODO Auto-generated method stub
		return mapper.updateSessionkey(user);
	}

	@Override
	public UserVo loginSessionkey(String sessionkey) {
		// TODO Auto-generated method stub
		
		UserVo user= mapper.loginSessionkey(sessionkey);
		  user.setRole(mapper.userRole(user.getId()));
		return user;
	}

	@Override
	public int insertUser(UserVo user) {
		// TODO Auto-generated method stub
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("===============1234의 암호화된 문자열"+ encoder.encode("1234"));
		String encod = encoder.encode(user.getPwd()); //비밀번호 암호화
		user.setPwd(encod);//암호화된 비밀번호를 user객체에 넣어줌
		
		int res =  mapper.insertUser(user);
		if(res>0) {
			res= mapper.insertUserRole(user.getId(), "ROLE_USER");
		}
		return res; 
	}

	@Override
	public int insertUserRole(String id,String role) {
		// TODO Auto-generated method stub
		return mapper.insertUserRole(id, role);
	}

	@Override
	public String sendMail(UserVo user) {
		System.out.println("임시 비밀번호===========uuid"+UUID.randomUUID().toString().substring(0, 7));
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String tpwd= UUID.randomUUID().toString().substring(0, 7);
		System.out.println("임시 비밀번호===========twd"+tpwd);
		String encod = encoder.encode(tpwd);
		System.out.println("저장되는 번호===========encod"+encod);
	    user.setPwd(encod);
	    System.out.println("저장되는 user===========encod"+user);
		int res=mapper.updatePwd(user);
		 System.out.println("결과==========="+res);
		return tpwd;
	}

	@Override
	public int updatePwd(UserVo user) {
		// TODO Auto-generated method stub
		return mapper.updatePwd(user);
	}

	@Override
	public UserVo findId(UserVo user) {
		// TODO Auto-generated method stub
		return mapper.findId(user);
	}

	@Override
	public UserVo findId2(UserVo user) {
		// TODO Auto-generated method stub
		return mapper.findId2(user);
	}

	@Override
	public UserVo findId3(String id) {
		// TODO Auto-generated method stub
		return mapper.findId3(id);
	}

	@Override
	public List<ManuVo> createMenu() {
		// TODO Auto-generated method stub
		return mmapper.createMenu();
	}

	
	

}
