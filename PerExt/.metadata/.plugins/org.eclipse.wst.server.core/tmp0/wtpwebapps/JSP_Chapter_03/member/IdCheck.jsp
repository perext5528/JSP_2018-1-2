<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<TITLE>���̵� �ߺ� �˻�</TITLE>
</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>���̵� �ߺ��˻�</B></FONT></TD>
	</TR>
<%
  int ok=0;
  if(ok == 0) {
		//-------------------------------���̵� �̹� �����ϴ� ���
%>

	<TR>
		<TD ALIGN=CENTER>

			<FORM NAME="IdCheck" METHOD=POST ACTION="IdCheck.jsp">
			
			<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR>
					<TD ALIGN=CENTER HEIGHT=70>
						�Է��Ͻ� ��(��) �̹� ��ϵ� ���̵��Դϴ�.<BR>�ٸ� ���̵� �����ϼ���.
					</TD>
				</TR>
				
				<TR>
					<TD ALIGN=CENTER HEIGHT=40>
 						<INPUT TYPE=TEXT NAME="UserId" SIZE=20 MAXLENGTH=20>
							<IMG SRC="../images/btn_search.gif" BORDER=0 ALIGN=ABSMIDDLE>
					</TD>
				</TR>
				
			</TABLE>
			
			</FORM>

		</TD>
	</TR>

<%
  } else {
		//------------------------------- ��� ������ ���̵��� ���
%>

	<TR>
		<TD ALIGN=CENTER>
		
			<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR>
					<TD ALIGN=CENTER HEIGHT=70>
						�Է��Ͻ� ��(��) ��밡���� ���̵��Դϴ�.<BR>�� ���̵� ����Ͻðڽ��ϱ�?
					</TD>
				</TR>
				
				<TR>
					<TD ALIGN=CENTER HEIGHT=40>
						<IMG SRC="../images/btn_id_confirm.gif" BORDER=0 STYLE=CURSOR:HAND>
					</TD>
				</TR>
				
			</TABLE>
			
		</TD>
	</TR>

<%
//------------------------------- JSP CODE START 
  }
//------------------------------- JSP CODE END 
%>

</TABLE>

</BODY>
</HTML>