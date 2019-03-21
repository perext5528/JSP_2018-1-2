<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-11-19
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="jspbook.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ad" class="jspbook.AddrBean"/>
<jsp:useBean id="addrbook" class="jspbook.AddrBook"/>
<jsp:setProperty name="addrbook" property="*"/>

<%
    String action = request.getParameter("action");

    if (action.equals("list")) {
        ArrayList<AddrBook> datalist = ad.getDBList();
        request.setAttribute("dataset", datalist);
        pageContext.forward("addrbook_list.jsp");
    }

    if (action.equals("insert")) {
        if (ad.insertDB(addrbook)) {
            out.println("<script>alert(action)</script>");
            response.sendRedirect("addrbook_control.jsp?action=list");
        } else {
            throw new Exception("DB ERROR");
        }
    } else if (action.equals("edit")) {
        AddrBook abook = ad.getDB(addrbook.getId());
        if (!request.getParameter("upasswd").equals("1234")) {
            out.println("<script>alert('비밀번호가 틀렸습니다.');history.go(-1);</script>");
        } else {
            request.setAttribute("address", abook);
            pageContext.forward("addrbook_edit_form.jsp");
        }
    } else {
        out.println("<script>alert('action 파라미터를 확인해 주세요!!!)</script>");
    }

%>