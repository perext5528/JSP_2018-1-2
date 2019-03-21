<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setMaxInactiveInterval(20);
	session.setAttribute("id", "hong");
	session.setAttribute("name", "홍길동");
%>