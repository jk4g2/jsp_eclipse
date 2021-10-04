<%@page import="chap21.model.Member2"%>
<% 
	Member2 userID = null;
	if(session.getAttribute("id")!=null){
		session.invalidate();
	}
	response.sendRedirect("loginForm.jsp");
	
%>