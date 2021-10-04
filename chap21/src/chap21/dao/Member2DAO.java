package chap21.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.apache.catalina.connector.Request;

import chap21.model.Member2;
import jdbc.JdbcUtil;

public class Member2DAO {
	public static Member2DAO member2dao = new Member2DAO();
	
	public static Member2DAO getInstance() {
		return member2dao;
	}
	
	private Member2DAO() {}
	
	public void join(Connection conn, Member2 member) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
				    "insert into MEMBER2(MEMBERID, PASSWORD, NAME, EMAIL) "+
				    "values(?,?,?,?)"
					);
			pstmt.setString(1, member.getMemberID());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	public boolean idValidation(Connection conn, String id) throws SQLException{
		//id가 존재하지 않을떄
		if(this.selectById(conn, id)==null) {
			return false;
			//id가 존재할떄
		}else {
			return true;
		}
	}
	public String selectPWbyID(Connection conn, String id) throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from MEMBER2 where MEMBERID = '" +id + "'";
		try {
			stmt = conn.createStatement();
	        rs = stmt.executeQuery(sql);
	        if(rs.next()) {

	        	System.out.println("나와야할거" + rs.getString("password"));
	        	return rs.getString("password");
	        }else {
	        	return null;
	        }
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
	}
	
	
	public boolean loginValidation(Connection conn, String id,String pw) throws SQLException{
		//id가 존재할떄
		System.out.println("나와라 ㅅㅂ:");
		if(this.selectById(conn, id)!=null) {
			//id가 존재할떄 패스워드확인
			if(pw.equals(this.selectPWbyID(conn,id))) {
				
				System.out.println(this.selectPWbyID(conn,id));
				//패스워드 맞으면
				return true;
			}else {
				return false;
			}
		//아이디가 존재하지 않을경우
		}else {
			return false;
		}
	}
	
	public Member2 selectById(Connection conn,String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from MEMBER2 where MEMBERID = ?");
			pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	        	System.out.println("아이디 있는거");
	        	return getMember2FromResultSet(rs);
	        }else {
	        	System.out.println("아이디 없는거");
	        	return null;
	        }
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	
	private Member2 getMember2FromResultSet(ResultSet rs) throws SQLException{
		Member2 member = new Member2();
		member.setMemberID(rs.getString("memberid"));
		member.setPassword(rs.getString("password"));
		member.setName(rs.getString("name"));
		member.setEmail(rs.getString("email"));
		return member;
	}
}
