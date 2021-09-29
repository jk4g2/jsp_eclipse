<%@ tag body-content="scriptless" language="java" pageEncoding="UTF-8"%>
<%@ attribute name="length" type="java.lang.Integer" %>
<%@ attribute name="trail"%>
<%@ attribute name="trim"%>
<%@ attribute name="var" type="java.lang.String" rtexprvalue="false" required="true" %>
<!--rtexprvalue 속성값으로 표현식을 사용할 수 있는지 여부를 지정한다, 기본값은 true이다. -->
<%@ variable name-from-attribute="var" alias ="result" variable-class="java.lang.String" scope="AT_END" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:doBody var="content" scope="page"/>
<%
	String content =(String)jspContext.getAttribute("content");
	if(trim!=null && trim.equals("true")){
		content=content.trim();//좌우공백을 제거해 준다.
	}
	content = content.replaceAll(
			"<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>",""
			);//태그제거
	if(length!=null &&length.intValue()>0 && content.length() > length.intValue()){
		content = content.substring(0,length.intValue());
		if(trail!=null){
			content=content+trail;
		}
	}
%>
<c:set var="result" value="<%=content %>"/>