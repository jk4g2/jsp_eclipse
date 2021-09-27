package chap14;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Pretest {
	public static void main(String[] args) {
		//드라이버 검색
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 검색 성공");
		}catch(ClassNotFoundException e) {
			System.err.println("드라이버 검색 실패");
			System.exit(0);
		}
		
		//드라이버 연결
		Connection conn = null;//컨트롤 시프트 F5
		try{
			conn = DriverManager.getConnection(
								"jdbc:oracle:thin:@localhost:1521:XE",
								"hr", "hr"
								);
			System.out.println("데이터베이스 연결 성공");
		}catch(SQLException e) {
			System.err.println("데이터베이스 연결 실패");
			System.exit(0);
		}
		
		try {
			if(conn!=null) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
