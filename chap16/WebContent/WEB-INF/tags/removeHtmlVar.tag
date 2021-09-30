<%@ tag body-content="scriptless" language="java" pageEncoding="UTF-8"%>
<%@ attribute name="length" type="java.lang.Integer" %>
<%@ attribute name="trail"%>
<%@ attribute name="trim" %>

<%@ attribute name="vari" type="java.lang.String" rtexprvalue="false" required="true"%>
<%@ attribute name="var" type="java.lang.String" rtexprvalue="false" required="true" %>
<!--rtexprvalue 속성값으로 표현식을 사용할 수 있는지 여부를 지정한다, 기본값은 true이다. -->
	 <!--var 속성을 사용하는것..-->

<%@ variable name-from-attribute="vari" alias ="variresult" variable-class="java.lang.String" scope="AT_END" %>
<%@ variable name-from-attribute="var" alias ="result" variable-class="java.lang.String" scope="AT_END" %>
<!-- jsp에서 던져준 var="removed"를   result라는 변수 이름으로 쓰겠다는 의미.
	.jsp 파일에서 쓸땐 removed를 사용해야함
	 함수라고 생각하면됨  .tag파일을 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:doBody var="content" scope="page"/>
<%
	String content =(String)jspContext.getAttribute("content");
	if(trim!=null && trim.equals("true")){
		content=content.trim();//좌우공백을 제거해 준다.
	}
	content = content.replaceAll(
				"<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>",""
			); //태그제거
	if(length!=null && length.intValue()>0 && content.length() > length.intValue()){
		content = content.substring(0,length.intValue());
		if(trail!=null){
			content=content+trail;
		}
	}
%>

<!-- result 변수를 content를 넣어준다
	 result = content -->
<c:set var="result" value="<%=content %>"/>
<c:set var="variresult" value="hello"/>