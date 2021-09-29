<%@ tag body-content="empty" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag dynamic-attributes="optionMap" %>
<%@ attribute name="name" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<select name ="${name}"> <!-- code, genre를 가져오게되고. -->
	<c:forEach items="${optionMap}" var="option">
		<!-- optionMap은  rock="락" rgb="RGB모드" wb="흑백모드" 를 받게된다 -->
		<!-- option은 key=value (한개). 그래서 하나 하나 싹다 가져온다--> 
		<!-- rock 이 ${option.key} 가되고 ${option.value} 가 "락"이됨 -->
		<option value="${option.key}">${option.value}</option>
	</c:forEach>
</select>