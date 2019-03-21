<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>

<HTML>
	<FORM NAME="FileUp" METHOD=POST ACTION="FileUpTestProc.jsp" ENCTYPE="multipart/form-data">
		<TABLE BORDER=1>
			<TR>
				<TD WIDTH=100 ALIGN=CENTER>이름</TD>
				<TD WIDTH=400><INPUT TYPE=TEXT NAME="username" SIZE=15></TD>
			</TR>
			<TR>
				<TD WIDTH=100 ALIGN=CENTER>학번</TD>
				<TD WIDTH=400><INPUT TYPE=TEXT NAME="usernumber" SIZE=15></TD>
			</TR>
			<TR>
				<TD WIDTH=100 ALIGN=CENTER>파일</TD>
				<TD WIDTH=400><INPUT TYPE=FILE NAME="userfile" SIZE=30></TD>
			</TR>
		</TABLE>
		<INPUT TYPE=SUBMIT VALUE="전송">
	</FORM>
</HTML>