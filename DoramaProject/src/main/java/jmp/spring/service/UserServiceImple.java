package jmp.spring.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.UserMapper;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.User;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImple implements UserService{

	@Autowired
	UserMapper mapper;

	
	@Override
	public User login(User user) {
		
		User res = checkPwd(user);
		log.info("=============="+user.getPwd());
		log.info("=============="+res);
		
		//id를 통해서 user객체를 반환받고 비밀번호가 일치하면
		if(res !=null) {
			List<String> role = mapper.getRole(user.getId());
			res.setRole(role);
			
		}
		return res;
	}

	/**
	 * user객체의 id와 pwd를 파라메터로 입력받아서 데이터베이스의 계정을 확인
	 * @param user
	 * @return
	 */
	public User checkPwd(User user) {
		User res = mapper.login(user);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("=======================user"+user);
		System.out.println("=======================res"+res);
		if(res != null) {
			//id를 통해서 user객체를 반환받고 비밀번호가 일치하면
			log.info("==============비번 일치확인:"+encoder.matches(user.getPwd(),res.getPwd()));
			if(encoder.matches(user.getPwd(), res.getPwd())) {
				return res;
			}
		}
		return null;
	}
	
	@Override
	public int registerMember(User user) {
		int res = mapper.registerMember(user);
		return res;
	}


	@Override
	public int updateSessionkey(User user) {
		// TODO Auto-generated method stub
		return mapper.updateSessionkey(user);
	}


	@Override
	public User checkId(String id) {
		return mapper.checkId(id);
	}


	@Override
	public User loginSessionkey(String sessionkey) {
		// TODO Auto-generated method stub
				User user = mapper.loginSessionkey(sessionkey);
				List<String> role = mapper.getRole(user.getId());
				// 占쏙옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙莩求占�.
				user.setRole(role);
				return user;
	}


	@Override
	public User idSearch(User user) {
		 
		return mapper.idSearch(user);
	}


	@Override
	public User pwdSearch(User user) {
		User res = mapper.pwdSearch(user);

		return res;
	}


	@Override
	public int updatePwd(User user) {
		BCryptPasswordEncoder encorder = new BCryptPasswordEncoder();
		user.setPwd(encorder.encode(user.getPwd()));
		int pwd = mapper.updatePwd(user);
		return pwd;
	}


	@Override
	public int updateMember(User user) {
		//1.비밀번호 확인
		User res = checkPwd(user);
		//2. 업데이트
		if(res!=null) {
			int resUpdate = mapper.updateMember(user);
			return resUpdate;
		}
		return 0;
	}

	@Override
	public int insertRole(User user) {
		int res = mapper.insertRole(user);
		return res;
	}

	@Override
	public List<String> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(cri);
	}

	@Override
	public int updateRole(User user) {
		// TODO Auto-generated method stub
		return mapper.updateRole(user);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}

	
	

	
	
}
