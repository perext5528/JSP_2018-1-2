<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

<HTML>
<HEAD>
    <META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
    <LINK REL="stylesheet" type="text/css" href="../include/style.css">
    <TITLE>���̵� ã��</TITLE>

    <SCRIPT language="javascript" SRC="../include/scripts.js"></SCRIPT>
    <script language="javascript">
        function CheckMemberForm(form) {
            if (!form.UserName.value) {
                alert("�̸��� �Է��ϼ���.");
                form.UserName.focus();
                return true
            }

            if (!form.UserJumin1.value) {
                alert("�ֹε�Ϲ�ȣ �� 6�ڸ��� �Է��ϼ���.");
                form.UserJumin1.focus();
                return
            }

            if (!form.UserJumin2.value) {
                alert("�ֹε�Ϲ�ȣ �� 7�ڸ��� �Է��ϼ���.");
                form.UserJumin2.focus();
                return
            }
            if (!JuminNoCheck(form.UserJumin1, form.UserJumin2)) {
                //alert("�ֹι�ȣ�� ����ġ �ʽ��ϴ�.");
                //form.UserJumin1.focus();
                //return;
            }
            form.submit();
        }
    </script>

</HEAD>


<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

    <TR BGCOLOR=#A0A0A0>
        <TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>���̵� ã��</B></FONT></TD>
    </TR>

    <TR>
        <TD ALIGN=CENTER>

            <FORM NAME="IdSearch" METHOD=POST ACTION="IdSearchProc.jsp">

                <TABLE WIDTH=250 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

                    <TR>
                        <BR>
                        <TD WIDTH=100 HEIGHT=30>�̸�</TD>
                        <TD WIDTH=150 HEIGHT=30>
                            <INPUT TYPE=TEXT NAME="UserName" SIZE=17 MAXLENGTH=20 STYLE="ime-mode:active"
                                   onkeydown="javascript:Korean()">
                        </TD>
                    </TR>

                    <TR>
                        <TD WIDTH=100 HEIGHT=30>�ֹε�Ϲ�ȣ</TD>
                        <TD WIDTH=150 HEIGHT=30>
                            <INPUT TYPE=TEXT NAME="UserJumin1" SIZE=6 MAXLENGTH=6 STYLE="ime-mode:disabled"
                                   onkeydown="javascript:NumKey()"> -
                            <INPUT TYPE=TEXT NAME="UserJumin2" SIZE=7 MAXLENGTH=7 STYLE="ime-mode:disabled"
                                   onkeydown="javascript:NumKey()">
                        </TD>
                    </TR>

                </TABLE>

            </FORM>

        </TD>
    </TR>

    <TR>
        <TD HEIGHT=50 ALIGN=CENTER>
            <IMG SRC="../images/btn_idpw_srch_ok.gif" STYLE=CURSOR:HAND onclick="javascript:CheckMemberForm(IdSearch)">&nbsp;&nbsp;
            <IMG SRC="../images/btn_idpw_srch_cancel.gif" STYLE=CURSOR:HAND onclick="javascript:self.close()">
        </TD>
    </TR>

</TABLE>

</BODY>
</HTML>