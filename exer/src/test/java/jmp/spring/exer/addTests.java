package jmp.spring.exer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jmp.spring.service.addContentsService;
import jmp.spring.vo.ContentsVo;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class addTests {

	@Autowired
	addContentsService service;
	
	@Test
	public void insert() {
		ContentsVo cvo = new ContentsVo();
		cvo.setCname("죠죠의기묘한모험");
		cvo.setStory("죠죠의모험");
		cvo.setCast("죠죠,스피드웨건");
		cvo.setTags("액션,활극");
		cvo.setBc("TBS");
		cvo.setAgelimit("15세이용가");
		cvo.setEnd("미완");
		
	service.addcontents(cvo);
		
		
		
	}
	
	
}
