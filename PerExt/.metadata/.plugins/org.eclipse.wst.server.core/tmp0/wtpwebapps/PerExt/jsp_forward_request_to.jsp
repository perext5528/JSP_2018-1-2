<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("euc-kr");
String id=request.getParameter("id");
String pw=request.getParameter("pw");
out.println("아 이 디 : "+id+"<br>");
out.println("패스워드 : "+pw);
 %>