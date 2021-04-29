package jmp.spring.board;

import java.sql.Connection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class hikariTest {
	@Autowired
	HikariDataSource dataSource;
	
	long start = System.currentTimeMillis();
	@Test
	public void hikari() {
	try {
		
	Connection con = dataSource.getConnection();
	
	System.out.println(con);
	}catch(Exception e) {
		e.printStackTrace();
	}
	long end = System.currentTimeMillis();
	System.out.println((end-start)/1000.0 +"초");
	}
}
