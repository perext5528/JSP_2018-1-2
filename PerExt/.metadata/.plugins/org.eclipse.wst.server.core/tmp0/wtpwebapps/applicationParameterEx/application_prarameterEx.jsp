<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%
	Enumeration<String> InitParm = application.getInitParameterNames();
	while(InitParm.hasMoreElements()){
		String ParamName = (String)InitParm.nextElement();
		out.println(ParamName + " : " + application.getInitParameter(ParamName)+"<BR>");
	}
%>