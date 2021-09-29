<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>

<html>
<head>
<meta charset="UTF-8">
	<title>제목 출력</title>
</head>
<body>
	<tf:header title="텍스트 제목" level="2"/>
	<tf:header title="${'EL제목'}" level="3"/>
	<!-- EL 안에서는 String 값은 ' '로 표현한다  -->
	<tf:header title='<%="표현식제목" %>' />
	<!-- 스크립트 릿에서의 String은 "" 로 표현한다-->
</body>
</html>