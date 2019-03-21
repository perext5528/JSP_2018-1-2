<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-11-19
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="login1" class="Beans.beanLogin1" scope="request"/>
<jsp:setProperty name="login1" property="*"/>
<html>
<head>
    <meta charset="UTF-8">

</head>
<body>
<div align="center">

    <%
        if (login1.CheckUser()) {
            out.println("로그인 성공");
        }else{
            out.println("로그인 실패");
        }
    %>
    <hr>
    사용자 아이디 : <jsp:getProperty name="login1" property="userId"/><br>
    사용자 패스워드 : <jsp:getProperty name="login1" property="userPw"/>
</div>

</body>
</html>
