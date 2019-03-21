<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-12-09
  Time: 오후 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="student" class="Beans.Student" scope="request"/>
<jsp:setProperty name="student" property="userName"/>
<jsp:setProperty name="student" property="userNo"/>

<html>
<head>
    <title>Title</title>
</head>
<body>

<table align="center" width="300" height="40" cellpadding="5" cellspacing="0" border="1">
    <tr>
        <td width="100" height="20" align="center">학과</td>
        <td width="100" height="20"></td>
    </tr>

    <tr>
        <td width="100" height="20" align="center">이름</td>
        <td width="100" height="20"><jsp:getProperty name="student" property="userName"/></td>
    </tr>
    <tr>
        <td width="100" height="20" align="center">학번</td>
        <td width="100" height="20"><jsp:getProperty name="student" property="userNo"/></td>
    </tr>

</table>
<table align="center" width="300" height="10" border="0">
    <tr>
        <td align="center"><input type="submit" value="save"></td>
    </tr>

</table>

</body>
</html>
