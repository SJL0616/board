package test;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class OdbcTest {

	
	public void TestConnection() {
		Connection con= null;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jweb","4321");
			System.out.println("연결 성공");
			con.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
	}
	
}
