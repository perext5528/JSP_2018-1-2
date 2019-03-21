<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
String[] test = request.getParameterValues("lang");
String str="";

//값 추출
for(int i=0;i<test.length; i++){
if(test[i].equals("e")){str=str.concat("영어 ");continue;}
if(test[i].equals("j")){str=str.concat("일본어 ");continue;}
if(test[i].equals("c")){str=str.concat("중국어 ");continue;}
if(test[i].equals("g")){str=str.concat("독일어 ");continue;}
}

//출력
out.println("당신이 가능한 외국어는 "+str+"입니다.");
%>