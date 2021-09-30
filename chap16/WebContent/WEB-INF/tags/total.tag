<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="begin" required="true" type="java.lang.Integer"%>
<%@ attribute name="end" required="true" type="java.lang.Integer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ variable name-given="totalresult" variable-class="java.lang.Integer" scope="NESTED" %>
<!-- 지역변수 sum -->

<c:set var="totalresult" value="${0}" /> <!-- total 태그 안에 있는 변수 sum 초기화... -->

<c:forEach var="num" begin="${begin}" end="${end}">
	<c:set var="totalresult" value="${totalresult+num}"/>
</c:forEach>

<jsp:doBody/>
