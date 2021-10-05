<%@page import="chap21.model.Member2"%>
<%@page import="chap21.service.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	Member2 userID = null;
	if(session.getAttribute("id")!=null){
		userID = (Member2)session.getAttribute("id");
		response.sendRedirect("loginSucceed.jsp");
	}
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	LoginService loginService = LoginService.getInstance();
	if(!loginService.login(id,pw)){
		response.sendRedirect("loginForm.jsp");		
	}else{
		session.setAttribute("id",loginService.getMember2(id));
		response.sendRedirect("loginSucceed.jsp");
	}
%>