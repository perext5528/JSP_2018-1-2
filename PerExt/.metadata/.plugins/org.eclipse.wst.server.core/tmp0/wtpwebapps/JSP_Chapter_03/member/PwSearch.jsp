<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<TITLE>�н����� ã��</TITLE>
</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>�н����� ã��</B></FONT></TD>
	</TR>

	<TR>
		<TD ALIGN=CENTER>
		
			<FORM NAME="PwSearch" METHOD=POST ACTION="PwSearchProc.jsp">
			
			<TABLE WIDTH=250 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR>
					<BR>
					<TD WIDTH=100>���̵�</TD>
					<TD WIDTH=150><INPUT TYPE=TEXT NAME="UserId" SIZE=17 MAXLENGTH=20 STYLE="ime-mode:inactive"></TD>
				</TR>
				
				<TR>
					<TD WIDTH=100>�̸�</TD>
					<TD WIDTH=150><INPUT TYPE=TEXT NAME="UserName" SIZE=17 MAXLENGTH=20 STYLE="ime-mode:active"></TD>
				</TR>
				
				<TR>
					<TD WIDTH=100>�ֹε�Ϲ�ȣ</TD>
					<TD WIDTH=150>
						<INPUT TYPE=TEXT NAME="UserJumin1" SIZE=6 MAXLENGTH=6> -
						<INPUT TYPE=TEXT NAME="UserJumin2" SIZE=7 MAXLENGTH=7>
					</TD>
				</TR>
				
			</TABLE>
			
			</FORM>
			
		</TD>
	</TR>

	<TR>
		<TD HEIGHT=50 ALIGN=CENTER>
			<IMG SRC="../images/btn_idpw_srch_ok.gif" STYLE=CURSOR:HAND>&nbsp;&nbsp;
			<IMG SRC="../images/btn_idpw_srch_cancel.gif" STYLE=CURSOR:HAND>
		</TD>
	</TR>

</TABLE>

</BODY>
</HTML>