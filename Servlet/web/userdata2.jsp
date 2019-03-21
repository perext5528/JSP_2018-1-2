<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-11-12
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<% String city = URLEncoder.encode("서울", "UTF-8");%>
<form action="userData2?age=20&city=<%=city%>" method="post">
    <table width="300" align="center" border="1" cellspacing="0" cellpadding="5">
        <tr>
            <td width="100">아이디</td>
            <td width="200"><input type="text" name="uid" size="20"></td>

        </tr>
        <tr>
            <td width="100">패스워드</td>
            <td width="200"><input type="password" name="upw" size="20"></td>
        </tr>
    </table>
    <table width="300" align="center" border="0">
        <td align="center"><input type="submit" value="login"></td>
    </table>
</form>

</body>
</html>
