<%@page import="chap21.model.Member2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<%
		Member2 sessionData = (Member2)session.getAttribute("id");
	%>
	로그인 성공하셨습니다. <%=sessionData.getMemberID() %>
</body>
</html>