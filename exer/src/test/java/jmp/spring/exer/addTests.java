package jmp.spring.exer;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jmp.spring.mapper.FileUploadMapper;
import jmp.spring.service.addContentsService;
import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class addTests {

	@Autowired
	addContentsService service;
	@Autowired
	FileUploadMapper umapper;
	
	
	@Test
	public void getVideo() {
		service.getAllVideo(20);
		
	}
	@Test
	public void getCastByname() {
		umapper.getcastByName("�⹫");
		
	}
	
	/*
	 * public void addcast(){ CastVo castvo= new CastVo(); castvo.setCastno(1);
	 * castvo.setCast("����"); service.addcast_match(2, castvo.getCast(),
	 * castvo.getCastno()); }
	 */
	
	
	public void get() {
		List<ContentVo> avo=service.getAllList();
		log.info("=================="+avo);
		
	}
	
	
	public void insert() {
		ContentsVo cvo = new ContentsVo();
		cvo.setCname("�����Ǳ⹦�Ѹ���");
		cvo.setStory("�����Ǹ���");
		cvo.setCast("����,���ǵ����");
		cvo.setTags("�׼�,Ȱ��");
		cvo.setBc("TBS");
		cvo.setAgelimit("15���̿밡");
		cvo.setEnd("�̿�");
		
	service.addcontents(cvo);
		
		
		
	}
	
	
}
