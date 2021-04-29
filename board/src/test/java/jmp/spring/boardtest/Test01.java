package jmp.spring.boardtest;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jmp.spring.mapper.BoardMapper;
import jmp.spring.service.BoardService;
import jmp.spring.vo.BoardVo;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Test01 {
	
	@Autowired
	SqlSessionFactory factory;
	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardService service;
	
	
	
	public void update() { 
		//vo.set �� ���ؼ� ������ ���� �Է��ϴ� insert ���� �׽�Ʈ
		BoardVo vo = new BoardVo();
		vo.setBno(3);
		vo.setTitle("����");
		vo.setContent("����");
		vo.setWriter("������");
	 log.info("service updateBoard:"+service.updateBoard(vo));	
	}
	
	
	

}
