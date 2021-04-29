package jmp.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;



public class Test {

	
	 @org.junit.Test 
	public void estConnection() {
		

Connection con = null;

// 시간을 찍기위한 변수
	long start = System.currentTimeMillis(); 

// 클래스 로드
	
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe", "jweb","4321");
	System.out.println(con);
	con.close();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		/* Log.info(con); */
	//bad code

	}
	
	
}
