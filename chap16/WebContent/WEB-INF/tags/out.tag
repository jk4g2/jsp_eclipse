<%@ tag body-content="tagdependent" language="java" pageEncoding="UTF-8"%>
<!-- body-content 자체를 EL이나 액션 태그를 처리하지 않고 몸체 내용 자체를 텍스트 값으로 사용하게 된다. -->
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:doBody var="bodyText"/><!-- bodyText변수 안에 몸체내용을 저장 -->
<c:out value="${bodyText}" escapeXml="true" />
