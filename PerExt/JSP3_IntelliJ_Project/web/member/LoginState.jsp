<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
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

    String name = (String) session.getAttribute("member_name");
%>


<TABLE WIDTH=620 BORDER=0 ALIGN=CENTER CELLSPACING=0 CELLPADDING=0>

    <TR>
        <TD ALIGN=LEFT WIDTH=320>
            <FONT SIZE=2><B><%=name%>���� �湮�� ȯ���մϴ�.</FONT>
        </TD>
        <TD ALIGN=RIGHT WIDTH=300>
            <IMG SRC="../images/btn_logout.gif" STYLE=CURSOR:HAND
                 onclick="javascript:location.replace('../member/LogOut.jsp?CurrentPage=<%=m_cp%>&column<%=m_column%>&key<%=m_encoded_key%>')">
            <IMG SRC="../images/btn_mb_mdfy.gif" STYLE=CURSOR:HAND>
        </TD>
    </TR>

</TABLE>