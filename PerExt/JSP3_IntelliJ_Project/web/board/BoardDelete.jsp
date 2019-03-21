<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.omg.CORBA.Current" %>

<%
    int rno = Integer.parseInt(request.getParameter("rno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String encoded_key = "";

    String column = request.getParameter("column");
    if (column == null)
        column = "";

    String key = request.getParameter("key");
    if (key != null) {
        encoded_key = URLEncoder.encode(key, "euc-kr");
    } else {
        key = "";
    }

    int CurrentPage = Integer.parseInt(request.getParameter("CurrentPage"));

    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
        String jdbcId = "perext";
        String jdbcPw = "joowan0935";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

        String Query1 = "SELECT UsrName, UsrMail, UsrSubject, UsrContent, UsrFileName, UsrFileSize FROM board WHERE RcdNo=?";

        pstmt = conn.prepareStatement(Query1);
        pstmt.setInt(1, rno);
        rs = pstmt.executeQuery();
        rs.next();

        String name = rs.getString(1);
        String mail = rs.getString(2);
        String subject = rs.getString(3);
        String content = rs.getString(4);
        content = content.replaceAll("\r\n", "<BR>");

        String filename = rs.getString(5);
        int filesize = rs.getInt(6);
        filesize = filesize / 1000;


%>

<HTML>
<HEAD>
    <META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
    <LINK REL="stylesheet" type="text/css" href="../include/style.css"/>
    <TITLE>�Խñ� ����</TITLE>
</HEAD>

<SCRIPT type="text/javascript">

    function CheckForm(form) {
        if (!form.pass.value) {
            alert("�н����带 �Է��ϼ���.");
            form.pass.focus();
            return true;
        }
        form.submit();
    }

</SCRIPT>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
    <TR BGCOLOR=#A0A0A0>
        <TD ALIGN=CENTER><FONT SIZE=4><B>�Խ��� ( �Խñ� ���� )</B></FONT></TD>
    </TR>
</TABLE>

<%
    //------------------------------- JSP CODE START ( ���� ������ ���� ���� ���� )
    String member_id = (String) session.getAttribute("member_id");
    if (member_id == null) {
%>
<jsp:include page="../member/LoginForm.jsp">
    <jsp:param name="CurrentPage" value="<%=CurrentPage%>"/>
    <jsp:param name="column" value="<%=column%>"/>
    <jsp:param name="key" value="<%=key%>"/>
</jsp:include>

<jsp:include page="../member/LoginState.jsp">
    <jsp:param name="CurrentPage" value="<%=CurrentPage%>"/>
    <jsp:param name="column" value="<%=column%>"/>
    <jsp:param name="key" value="<%=key%>"/>
</jsp:include>

<%
} else {
%>
<jsp:include page="../member/LoginState.jsp"/>
<%
    }
//------------------------------- JSP CODE END 	
%>

<FORM NAME="BoardDelete" METHOD=POST
      ACTION="BoardDeleteProc.jsp?rno=<%=rno%>&column=<%=column%>&key=<%=encoded_key%>&CurrentPage=<%=CurrentPage%>">

    <TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=1 ALIGN=CENTER>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>�̸�</B></TD>
            <TD WIDTH=500><%=name %>
            </TD>
        </TR>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>���ڿ���</B></TD>
            <TD WIDTH=500><%=mail%>
            </TD>
        </TR>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>����</B></TD>
            <TD WIDTH=500><%=subject %>
            </TD>
        </TR>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>����</B></TD>
            <TD WIDTH=500><%=content %>
            </TD>
        </TR>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>����÷��</B></TD>
            <TD WIDTH=500>
                <%
                    if (filename == null) {
                        out.println("÷�ε� ������ �����ϴ�.");
                    } else {
                        String IMGURL = "images/btn_filedown.gif";
                        out.println("<IMG ALIGN=ABSMIDDLE SRC=" + IMGURL + ">");
                        out.println(filename + "(" + filesize + "Kbyte )");
                    }
                %>
            </TD>
        </TR>


        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>�н�����</B></TD>
            <TD WIDTH=500>
                <INPUT TYPE=PASSWORD NAME="pass" SIZE=20>
            </TD>
        </TR>

    </TABLE>

</FORM>

<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        rs.close();
        pstmt.close();
        conn.close();
    }
%>


<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

    <TR ALIGN=CENTER>
        <TD>
            <IMG SRC="../images/btn_del.gif" onClick="javascript:CheckForm(BoardDelete)" STYLE=CURSOR:HAND>&nbsp;&nbsp;
            <IMG SRC="../images/btn_cancel.gif"
                 onClick="javascript:location.replace('BoardContent.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key %>&CurrentPage=<%=CurrentPage%>')"
                 STYLE=CURSOR:HAND>
        </TD>
    </TR>

</TABLE>

</BODY>
</HTML>