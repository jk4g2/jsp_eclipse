<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- id와 name을 넣었을땐 null값이 처리가 되어서 아무것도 뜨지 않지만 
		 member는 필터처리를 시키지 않아서 null값이 뜨게된다.-->
  	ID 파라미터: <%= request.getParameter("id") %><br>
  	name 파라미터: <%= request.getParameter("name") %><br>
  	member 파라미터: <%= request.getParameter("member") %><br>
</body>
</html>