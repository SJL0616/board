package jmp.spring.board;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

import jmp.spring.mapper.BoardMapper;
import jmp.spring.mapper.ReplyMapper;
import jmp.spring.service.BoardService;
import jmp.spring.service.ReplyService;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class hikariTest {
	@Autowired
	SqlSessionFactory factory;
	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	ReplyMapper rmapper;
	
	@Autowired
	BoardService service;
	
	@Autowired
	ReplyService rservice;
	
	
	public void reply3() {
		
		ReplyVo vo = new ReplyVo();
		vo.setBno(2);
	
		
		rservice.get(2);
		
	}
	@Test
	public void mapperInsertTest() {
		ReplyVo vo = new ReplyVo();
		vo.setBno(49);
		vo.setReply("ㅇㅇ	");
		vo.setReplyer("ㅇㅇ");
		
		int res = rservice.insert(vo);
		/*
		 * rmapper.updateReplyCnt(vo.getBno());
		 */	
	}
	@Autowired
	HikariDataSource dataSource;
	
	long start = System.currentTimeMillis();
	
	public void hikari() {
	try {
		
	Connection con = dataSource.getConnection();
	
	System.out.println(con);
	}catch(Exception e) {
		e.printStackTrace();
	}
	long end = System.currentTimeMillis();
	System.out.println((end-start)/1000.0 +"珥�");
	}
}
