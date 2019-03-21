<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	CooKie[] cookies = request.getCookies();
	if((cookies !=null)&&(cookies.length>0)){
		for(int i=0; i<cookies[i].length;i++){
			if(cookies[i].getName().equals("name")){
				Cookie mycookie2 = new Cookie("name", URLEncoder.encode("심청", "euc-kr"));
				response.addCookie(mycookie2);
			}
		}
	}

%>