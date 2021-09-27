<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	 MEMBER2 테이블의 내용
	 <table width="100%" border="1">
	 	<tr>
	 		<td>이름</td>
	 		<td>아이디</td>
	 		<td>이메일</td>
	 	</tr>
	 <%
	 	//1. jdbc 드라이버 로딩
	 	Class.forName("oracle.jdbc.driver.OracleDriver");
	 	Connection conn = null;
	 	Statement stmt = null;
	 	ResultSet rs = null;
	 	
	 	try{
	 		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
	 		String dbUser = "hr";
	 		String dbPass = "hr";
	 		
	 		
	 		String query = "select * from MEMBER2 order by MEMBERID";
	 		//2. 커넥션생성
	 		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	 		//3. statement생성
	 		stmt = conn.createStatement();
	 		//4. 쿼리 실행
	 		rs = stmt.executeQuery(query);
	 		//5. 출력 
	 		while(rs.next()){
	 			

	 %>
	 	<tr>
	 		<td><%=rs.getString("NAME") %></td>
	 		<td><%=rs.getString("MEMBERID") %></td>
	 		<td><%=rs.getString("EMAIL") %></td>
	 	</tr>
	 		<%}
	 	}catch(SQLException ex){
	 		out.println(ex.getMessage());
	 		ex.printStackTrace();
	 	}finally{
	 		if(rs != null)try{rs.close();}catch(SQLException ex){}
	 	}
	 	%>
	 </table>
</body>
</html>