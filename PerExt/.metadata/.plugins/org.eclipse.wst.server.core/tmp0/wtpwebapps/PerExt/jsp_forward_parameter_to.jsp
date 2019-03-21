<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String param1 = request.getParameter("korea");
	String param2 = request.getParameter("japan");
	out.println("korea : "+param1+"<br>");
	out.println("japan : "+param2+"<br>");
%>