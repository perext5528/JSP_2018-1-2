<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">	
	<TITLE>�ּ�ã�� - 2�ܰ�</TITLE>
</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=500 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>�ּ�ã�� - 2�ܰ�</B></FONT></TD>
	</TR>

<%
	int ok=0;
	if( ok != 0 ) {
		//------------------------------- �ش� �ּҰ� �����ϴ� ��� �ּ� ����
%>

	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=450 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR>
 					<TD ALIGN=CENTER HEIGHT=30><BR>�� 1���� �ּҰ� �˻��Ǿ����ϴ�.</TD>
				</TR>
				<TR><TD HEIGHT=2 BGCOLOR=#AAAAAA></TD></TR>
 				<TR><TD HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>

	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=400 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR><TD WIDTH=400 HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
				<TR>
 					<TD>[135-810] ����� ������ ����1�� 660</TD>
				</TR>
				<TR><TD HEIGHT=1 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#E2E2E2></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>

	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=450 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR><TD HEIGHT=10 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=3 BGCOLOR=#AAAAAA></TD></TR>
				<TR><TD HEIGHT=3 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>

<%
	} else {
	//------------------------------- �ش� �ּҰ� �������� �ʴ� ��� ó��
%>

	<TR>
		<TD ALIGN=CENTER>
		
			<FORM NAME="AddressSearch2" METHOD=POST ACTION="AddressSearch_2.jsp">
			
			<TABLE WIDTH=400 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR><TD WIDTH=400 HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
				
				<TR>
					<TD ALIGN=CENTER><BR>�ش� �ּҰ� �������� �ʽ��ϴ�. �ٽ� �Է��ϼ���.</TD>
				</TR>
				
				<TR><TD HEIGHT=3 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#E2E2E2></TD></TR>
				<TR><TD HEIGHT=4 BGCOLOR=#FFFFFF></TD></TR>
				
				<TR>
					<TD ALIGN=CENTER>
						<INPUT TYPE=TEXT NAME="UserAddress" SIZE=20 MAXLENGTH=20>
						<IMG SRC="../images/btn_search.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND><BR><BR>
						ã���� �Ͻô� ��, ��, ���� �̸��� �Է��ϼ���.<BR>(��) �ŵ������� ��� '�ŵ���'
					</TD>
				</TR>
				
			</TABLE>
			
			</FORM>
			
		</TD>
	</TR>

<%
	}
%>

</TABLE>

</BODY>
</HTML>