package guestbook.service;

import java.util.List;
import guestbook.model.Message;

public class MessageListView {
//요청한 페이지 번호, 요청한 페이지의 메시지 목록, 전체 메시지 개수, 페이지당 보여줄 메세지의 갯수 등의 정보를 담은 클래스
	private int messageTotalCount;
	private int currentPageNumber;
	private List<Message> messageList;
	private int pageTotalCount;
	private int messageCountPerPage;
	private int firstRow;
	private int endRow;
	
	public MessageListView(List<Message> messageList, int messageTotalCount,
		int currentPageNumber, int messageCountPerPage, 
		int startRow, int endRow) {
		
		this.messageList = messageList;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;
		
		calculatePageTotalCount();
	}
	
	private void calculatePageTotalCount() {
		if(messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = messageTotalCount / messageCountPerPage;  //10  / 3   = 3
			
			if(messageTotalCount % messageCountPerPage > 0) {
				pageTotalCount++; //3++  ->  4
			}
		}
	}
	
	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	public boolean isEmpty() {
		return messageTotalCount == 0;
	}
	
}


