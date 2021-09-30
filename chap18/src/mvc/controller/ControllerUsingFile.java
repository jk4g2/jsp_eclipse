package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

public class ControllerUsingFile extends HttpServlet{
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	public void init() throws ServletException {
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);
		try(FileReader fis = new FileReader(configFilePath)){
			prop.load(fis);			
		}catch(IOException e) {
			throw new ServletException(e);
		}
		
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String handlerClassName = prop.getProperty(command);
			try {
				System.out.println(handlerClassName);
				Class<?> handlerClass = Class.forName(handlerClassName);
				System.out.println("check point");
				CommandHandler handlerInstance = (CommandHandler)handlerClass.newInstance();
				//<커맨드, 핸들러 인스턴스> 맵핑 정보 저장
				commandHandlerMap.put(command, handlerInstance);
			}catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				System.out.println();
				throw new ServletException(e);
			}
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		process(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		process(request,response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		
		String command = request.getParameter("cmd");
		CommandHandler handler = commandHandlerMap.get(command);
		if(handler == null) {
			handler = new NullHandler();
		}
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
		}catch(Exception e) {
			throw new ServletException(e);
		}
		if(viewPage!=null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}

	}
}
