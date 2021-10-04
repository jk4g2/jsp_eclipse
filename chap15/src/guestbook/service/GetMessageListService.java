package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class GetMessageListService {
	private static GetMessageListService instance = new GetMessageListService();
	
	public static GetMessageListService getInstance() {
		return instance;
	}
	
	private GetMessageListService() {}
	
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	//GetMessageListService에서 getMessageList() 메서드를 이용해서
	//list.jsp에서 이 메서드를 사용해서 MessageList를 빼온다.
	//여기에서는 data type을 주의해야한다.
	public MessageListView getMessageList(int pageNumber) {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			int messageTotalCount = messageDao.selectCount(conn);
			
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			if(messageTotalCount > 0) {
				firstRow =                                    //page   1  2  3    
					(pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;  // 1  4  7
				   //  2        - 1  *           3            + 1
				
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;     // 3  6  9
				messageList = messageDao.selectList(conn, firstRow, endRow);
			}else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			
			return new MessageListView(messageList,
					messageTotalCount, currentPageNumber,
					MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		
		}catch(SQLException e) {
			throw new ServiceException("목록 구하기 실패: " + e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
		
	}
}
