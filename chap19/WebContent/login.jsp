<%@ page contentType="text/html; charset=utf-8" %>
<%
	String memberId = request.getParameter("memberId");
	session.setAttribute("MEMBER",memberId);
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	로그인처리<br>
	로그인아이디 <%=memberId %>
</body>
</html>