<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-11-05
  Time: 오후 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>

<%request.setCharacterEncoding("EUC-KR"); %>

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

    String user_id = request.getParameter("UserId");
    String user_pass = request.getParameter("UserPass");

    String db_id = null;
    String db_pass = null;
    String db_name = null;

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
        String jdbcId = "perext";
        String jdbcPw = "joowan0935";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

        String Query1 = "SELECT UsrId, UsrPass, UsrName FROM member WHERE UsrId ='" + user_id + "'";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(Query1);

        if (rs.next()) {
            db_id = rs.getString(1);
            db_pass = rs.getString(2);
            db_name = rs.getString(3);
        } else {
            db_id = null;
            db_pass = null;
            db_name = null;
        }

        if ((user_id.equals(db_id)) && (user_pass.equals(db_pass))) {
            session.setAttribute("member_id", user_id);
            session.setAttribute("member_name", db_name);

            rs.close();
            stmt.close();
            conn.close();

            String retURL = "../board/BoardList.jsp?column=" + m_column + "&key=" + m_encoded_key + "&CurrentPage=" + m_cp;

            out.println("<script language=\"javascript\">");
            out.println("alert('환영합니다.')");
            out.println("location.replace('" + retURL + "')");
            out.println("</script>");
            out.flush();
        } else {
            rs.close();
            stmt.close();
            conn.close();

            out.println("<script language=\"javascript\">");
            out.println("alert('아이디나 패스워드가 다릅니다.')");
            out.println("history.back()");
            out.println("</script>");
            out.flush();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>