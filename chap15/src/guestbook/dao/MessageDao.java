package guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import guestbook.model.Message;
import jdbc.JdbcUtil;
// DAO: DATA ACCESS OBJECT
// 말 그대로 데이터베이스와 가장 가깝게 접촉하는 클래스

public class MessageDao {
	//singletonPattern
	public static MessageDao messageDao = new MessageDao();
	
	public static MessageDao getInstance() {
		return messageDao;
	}
	
	private MessageDao() {}
	
	//insert니까 return type 은 int가 되고 pstmt객체에 메세지의 정보를 담은 뒤 executeUpdate()을 해준다.
	public int insert(Connection conn, Message message) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into guestbook_message" +
					"(message_id, guest_name, password, message) " +
				    "values(MESSAGE_SEQ.nextval, ?, ?, ?)"
					);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//메세지 하나를 보여주는 기능
	public Message select(Connection conn, int messageId) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from guestbook_message where message_id = ?");
			pstmt.setInt(1, messageId);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	        	return makeMessageFromResultSet(rs);
	        }else {
	        	return null;
	        }
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	//select에서 받아온 메세지정보를 하나하나 빼주는 메서드.
	private Message makeMessageFromResultSet(ResultSet rs) throws SQLException{
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	}
	
	public int selectCount(Connection conn) throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(1) from guestbook_message");
			rs.next();
			return rs.getInt(1);	
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	//모든 메세지들을 볼수있는 기능
	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
			"select message_id, guest_name, password, message " +
	        "  from " +
			"     ( select ROWNUM AS SEQ, message_id, guest_name, password, message " +
			"         from (select message_id, guest_name, password, message " +
			"                 from guestbook_message order by message_id asc )) " +
			" where SEQ between ? and ?");
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
	        rs = pstmt.executeQuery();
	        
	        if(rs.next()) {
	        	List<Message> messageList = new ArrayList<Message>();
	        	do {
	        		messageList.add(makeMessageFromResultSet(rs));
	        	}while(rs.next());
	        	return messageList;
	        }else {
	        	return Collections.emptyList();
	        }
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
		
	//메세지 한개를 삭제하는 기능.
	public int delete(Connection conn, int messageId) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"delete from guestbook_message where message_id = ? " );
			pstmt.setInt(1, messageId);
	
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
}
