<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<SCRIPT language="javascript" SRC="../include/scripts.js"></SCRIPT>
    <TITLE>ȸ������</TITLE>
</HEAD>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
  <TR BGCOLOR=#A0A0A0>
    <TD ALIGN=CENTER><FONT SIZE=4><B>ȸ �� �� ��</B></FONT></TD>
  </TR>
</TABLE>

<FORM NAME="BeMember" METHOD=POST ACTION="BeMemberProc.jsp">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�̸�</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserName" SIZE=20 MAXLENGTH=20 style="ime-mode:active">
		</TD>
	</TR>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�ֹε�Ϲ�ȣ</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserJumin1" SIZE=6 MAXLENGTH=6> -
			<INPUT TYPE=TEXT NAME="UserJumin2" SIZE=7 MAXLENGTH=7>
		</TD>
	</TR>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>���̵�</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserId" SIZE=20 MAXLENGTH=10 style="ime-mode:inactive">
			<IMG SRC="../images/btn_dup_id_3.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND>
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�н�����</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="UserPass" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�н����� ���Է�</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="ReUserPass" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>���ڿ���</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserMail" SIZE=60 MAXLENGTH=90 style="ime-mode:inactive">
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�� ��</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="ZipCode1" SIZE=3 MAXLENGTH=3> -
			<INPUT TYPE=TEXT NAME="ZipCode2" SIZE=3 MAXLENGTH=3><BR>
			<INPUT TYPE=TEXT NAME="UserAddress1" SIZE=45 MAXLENGTH=110">
			<IMG SRC="../images/btn_post_3.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND><BR>&nbsp;
			������ �ּ�
			<INPUT TYPE=TEXT NAME="UserAddress2" SIZE=45 MAXLENGTH=110>
		</TD>
	  </TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>��ȭ��ȣ</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserTel1" SIZE=3 MAXLENGTH=3> -
			<INPUT TYPE=TEXT NAME="UserTel2" SIZE=4 MAXLENGTH=4> -
			<INPUT TYPE=TEXT NAME="UserTel3" SIZE=4 MAXLENGTH=4>
		</TD>
	</TR>   
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�޴���ȭ</B></TD>
		<TD WIDTH=500>
			<SELECT NAME="UserHp1" SIZE=1>
				<OPTION VALUE="0" SELECTED>��Ż�
				<OPTION VALUE="010">010
				<OPTION VALUE="011">011
			</SELECT> -
			<INPUT TYPE=TEXT NAME="UserHp2" SIZE=4 MAXLENGTH=4> -
			<INPUT TYPE=TEXT NAME="UserHp3" SIZE=4 MAXLENGTH=4>
		</TD>
	</TR> 
   
</TABLE>

</FORM>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD>		
			<IMG SRC="../images/btn_be_member_3.gif" STYLE=CURSOR:HAND>&nbsp;&nbsp;
			<IMG SRC="../images/btn_mb_cancel_3.gif" STYLE=CURSOR:HAND>
		</TD>
	</TR>
	
</TABLE>

</BODY>
</HTML>