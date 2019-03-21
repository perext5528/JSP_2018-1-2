<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
out.println("<h2>프로토콜과 URL 관련 정보</h2><hr>");
%>
1. 클라이언트 IP 주소 : <%=request.getRemoteAddr()%><br/>
2. 요청 메소드 : <%=request.getMethod()%><br/>
3. 프로토콜 : <%=request.getProtocol()%><br/>
4. 서버 호스트 이름 :<%=request.getServerName()%><br/> 
5. 서버 포트 : <%=request.getServerPort()%><br/>
6. 요청 URI : <%=request.getRequestURI()%><br/>
7. 요청 URL : <%=request.getRequestURL()%><br/>
8. 요청 URL 중 쿼리 스트링 : <%=request.getQueryString()%><br/>
9. 컨텍스트 패스 정보 : <%=request.getContextPath()%><br/>
