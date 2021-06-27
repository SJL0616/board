package jmp.spring.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class User {
	int cno;
	int vno;
	String id;
	String pwd;
	String name;
	String email;
	// ��뿩��
	String enabled;
	
	String role_id;
	// ���� ����Ʈ
	List<String> role;
	
	// �ڵ��α��ο� �ʿ��� Ű��
	String sessionkey;
	// �ڵ��α����� ��ȿ�Ⱓ
	Date sessionlimit;

	public User () {};
	/*
	 * public User (int cno , String id,int vno) { this.cno=cno; this.vno=vno;
	 * this.id=id;
	 * 
	 * };
	 */
	
	/**
	 * ������ �ִ��� üũ �մϴ�.
	 * @param role_id
	 * @return
	 */
	public boolean hasRole(String role_id) {
		if(role!=null) {
			return role.contains(role_id);	
		}
		return false;
	}
	
}
