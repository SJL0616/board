package jmp.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;
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
import jmp.spring.mapper.ReplyMapper;
import jmp.spring.service.BoardService;
import jmp.spring.service.ReplyService;
import jmp.spring.vo.BoardVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.PageNavi;
import jmp.spring.vo.PageNavi2;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OdbcTest3 {
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
		vo.setReply("222");
		vo.setReplyer("22");
		
		/* int res = rservice.insert(vo); */
		rmapper.updateReplyCnt(vo.getBno());
		
	}
	
	public void re() {
		ReplyVo vo = new ReplyVo();
		vo.setBno(47);
		vo.setReply("네");
		vo.setReplyer("네");
	
		
		 rservice.insert(vo); 
		 rmapper.updateReplyCnt(vo.getBno()); 
	}
	

	public void reply6() {
		
		
		ReplyVo vo = new ReplyVo();
		vo.setBno(47);
		vo.setReply("네");
		vo.setReplyer("네");
	
		
		/* rservice.insert(vo); */
		rmapper.updateReplyCnt(vo.getBno());
		
	}
	
	public void reply2() {
	
		Criteria cri= new Criteria(2,10);

	
		
		ReplyVo vo = new ReplyVo();
		vo.setBno(50);
	
	rmapper.getList(50, cri);
		
	
		
	}
	
	public void reply5() {
	
		ReplyVo vo = new ReplyVo();
		vo.setBno(4);
		vo.setReply("떼클");
		vo.setReplyer("에녕");
		
		
		rservice.insert(vo);
		
	}
	


	public void reply1() {
	
		ReplyVo vo = new ReplyVo();
		vo.setRno(1);
		vo.setReply("땟끌");
		vo.setReplyer("녜뇽");
		
		
		rservice.update(vo);
		
	}
	
	
	public void on() {
		log.info("==========="+service.selectOneBoard(50));
	}
	
	public void search() {
		Criteria cri = new Criteria();
		cri.setKeyword("1등");
		cri.setType("writer");
		cri.setPageNum(2);
		log.info(mapper.search(cri));
		
		PageNavi navi = new PageNavi(cri, mapper.getTotal2(cri));
		
		log.info(mapper.getListWithPaging2(cri));
		log.info("-=============="+navi);
	
		
		/*
		 * log.info("================"+mapper.search(cri));
		 * 
		 * log.info("================"+navi);
		 */
		
	}
	
	
    public void getNavi2() {
    	Criteria cri = new Criteria();
    	cri.setPageNum(100);
    	cri.setAmount(10);
    	
    	PageNavi2 navi2 = new PageNavi2(cri, service.getTotal());
       	log.info("================"+navi2.getEndPage()+"");
    	log.info("================"+navi2.getStartPage()+"");
    	log.info("================"+navi2);
    }
    

	public void getNavi() {
    	
    	Criteria cri = new Criteria();
    	cri.setAmount(10);
    	cri.setPageNum(400);
    	int total = service.getTotal();
    	
    	PageNavi navi = new PageNavi(cri, total);
    	
    	log.info("================"+navi.getEndPage()+"");
    	log.info("================"+navi.getStartPage()+"");
    	log.info("================"+navi);
   
		
	}
	
	public void gettotal() {
		
		mapper.getTotal();
		
	}
	
	
	public void paging() {
		Criteria cri = new Criteria();
		
		cri.setAmount(10);
		cri.setPageNum(2);
		
		
	mapper.getListWithPaging(cri);
	}
	
	

	public void RowNum() {
	mapper.RowNum();
	}
	
	
	
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
	
	
	

	public void getList() {
		log.info(mapper.selectALLBoard());
	}
	/*
	 * @Test public void selectall() { mapper.selectAll(); }
	 */
	
	public void selectPerson() {
		mapper.selectPerson(1);
	}
	

	public void mapperTest2() {
		
		log.info("==============="+mapper.getTime2());
		
	}
	

	public void mapperTest() {
		
		log.info("==============="+mapper.getTime());
		
	}
	

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
