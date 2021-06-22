package jmp.spring.mapper;

import java.util.List;

import jmp.spring.vo.Criteria;
import jmp.spring.vo.User;

public interface UserMapper {

	public User login(User user);
	
	public int registerMember(User user);
	
	public int updateSessionkey(User user);
	
	public User checkId(String id);
	
	public User loginSessionkey(String sessionkey);
	
	public List<String> getRole(String id);
	
	public User idSearch(User user);
	
	public User pwdSearch(User user);
	
	public int updatePwd(User user);

	public int updateMember(User user);
	
	public int insertRole(User user);

	public List<String> getList(Criteria cri);

	public int updateRole(User user);

	public int getTotal(Criteria cri);

}
