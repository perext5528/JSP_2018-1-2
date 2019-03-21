<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String)session.getAttribute("member_id");
	if(member_id!=null){
		session.invalidate();
		
		out.println("세션이 존재해 정상적으로 출력됩니다.");
		out.println("<BR>");
		out.println("<A.href=\"session_exam_logout.jsp\">로그아웃</A>");
	}else{		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('로그인이 필요합니다.');");
		out.println("location.href=\"session_exam_login_form.jsp\"");
		out.println("</script>");
	}
%>