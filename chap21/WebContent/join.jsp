<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="chap21.model.Member2" %>
<%@ page import ="chap21.service.JoinService" %>

<%
	String id = request.getParameter("memberID");
	String pw= request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	Member2 member = new Member2();
	member.setMemberID(id);
	member.setPassword(pw);
	member.setName(name);
	member.setEmail(email);
	JoinService joinservice = JoinService.getInstance();
	joinservice.join(member);
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>
	회원가입 성공하셨어요!
	<a href="/login.jsp">로그인 하러가기~</a>
</body>
</html>