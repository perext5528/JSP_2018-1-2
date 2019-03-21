<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try{
	int a=20, b=0, c=0;
	c=a/b;
}catch(Exception e){
	out.print(e.getMessage());
	//out.print(e.printStackTrace());
	//out.print(e.toString());
}
%>