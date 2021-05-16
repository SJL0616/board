package jmp.spring.board;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.fileupload.FileUpload;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jmp.spring.mapper.FileUploadMapper;

import jmp.spring.service.AttachFileServiceimpl;
import jmp.spring.service.MailService;
import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.BoardVo;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mailServiceTest {


	
	 @Autowired MailService ms;
	 
	
	
	@Test
	public void Test() {
		
		
		/* MailService ms = new MailService(); */
		
		log.info("角青");
		ms.welcomeMailSend("22");
		  log.info("角青 己傍");
		 
		
	}
	
	@Autowired
FileUploadMapper mapper;
	
	@Autowired
	AttachFileServiceimpl service;
	
	
	public void getTest() {
		AttachFileVo vo = new AttachFileVo(5, "1111", "颇老");
		service.get("41850b5c-8cd7-415d-bf21-e8edb07e3521",  5);
		
	
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
