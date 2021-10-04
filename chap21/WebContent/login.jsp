<%@page import="chap21.service.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	LoginService loginService = LoginService.getInstance();
	System.out.println(id);
	System.out.println(pw);
	if(!loginService.login(id,pw)){
		System.out.println("WrongPW");
		%>
		<script>
		alert("비밀번호를 다시 확인 해주세요!");
		</script>
		
	<%
		
		response.sendRedirect("loginForm.jsp");		
	}else{
		session.setAttribute("id",loginService.getMember2(id));
		System.out.println("Correct id and password");
		response.sendRedirect("loginSucceed.jsp");
	}
%>