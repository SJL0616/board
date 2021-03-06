package jmp.spring.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.fileupload.FileUpload;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jmp.spring.mapper.FileUploadMapper;
import jmp.spring.mapper.ManuMapper;
import jmp.spring.mapper.UserMapper;
import jmp.spring.service.AttachFileService;
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
public class mapTest {

	@Autowired
FileUploadMapper mapper;
	
	@Autowired
	AttachFileService amapper;
	
	@Autowired
	UserMapper umapper;

	
	
	
	@Autowired
	UserService uservice;
	
	@Autowired
	ManuMapper mmapper;
	
	
	@Autowired
	AttachFileServiceimpl service;
	
	@Test
	public void getALllist() {
	
	}
	
	
	public void finfId4() {
		UserVo user = new UserVo();
		
		user.setId("user01");
		user.setEmail("1@naver.com");
		
		uservice.findIdByNameEmail(user);
		
		
	}
	
	
	public void getMenu() {
	 uservice.createMenu();
	}

	public void getTest2() {
	
		UserVo user= new UserVo();
		user.setId("user06");
		user.setPwd("1234");
		user.setName("lee");
		user.setEmail("6@gamil.com");


		uservice.insertUser(user);
		uservice.insertUserRole("user06","ROLE_USER");
		
	
		
	
	}
	
	public void getTest() {
	System.out.println("===========uuid"+UUID.randomUUID().toString().substring(0, 7));
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encod = encoder.encode(UUID.randomUUID().toString().substring(0, 7));
	System.out.println("===========encod"+encod);
	}
	
	
public void maptest() {
		BoardVo bvo= new BoardVo();
		bvo.setBno(50);
		ReplyVo rvo= new ReplyVo();
		rvo.setRno(123);
		
		
		Map<String, Object> map = new HashMap<String ,Object>();
		map.put("boardVo", bvo);
		map.put("ReplyVo", rvo);
		log.info(map);
		log.info(map.get("boardVo"));
		log.info(map.get("ReplyVo"));
		
		
	}
}
