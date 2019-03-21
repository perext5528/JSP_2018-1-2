<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("euc-kr"); %>

<%
    String id = request.getParameter("UserId");
    String name = request.getParameter("UserName");
    String jumin1 = request.getParameter("UserJumin1");
    String jumin2 = request.getParameter("UserJumin2");

    String user_pass = null;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
        String jdbcId = "perext";
        String jdbcPw = "joowan0935";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

        String Query1 = "SELECT UsrPass FROM member WHERE UsrId = '" + id + "'AND UsrName ='" + name + "'AND UsrJumin1 ='" + jumin1 + "'AND UsrJumin2 = '" + jumin2 +
                "'";

        stmt = conn.createStatement();
        rs = stmt.executeQuery(Query1);

        if (rs.next()) {
            user_pass = new String(rs.getString(1));
            String sub_pass = user_pass.substring(0, 3);    //PW 자리수
            int aster_length = user_pass.length() - 4;

            String asterisk="";
            for(int i=0;i<aster_length;i++){
                asterisk = asterisk + "*";
            }
            user_pass = sub_pass+asterisk;
        } else {
            user_pass = null;
        }
%>

<HTML>
<HEAD>
    <META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
    <LINK REL="stylesheet" type="text/css" href="../include/style.css">
    <TITLE>패스워드 찾기</TITLE>
</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

    <TR BGCOLOR=#A0A0A0>
        <TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>패스워드 찾기</B></FONT></TD>
    </TR>

    <TR>
        <TD ALIGN=CENTER>
            <BR>
<%
    if (user_pass == null) {
        out.println("일치하는 패스워드가 없습니다.<BR>");
        out.println("회원가입이 되어있는지 확인하세요.");
    } else {
        out.println("<B>" + name + "</B>님 안녕하세요.<BR>");
        out.println("<B>" + name + "</B>님의 패스워드는 <B>" + user_pass + "</B>입니다.");
    }
%>
        </TD>
    </TR>

    <TR>
        <TD HEIGHT=50 ALIGN=CENTER>
            <IMG SRC="../images/btn_id_confirm.gif" STYLE=CURSOR:HAND onclick="javascript:self.close();">
        </TD>
    </TR>

</TABLE>

</BODY>
</HTML>

<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        rs.close();
        stmt.close();
        conn.close();
    }
%>