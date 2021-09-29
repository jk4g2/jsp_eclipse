package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	//메세지를 작성하는 메소드...
	private static WriteMessageService instance = new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return instance;
	}
	
	private WriteMessageService() {}
	
	public void write(Message message) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			
			//보통은 message를 insert하기전에 not null변수를 미리 체크해준다.
			messageDao.insert(conn, message);
		}catch(SQLException e) {
			throw new ServiceException("메시지 등록 실패: " + e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
