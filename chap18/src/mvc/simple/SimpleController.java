package mvc.simple;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet{
	//1단계, 요청 받기
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		processRequest(request,response);
	}
	//1단계, 요청 받기
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		processRequest(request,response);
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
		//2단계, 요청 파악
		String type = request.getParameter("type");
		
		//3단계, 요청한 기능을 수행
		//사용자 요청에 알맞은 코드
		Object resultObject = null;
		if(type==null || type.equals("greeting")) {
			resultObject = "안녕하세요";
		}else if(type.equals("date")) {
			resultObject = new java.util.Date();
		}else {
			resultObject= "Invalid Type";
		}
		
		//4단계, request나 session에 처리 결과를 저장
		request.setAttribute("result", resultObject);
		
		//5단계, RequestDispatcher를 사용하여 알맞은 뷰로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/simpleView.jsp");
		dispatcher.forward(request, response);
	}
}
