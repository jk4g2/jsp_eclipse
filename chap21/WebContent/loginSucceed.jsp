<%@page import="chap21.model.Member2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<%
		Member2 sessionData = (Member2)session.getAttribute("id");
	%>
	로그인 성공하셨습니다. <%=sessionData.getMemberID() %> 님!
	<br>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>