package chap21.service;

import java.sql.Connection;
import java.sql.SQLException;

import chap21.dao.Member2DAO;
import chap21.model.Member2;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class LoginService {
	private static LoginService instance = new LoginService();
	
	public static LoginService getInstance() {
		return instance;
	}
	
	public boolean login(String id, String pw) throws SQLException {
		Connection conn = null;
		conn = ConnectionProvider.getConnection();
		Member2DAO memberDAO = Member2DAO.getInstance();
		System.out.println("login: " + "나와라좀");
		if(memberDAO.loginValidation(conn,id,pw)) {
			System.out.println("log validated");
			conn.close();
			return true;
		}else {
			System.out.println("log not");
			conn.close();
			return false;
		}
	}
	public Member2 getMember2(String id) throws SQLException {
		Connection conn = null;
		conn = ConnectionProvider.getConnection();
		Member2DAO memberDAO = Member2DAO.getInstance();
		return memberDAO.selectById(conn, id);
	}
}
