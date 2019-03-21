<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="myform" method=post action="getParameter_proc.jsp">
		번호(정수) : <input type=text name="num" size=10><br>
		이름(문자열) : <input type=text name="name" size=20><br>
		평점(실수) : <input type=text name="score" size=5><br>
		<input type=submit value="저장">
	</form>
</body>
</html>