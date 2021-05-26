package jmp.spring.control;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jmp.spring.service.UserService;
import jmp.spring.vo.UserVo;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@RestController
@Log4j
public class UserAjaxController {

	
	@Autowired
	public UserService uservice;
	
	
	@PostMapping("/findIdProcess")
	public Map<String, Object> checkDB(@RequestBody UserVo user){
		log.info("================user:"+user);
		UserVo uvo = new UserVo();
		String tpwd= "";
		if(user.getId()==null) {
			
			 uvo= uservice.findIdByNameEmail(user);
		}else {
			uvo= uservice.findIdByIdEmail(user);
			if(uvo!=null) {
			tpwd=	uservice.sendMail(user);
			}
			
		}
		
		
		
		
		log.info("================uvo:"+uvo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		 if(uvo==null) {
		  map.put("result", "error");
		  return map; 
		  
		  }else {
		  map.put("result", uvo);  
		  map.put("tpwd", tpwd);
		  return map; 
		  
		  }
		
		
		
		
	}
	
}
