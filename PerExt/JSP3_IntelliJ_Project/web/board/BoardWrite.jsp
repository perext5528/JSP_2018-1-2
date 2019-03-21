<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.net.URLEncoder" %>

<%

    String encoded_key = " ";

    String column = request.getParameter("column");
    if (column == null)
        column = "";

    String key = request.getParameter("key");
    if (key != null) {
        encoded_key = URLEncoder.encode(key, "EUC-KR");
    } else {
        key = "";
    }

    int CurrentPage = Integer.parseInt(request.getParameter("CurrentPage"));
%>
<HTML>
<HEAD>
    <META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
    <LINK REL="stylesheet" type="text/css" href="../include/style.css"/>
    <SCRIPT language="javascript" SRC="../include/scripts.js"></SCRIPT>
    <TITLE>�Խñ� �Է�</TITLE>
    <SCRIPT type="text/javascript">
        function CheckForm(form) {
            if (!form.name.value) {
                alert("������ �Է��ϼ���.");
                form.name.focus();
                return true;
            }
            if (form.mail.value) {
                if (!isCorrectEmail("BoardWrite", "mail")) {
                    alert("���ڿ��� ������ �ùٸ��� �ʽ��ϴ�.");
                    form.mail.focus();
                    form.mail.select();
                    return;
                }
            }
            if (!form.subject.value) {
                alert("�Խñ��� ������ �Է��ϼ���.");
                form.subject.focus();
                return true;
            }
            if (!form.pass.value) {
                alert("�н����带 �Է��ϼ���.");
                form.pass.focus();
                return true;
            }
            form.submit();
        }
    </SCRIPT>

</HEAD>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
    <TR BGCOLOR=#A0A0A0>
        <TD ALIGN=CENTER><FONT SIZE=4><B>�Խ��� ( �Խñ� �Է� )</B></FONT></TD>
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

<FORM NAME="BoardWrite" METHOD=POST ACTION="BoardWriteProc.jsp" ENCTYPE="multipart/form-data">

    <TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>�̸�</B></TD>
            <TD WIDTH=500>
                <INPUT TYPE=TEXT NAME="name" SIZE=20 style="ime-mode:active" onKeyDown="javascript:Korean()">
            </TD>
        </TR>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>���ڿ���</B></TD>
            <TD WIDTH=500>
                <INPUT TYPE=TEXT NAME="mail" SIZE=60 style="ime-mode:inactive">
            </TD>
        </TR>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>����</B></TD>
            <TD WIDTH=500>
                <INPUT TYPE=TEXT NAME="subject" SIZE=70>
            </TD>
        </TR>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>����</B></TD>
            <TD WIDTH=500>
                <TEXTAREA NAME="content" COLS=70 ROWS=8></TEXTAREA>
            </TD>
        </TR>

        <TR>
            <TD WIDTH=120 ALIGN=CENTER><B>����÷��</B></TD>
            <TD WIDTH=500>
                <INPUT TYPE=FILE NAME="filename" SIZE=60>
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

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

    <TR ALIGN=CENTER>
        <TD WIDTH=110 ALIGN=LEFT>
            <IMG SRC="../images/btn_list.gif"
                 onClick="javascript:location.replace('BoardList.jsp?column=<%=column %>&key=<%=encoded_key %>')"
                 STYLE=CURSOR:HAND>
        </TD>
        <TD WIDTH=400 ALIGN=CENTER>
            <IMG SRC="../images/btn_save.gif" VALUE="�Է�" STYLE=CURSOR:HAND onClick="javascript:CheckForm(BoardWrite)">&nbsp;&nbsp;
            <IMG SRC="../images/btn_cancel.gif" VALUE="���" STYLE=CURSOR:HAND
                 onClick="javascript:location.replace('BoardList.jsp?column=<%=column %>&key=<%=encoded_key %>&CurrentPage=<%=CurrentPage%>')">
        </TD>
        <TD WIDTH=110 ALIGN=LEFT>&nbsp;</TD>
    </TR>

</TABLE>

</BODY>
</HTML>