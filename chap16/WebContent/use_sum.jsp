<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>

<html>
<head>
<title>sum 사용</title>
</head>
<body>
	<tf:total begin="1" end="10">
		1~10까지의 합: ${totalresult}
	</tf:total>
</body>
</html>