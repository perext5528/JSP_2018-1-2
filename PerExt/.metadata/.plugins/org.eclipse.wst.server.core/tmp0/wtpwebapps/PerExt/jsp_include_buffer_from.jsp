<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head></head>
	<body>
		1.jsp_forward_buffer_from.jsp 문서의 1번째 내용입니다.<BR>
		2.jsp_forward_buffer_from.jsp 문서의 2번째 내용입니다.<BR>
		
		<jsp:include page="jsp_include_buffer_to.jsp" flush="false"/>
		
		5.jsp_forward_buffer_from.jsp 문서의 5번째 내용입니다.<BR>
		6.jsp_forward_buffer_from.jsp 문서의 6번째 내용입니다.<BR>		
	</body>
</html>