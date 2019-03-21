<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%
	CooKie[] cookies = request.getCookies();
	if((cookies !=null)&&(cookies.length>0)){
		for(int i=0; i<cookies[i].length;i++){
			out.println(cookies[i].getName() + " : " );
			out.println(URLDecoder.decode(cookies[i].getValue(), "euc-kr")+"<br>");
		}
	}else{
		out.println("No Cookies!");
	}

%>