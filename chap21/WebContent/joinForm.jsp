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
<title>회원가입 양식</title>
</head>
<body>
	<form action="join.jsp" method="post">
		아이디: <input type="text" name="memberID"/><br>
		비밀번호:<input type="password" name="password"/><br>
		이름:<input type="text" name="name"/><br>
		이메일:<input type="text" name="email"/><br>
		<input type="submit" value="회원가입하기"/><br>
	</form>
</body>
</html>