<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcUrl = "jdbc:mysql://localhost:3306/testdb";
		String jdbcId = "jspuser";
		String jdbcPw = "jsppass";
		
		conn = DriverManager.getConnection(jdbcUrl,jdbcId, jdbcPw);
		out.println("DB 접속 성공");
		
	}catch(SQLException e){
		out.println("DB 접속 실패");
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>