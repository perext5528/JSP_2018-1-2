<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	Boolean access_ok = false;
	if((cookies!=null)&&(cookies.length>0)){
		for(int i=0;i<cookies.length;i++){
			if((cookies[i].getName()).equals("member_ok")){
				access_ok = true;
			}
		}
	}
	if(access_ok){
		out.println("마이 페이지의 내용입니다.");
		out.println("<BR>");
		out.println("<A HREF=\"cookie_exam_logout.jsp\">로그아웃</A>");
	}else{
		out.println("로그인이 필요합니다.");
	}
%>