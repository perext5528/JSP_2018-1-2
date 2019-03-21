<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>

<title>Insert title here</title>
</head>
<body>
	가능한 외국어를 모두 선택하시오.<br>
	<form name="test" method=post action="getParameterValues_proc.jsp">
		<input type="checkbox" name="lang" value="e">영어
		<input type="checkbox" name="lang" value="j">일본어
		<input type="checkbox" name="lang" value="c">중국어
		<input type="checkbox" name="lang" value="g">독일어
		<br>
		<input type=submit value="확인">
	</form>
</body>
</html>