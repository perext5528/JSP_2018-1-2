<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcUrl="jdbc:mysql://localhost:3306/testdb";
		conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");
		
		String Query="SELECT * FROM userinfo";
		pstmt = conn.prepareStatement(Query);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			String my_name=rs.getString(1);
			String my_id=rs.getString("id");
			String my_email = rs.getString("email");
			String my_part = rs.getString("part");
			int my_count = rs.getInt("count");
			int my_level = rs.getInt("level");
			
			out.println(my_name+" "+my_id +" "+my_email+" "+my_part+" "+my_count+" "+my_level);
			out.println("<BR>");
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
		
	}
%>