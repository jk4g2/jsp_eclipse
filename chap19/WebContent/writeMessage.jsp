<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%
	request.setCharacterEncoding("utf-8");
	String param = request.getParameter("param");
%>

<html>
<head>
<title>방명록 메시지 남김</title>
</head>
<body>
방명록에 메시지를 남겼습니다.
</body>
<a href="list.jsp">[목록 보기]</a>
<%=param %>
</html>