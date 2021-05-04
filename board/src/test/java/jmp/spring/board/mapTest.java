package jmp.spring.board;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.fileupload.FileUpload;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jmp.spring.mapper.FileUploadMapper;

import jmp.spring.service.AttachFileServiceimpl;
import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.BoardVo;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mapTest {

	@Autowired
FileUploadMapper mapper;
	
	@Autowired
	AttachFileServiceimpl service;
	
	@Test
	public void getTest() {
	
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
