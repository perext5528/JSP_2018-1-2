<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-11-05
  Time: ¿ÀÀü 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="EUC-KR" language="java" %>

<%
    String code = request.getParameter("IdPw");

    String viewPageURI = null;

    if (code.equals("1")) {
        viewPageURI = "IdSearch.jsp";
    } else if (code.equals("2")) {
        viewPageURI = "PwSearch.jsp";
    }
%>

<jsp:forward page="<%=viewPageURI%>"/>