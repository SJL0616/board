package jmp.spring.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVo {

	
 String id;
 String pwd;
 char enabled;
 String name;
 String email;
List<String> role;

//�ڵ��α��ο� �ʿ��� Ű��
String sessionkey;
//
Date sessionlimit;

public boolean hasRole(String role_id) {
	return role.contains(role_id);
	
};
}
