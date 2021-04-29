package jmp.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.internal.runners.JUnit4ClassRunner;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

import jmp.spring.mapper.BoardMapper;
import jmp.spring.service.BoardService;
import jmp.spring.vo.BoardVo;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OdbcTest2 {
	

	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardService service;
	
    @Test
	public void getone() {
		BoardVo vo =new BoardVo();

		service.get(5);
		
	}
	

	public void update() { 
		//vo.set 을 통해서 변수를 직접 입력하는 insert 쿼리 테스트
		BoardVo vo = new BoardVo();
		vo.setBno(3);
		vo.setTitle("수정");
		vo.setContent("수정");
		vo.setWriter("수정자");
		int res= mapper.updateBoard(vo);
	 log.info("service updateBoard:"+res+"번 업데이트 되었습니다.");	
	}
	

	public void Insert2() { 
		//vo.set 을 통해서 변수를 직접 입력하는 insert 쿼리 테스트
		BoardVo vo = new BoardVo();
		vo.setTitle("타이틀5");
		vo.setContent("내용5");
		vo.setWriter("작성5");
	 log.info("service insertBoard:"+service.insertBoard(vo));	
	}

	
	
	
	public void Insert() { 
		//vo.set 을 통해서 변수를 직접 입력하는 insert 쿼리 테스트
		BoardVo vo = new BoardVo();
		vo.setTitle("타이틀3");
		vo.setContent("내용3");
		vo.setWriter("작성3");
	 mapper.insertBoard(vo);	
	}


	

	public void service() {
		System.out.println(service.selectALLBoard());
	}
	
	/*
	 * @Test public void getList() { System.out.println(mapper.selectALLBoard()); }
	 */
}
