<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	float score = Float.parseFloat(request.getParameter("score"));
	
	out.println("번호는 "+num+"입니다.<BR>");
	out.println("이름은 "+name+"입니다.<BR>");
	out.println("점수는 "+score+"입니다.<BR>");
%>