package mvc.hello;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class HelloHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("checkpoint2");
		req.setAttribute("hello", "안녕하세요~~~~~~~~~!");
		System.out.println("checkpoint3");
		return "/WEB-INF/view/hello.jsp";
	}
}
