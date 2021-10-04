<%@page import="chap21.service.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
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