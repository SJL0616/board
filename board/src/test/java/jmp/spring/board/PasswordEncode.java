package jmp.spring.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUpload;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jmp.spring.mapper.FileUploadMapper;
import jmp.spring.mapper.UserMapper;
import jmp.spring.service.AttachFileServiceimpl;
import jmp.spring.service.UserService;
import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.BoardVo;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.UserVo;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PasswordEncode {

	@Test
	public void getTest2() {
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	System.out.println("===============1234의 암호화된 문자열"+ encoder.encode("1234"));
	System.out.println("===============1234의 암호화된 문자열"+ encoder.encode("1234"));
	System.out.println("===============1234의 암호화된 문자열"+ encoder.encode("1234"));
	System.out.println("===============1234의 암호화된 문자열"+ encoder.encode("1234"));
		
	
	}
}
