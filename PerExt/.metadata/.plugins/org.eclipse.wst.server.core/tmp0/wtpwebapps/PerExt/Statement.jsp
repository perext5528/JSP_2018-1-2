<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%
	Connection conn = null;
	Statement dbstmt = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcUrl="jdbc:mysql://localhost:3306/testdb";
		conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");
		dbstmt = conn.createStatement();
		String Query="UPDATE userinfo SET level=level+1 WHERE level=0";
		int rows=dbstmt.executeUpdate(Query);
		out.println(rows+"개의 레코드가 변경되었습니다.");
		
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		dbstmt.close();
		conn.close();
		
	}
%>