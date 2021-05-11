package jmp.spring.vo;

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

public boolean hasRole(List<String> role_id) {
	return role.contains("ROLE_ADMIN");
	
};
}
