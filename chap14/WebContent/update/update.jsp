<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>

 <%
 	request.setCharacterEncoding("UTF-8");
 
 	String memberID = request.getParameter("memberID");
 	String name = request.getParameter("name");
 	
 	int updateCount =0;
 	
 	//1. jdbc 드라이버 로딩
 	Class.forName("oracle.jdbc.driver.OracleDriver");
 	Connection conn = null;
 	Statement stmt = null;
 	
 	try{
 		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
 		String dbUser = "hr";
 		String dbPass = "hr";
 		
 		
 		String query = "update MEMBER2 set name = '" +name +"'" +
 						"where memberid = '" +memberID + "'";
 		//2. 커넥션생성
 		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
 		//3. statement생성
 		stmt = conn.createStatement();
 		//4. 쿼리 실행
 		updateCount = stmt.executeUpdate(query);
 		//5. 출력 
 	}finally{
 		if(stmt != null)try{stmt.close();}catch(SQLException ex){}
 		
 	}
 	System.out.println(updateCount);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 변경</title>
</head>
<body>
	<% if(updateCount > 0 ){ %>
	<%= memberID %>의 이름을 <%=name %>(으)로 변경
	
	<%}else{ %>
	<%=memberID %> 아이디가 존재하지 않음
	<%} %>
</body>
</html>