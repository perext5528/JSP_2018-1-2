<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("euc-kr");
	String db_id="korea";
	String db_pw="koreapass";
	String user_id = request.getParameter("userid");
	String user_pw = request.getParameter("userpw");
	if((db_id.equals(user_id))&&(db_pw.equals(user_pw))){
		session.setAttribute("member_id", user_id);
		
		out.println("<B>"+user_id+"</B>님의 방문을 환영합니다.<hr>");
		out.println("<A HREF=\"cookei_exam_mypage.jsp\">마이페이지</A>");
		out.println("<br>");
		out.println("<A HREF=\"cookie_exam_logout.jsp\">로그아웃</A>");
		
	}else{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('아이디나 패스워드가 다릅니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
	
%>