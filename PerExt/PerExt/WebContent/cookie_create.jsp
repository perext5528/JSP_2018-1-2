<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>    

<%
	Cookie mycookie1 = new Cookie("id", "hong");
	response.addCookie(mycookie1);
	
	Cookie mycookie2=new Cookie("name", URLEncoder.encode("홍길동", "euc=kr"));
	response.addCookie(mycookie2);
%>

mycookie1의 쿠키이름 : <%=mycookie1.getName()%><br>
mycookie1의 쿠키 값 : <%=mycookie1.getValue()%><br>
mycookie2의 쿠키이름 : <%=mycookie2.getName()%><br>
mycookie2의 쿠키 값 : <%=URLDecoder.decode(mycookie2.getValue(), "euc-kr") %>