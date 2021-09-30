<%@ tag body-content="scriptless" language="java" pageEncoding="UTF-8"%>
<!-- default값은 scriptless -->
<%@ attribute name="length" type="java.lang.Integer" %>
<%@ attribute name="trail"%>
<%@ attribute name="trim"%>

<jsp:doBody var="content" scope="page"/>
<!-- doBody는 태그 안에 있는 몸체 바디내용을 가지고 온다 
	 그래서 변수 content를 String 변수 처럼 사용. -->
<%
	String content =(String)jspContext.getAttribute("content");
%>

<% 
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
<%= content %>
