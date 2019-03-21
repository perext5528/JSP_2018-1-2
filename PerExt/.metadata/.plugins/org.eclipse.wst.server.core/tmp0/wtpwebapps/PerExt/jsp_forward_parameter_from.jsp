<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:forward page="jsp_forward_parameter_to.jsp">
	<jsp:param name="korea" value="SEOUL"/>
	<jsp:param name="japan" value="동경"/>
</jsp:forward>