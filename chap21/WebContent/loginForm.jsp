<%@page import="chap21.model.Member2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<% 
	Member2 userID = null;
	if(session.getAttribute("id")!=null){
		userID = (Member2)session.getAttribute("id");
		response.sendRedirect("loginSucceed.jsp");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<form action="login.jsp" method="post" >
		아이디: <input type="text" name="id"/><br>
		패스워드: <input type="password" name="password"/><br>
		<input type="submit" value="로그인"/> 
	</form><br>
	<a href="joinForm.jsp">회원가입</a>
</body>
</html>
