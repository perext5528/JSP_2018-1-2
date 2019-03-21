<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>

<%request.setCharacterEncoding("EUC-KR"); %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs1 = null;
    ResultSet rs2 = null;

    int TotalRecords = 0;

    int CurrentPage = 0;
    int Number = 0;
    int TotalPages = 0;
    int TotalPageSets = 0;
    int CurrentPageSet = 0;

    int PageRecords = 10;
    int PageSets = 10;

    if (request.getParameter("CurrentPage") == null) {
        CurrentPage = 1;
    } else {
        CurrentPage = Integer.parseInt(request.getParameter("CurrentPage"));
    }

    String Query1 = "";
    String Query2 = "";
    String encoded_key = "";

    int FirstRecord = PageRecords * (CurrentPage - 1);

    String column = request.getParameter("column");
    if (column == null)
        column = "";

    String key = request.getParameter("key");
    if (key != null) {
        encoded_key = URLEncoder.encode(key, "euc-kr");
    } else {
        key = "";
    }

    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
        String jdbcId = "perext";
        String jdbcPw = "joowan0935";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

        if (column.equals("") || key.equals("")) {
            Query1 = "SELECT count(RcdNo) FROM board";
            Query2 = "SELECT RcdNo, UsrSubject, UsrName, UsrDate, UsrRefer, RcdLevel FROM board ORDER BY GrpNo DESC, RcdOrder ASC LIMIT " + FirstRecord + ", " + PageRecords;
        } else {
            Query1 = "SELECT count(RcdNo) FROM board WHERE " + column + " LIKE '%" + key + "%'";
            Query2 = "SELECT RcdNo, UsrSubject, UsrName, UsrDate, UsrRefer, RcdLevel FROM board WHERE " + column + " LIKE '%" + key + "%'" + " ORDER BY GrpNo DESC, RcdOrder ASC LIMIT " + FirstRecord + ", " + PageRecords;
        }
        pstmt = conn.prepareStatement(Query1);
        rs1 = pstmt.executeQuery();
        pstmt = conn.prepareStatement(Query2);
        rs2 = pstmt.executeQuery();

        rs1.next();
        TotalRecords = rs1.getInt(1);

        Number = TotalRecords - (CurrentPage - 1) * PageRecords;
%>

<HTML>
<HEAD>
    <META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
    <LINK REL="stylesheet" type="text/css" href="../include/style.css"/>
    <TITLE>�Խñ� ����Ʈ</TITLE>
</HEAD>

<BODY>
<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
    <TR BGCOLOR=#A0A0A0>
        <TD ALIGN=CENTER><FONT SIZE=4><B>�Խ��� ( ����Ʈ )</B></FONT></TD>
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

<%
} else {
%>

<jsp:include page="../member/LoginState.jsp">
    <jsp:param name="CurrentPage" value="<%=CurrentPage%>"/>
    <jsp:param name="column" value="<%=column%>"/>
    <jsp:param name="key" value="<%=key%>"/>
</jsp:include>


<%
    }
//------------------------------- JSP CODE END 	
%>

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=1 ALIGN=CENTER>
    <TR ALIGN=CENTER>
        <TD WIDTH=45><B>��ȣ</B></TD>
        <TD WIDTH=395><B>����</B></TD>
        <TD WIDTH=65><B>�ۼ���</B></TD>
        <TD WIDTH=70><B>�ۼ���</B></TD>
        <TD WIDTH=45><B>����</B></TD>
    </TR>

    <%
        while (rs2.next()) {
            int rno = rs2.getInt("RcdNo");
            String subject = rs2.getString("UsrSubject");

            String name = rs2.getString("UsrName");

            long date = rs2.getLong("UsrDate");
            SimpleDateFormat Current = new SimpleDateFormat("yyyy/MM/dd");
            String today = Current.format(date);

            int refer = rs2.getInt("UsrRefer");
            int level = rs2.getInt("RcdLevel");
    %>

    <TR>
        <TD WIDTH=45 ALIGN=CENTER><%=Number%>
        </TD>
        <TD WIDTH=395 ALIGN=LEFT>
            <%
                for (int i = 0; i < level; i++) out.println("&nbsp;&nbsp;");
                if (level > 0) {
                    String IMGURL = "../images/re.gif";
                    out.println("<IMG ALIGN=ABSMIDDLE SRC=" + IMGURL + ">");
                }

                int max_length = 34;
                int cut_length = max_length - (level);

                if (subject.length() > cut_length) {
                    subject = subject.substring(0, cut_length);
                    subject = subject + "..";
                }
            %>
            <A HREF="BoardContent.jsp?rno=<%=rno%>&column=<%=column%>&key=<%=encoded_key%>&CurrentPage=<%=CurrentPage%>"><%=subject%>
            </A>
            <%
                long now = System.currentTimeMillis();
                long dist = (now - date) / 1000;
                long during = 60 * 60 * 24;

                if (dist < during) {
                    String IMGURL = "../images/new.gif";
                    out.println("<IMG ALIGN=ABSMIDDLE width=15 HEIGHT=12 SRC=" + IMGURL + ">");
                }
            %>
        </TD>
        <TD WIDTH=65 ALIGN=CENTER><%=name%>
        </TD>
        <TD ALIGN=CENTER><%=today%>
        </TD>
        <TD ALIGN=CENTER><%=refer%>
        </TD>
    </TR>

    <%
            Number--;
        }
    %>

