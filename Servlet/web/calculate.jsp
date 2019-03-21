<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-11-12
  Time: 오후 2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<table width="400" height="100" align="center" border="1">
    <tr align="center">
        <td>
            <b>계산기</b>
            <hr>
            <form name="form1" action="CalcServlet" method="post">
                <input type="text" name="num1" width="200" size="5">
                <select name="operator">
                    <option selected>+</option>
                    <option>-</option>
                    <option>*</option>
                    <option>/</option>
                </select>
                <input type="text" name="num2" width="200" size="5">
                <input type="submit" value="계산" name="B1">
                <input type="reset" value="다시 입력" name="B2">
            </form>
        </td>
    </tr>
</table>
</body>
</html>
