<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
	String memberID = request.getParameter("memberID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	 		
	 		
	 		String query = "select * from MEMBER2 where MEMBERID = '" +memberID +"'";
	 		
	 		//2. 커넥션생성
	 		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	 		//3. statement생성
	 		stmt = conn.createStatement();
	 		//4. 쿼리 실행
	 		rs = stmt.executeQuery(query);
	 		//5. 출력 
	 		if(rs.next()){
	 %>
			 	<table border="1">
				 	<tr>
				 		<td>아이디</td>
				 		<td><%=memberID %></td>
				 	</tr>
				 	<tr>
				 		<td>암호</td>
				 		<td><%=rs.getString("PASSWORD") %></td>
				 	</tr>
				 	<tr>
				 		<td>이름</td>
				 		<td><%=rs.getString("NAME")%></td>
				 	</tr>
				 	<tr>
				 		<td>이메일</td>
				 		<td><%=rs.getString("EMAIL") %></td>
				 	</tr>
				 </table>
			<%
	 		}else{
			%>
				<%=memberID %>에 해당하는 정보가 존재하지 않습니다.
				<%
			}
	 	}catch(SQLException ex){%>
	 	에러 발생: <%=ex.getMessage()%>
	 	<%
	 	}finally{
	 		if(rs != null)try{rs.close();}catch(SQLException ex){}
	 		if(stmt != null)try{stmt.close();}catch(SQLException ex){}
	 		if(conn != null)try{conn.close();}catch(SQLException ex){}
	 	}
	 %>
	 	
</body>
</html>