</TABLE>

<FORM NAME="BoardSearch" METHOD=POST action="BoardList.jsp">
    <TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
        <TR>
            <TD ALIGN=LEFT WIDTH=100>
                <IMG SRC="../images/btn_new.gif"
                     onClick="javascript:location.replace('BoardWrite.jsp?column=<%=column%>&key=<%=encoded_key%>&CurrentPage=<%=CurrentPage%>')"
                     ; STYLE=CURSOR:HAND>
            </TD>
            <TD WIDTH=320 ALIGN=CENTER>
                <%
                    TotalPages = (int) Math.ceil((double) TotalRecords / PageRecords);
                    TotalPageSets = (int) Math.ceil((double) TotalPages / PageSets);
                    CurrentPageSet = (int) Math.ceil((double) CurrentPage / PageSets);

                    String bf_block = "../images/btn_bf_block.gif";
                    String bf_page = "../images/btn_bf_page.gif";
                    String nxt_page = "../images/btn_nxt_page.gif";
                    String nxt_block = "../images/btn_nxt_block.gif";

                    if (CurrentPageSet > 1) {
                        int BeforePageSetLastPage = PageSets * (CurrentPageSet - 1);
                        String retUrl = "BoardList.jsp?CurrentPage=" + BeforePageSetLastPage + "&column=" + column + "&key=" + encoded_key;
                        String click = "javascript:location.replace('" + retUrl + "')";
                        out.println("<IMG SRC = " + bf_block + " onClick=" + click + " STYLE=CURSOR:HAND>");
                    } else {
                        out.println("<IMG SRC=" + bf_block + ">");
                    }

                    if (CurrentPage > 1) {
                        int BeforePage = CurrentPage - 1;
                        String retUrl = "BoardList.jsp?CurrentPage=" + BeforePage + "&column=" + column + "&key=" + encoded_key;
                        String click = "javascript:location.replace('" + retUrl + "')";
                        out.println("<IMG SRC=" + bf_page + " onClick=" + click + " STYLE=CURSOR:HAND>");
                    } else {
                        out.println("<IMG SRC=" + bf_page + ">");
                    }

                    int FirstPage = PageSets * (CurrentPageSet - 1);
                    int LastPage = PageSets * CurrentPageSet;

                    if (CurrentPageSet == TotalPageSets) {
                        LastPage = TotalPages;
                    }

                    for (int i = FirstPage + 1; i <= LastPage; i++) {
                        if (CurrentPage == i) {
                            out.println("<B>" + i + "</B>");
                        } else {
                            String retUrl = "BoardList.jsp?CurrentPage=" + i + "&column=" + column + "&key=" + encoded_key;
                            out.println("<A HREF=" + retUrl + ">" + i + "</A>");
                        }
                    }

                    if (TotalPages > CurrentPage) {
                        int NextPage = CurrentPage + 1;
                        String retUrl = "BoardList.jsp?CurrentPage=" + NextPage + "&column=" + column + "&key=" + encoded_key;
                        String click = "javascript:location.replace('" + retUrl + "')";
                        out.println("<IMG SRC = " + nxt_page + " onClick=" + click + " STYLE=CURSOR:HAND>");
                    } else {
                        out.println("<IMG SRC=" + nxt_page + ">");
                    }

                    if (TotalPageSets > CurrentPageSet) {
                        int NextPageSet = PageSets * CurrentPageSet + 1;
                        String retUrl = "BoardList.jsp?CurrentPage=" + NextPageSet + "&column=" + column + "&key=" + encoded_key;
                        String click = "javascript:location.replace('" + retUrl + "')";
                        out.println("<IMG SRC = " + nxt_block + " onClick=" + click + " STYLE=CURSOR:HAND>");
                    } else {
                        out.println("<IMG SRC=" + nxt_block + ">");
                    }

                %>
            </TD>
            <TD WIDTH=200 ALIGN=RIGHT>
                <SELECT NAME="column" SIZE=1>
                    <OPTION VALUE="" SELECTED>����</OPTION>
                    <OPTION VALUE="UsrSubject">����</OPTION>
                    <OPTION VALUE="UsrContent">����</OPTION>
                </SELECT>
                <INPUT TYPE=TEXT NAME="key" SIZE=10 MAXLENGTH=20>
                <IMG SRC="../images/btn_search.gif" ALIGN=absmiddle STYLE=CURSOR:HAND onClick="javascript:submit()">
            </TD>
        </TR>
    </TABLE>
</FORM>

<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        rs2.close();
        rs1.close();
        pstmt.close();
        conn.close();
    }
%>
</BODY>
</HTML>