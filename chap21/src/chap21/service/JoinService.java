package chap21.service;

import java.sql.Connection;
import java.sql.SQLException;

import chap21.dao.Member2DAO;
import chap21.model.Member2;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class JoinService {
	private static JoinService instance = new JoinService();
	
	public static JoinService getInstance() {
		return instance;
	}
	private JoinService() {}
	
	public boolean join(Member2 member) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			Member2DAO memberDAO = Member2DAO.getInstance();
			if(!memberDAO.idValidation(conn, member.getMemberID())) {
				
				//아이디가 존재하지 않을경우.
				memberDAO.join(conn, member);	
				return true;
			}else {
				return false;
			}
		}catch(SQLException e) {
			throw new ServiceException("회원가입 실패 " + e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
