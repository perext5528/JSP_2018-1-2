<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>    

<%
	Cookie mycookie1 = new Cookie("id", "hong");
	response.addCookie(mycookie1);
	
	Cookie mycookie2=new Cookie("name", URLEncoder.encode("ȫ�浿", "euc=kr"));
	response.addCookie(mycookie2);
%>

mycookie1�� ��Ű�̸� : <%=mycookie1.getName()%><br>
mycookie1�� ��Ű �� : <%=mycookie1.getValue()%><br>
mycookie2�� ��Ű�̸� : <%=mycookie2.getName()%><br>
mycookie2�� ��Ű �� : <%=URLDecoder.decode(mycookie2.getValue(), "euc-kr") %>