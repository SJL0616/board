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
public class OdbcTest {
	@Autowired
	SqlSessionFactory factory;
	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardService service;
	
	
	@Test
	public void update() { 
		//vo.set 을 통해서 변수를 직접 입력하는 insert 쿼리 테스트
		BoardVo vo = new BoardVo();
		vo.setBno(3);
		vo.setTitle("수정");
		vo.setContent("수정");
		vo.setWriter("수정자");
	 log.info("service updateBoard:"+service.updateBoard(vo));	
	}
	
	
	public void Insert() { 
		//vo.set 을 통해서 변수를 직접 입력하는 insert 쿼리 테스트
		BoardVo vo = new BoardVo();
		vo.setTitle("타이틀2");
		vo.setContent("내용2");
		vo.setWriter("작성2");
	 mapper.insertBoard(vo);	
	}

	

	public void service() {
		System.out.println(service.selectALLBoard());
	}
	
	
	
	@Test
	public void getList() {
		log.info(mapper.selectALLBoard());
	}
	/*
	 * @Test public void selectall() { mapper.selectAll(); }
	 */
	
	public void selectPerson() {
		mapper.selectPerson(1);
	}
	
	@Test
	public void mapperTest2() {
		
		log.info("==============="+mapper.getTime2());
		
	}
	
	@Test
	public void mapperTest() {
		
		log.info("==============="+mapper.getTime());
		
	}
	
	@Test
	public void mybatisTest() {
		long start= System.currentTimeMillis();
		SqlSession session = factory.openSession();
		System.out.println(session.getConnection());
		System.out.println("留덉씠諛뷀떚�뒪");
		long end = System.currentTimeMillis();
		System.out.println((end-start)/1000.0 +"珥�");
	}
	
	@Autowired
	HikariDataSource dataSource;
	
	@Test
	public void HikariTest() {
		
		long start= System.currentTimeMillis();
		
		try {
			Connection conn= dataSource.getConnection();
			System.out.println("�엳移대━ �꽦怨�");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		System.out.println((end-start)/1000.0 +"珥�");
		
	}
	
	
	@Test
	public void TestConnection() {
		Connection con= null;
		long start= System.currentTimeMillis();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jweb","4321");
			System.out.println(con);
			System.out.println("�뿰寃곗꽦怨�");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	long end = System.currentTimeMillis();
		System.out.println((end-start)/1000.0 +"珥�");
		
	}
	
}
