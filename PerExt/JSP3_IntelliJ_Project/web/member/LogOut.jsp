<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-11-05
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>

<%
    int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

    String m_column = request.getParameter("column");
    if (m_column == null) m_column = "";

    String m_encoded_key = null;
    String m_key = request.getParameter("key");
    if (m_key != null) {
        m_encoded_key = URLEncoder.encode(m_key, "euc-kr");
    } else {
        m_key = "";
    }

    session.invalidate();

    String retURL = "../board/BoardList.jsp?column=" + m_column + "&key=" + m_encoded_key + "&CurrentPage=" + m_cp;

    out.println("<script language=\"javascript\">");
    out.println("alert('로그아웃 되었습니다.')");
    out.println("location.replace('" + retURL + "')");
    out.println("</script>");
    out.flush();
%>


