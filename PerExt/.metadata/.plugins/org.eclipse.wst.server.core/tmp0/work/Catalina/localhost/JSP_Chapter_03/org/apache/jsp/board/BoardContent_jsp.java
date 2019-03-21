/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.29
 * Generated at: 2018-09-10 05:39:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.net.URLEncoder;

public final class BoardContent_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.net.URLEncoder");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	int rno = Integer.parseInt(request.getParameter("rno"));

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	
	String encoded_key="";
	
	String column = request.getParameter("column");
	if(column == null)
		column="";
	
	String key = request.getParameter("key");
	if(key!=null){
		encoded_key=URLEncoder.encode(key, "euc-kr");
	}else{
		key="";
	}
	
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
		String jdbcId = "jspuser";
		String jdbcPw = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	
		String Query1 = "UPDATE board SET UsrRefer = UsrRefer+1 WHERE RcdNo=?";
		pstmt = conn.prepareStatement(Query1);
		
		pstmt.setInt(1,rno);
		pstmt.executeUpdate();
		
		String Query2 = "SELECT UsrName, UsrMail, UsrSubject, UsrContent, UsrFileName, UsrFileSize FROM board WHERE RcdNo=?";
		pstmt=conn.prepareStatement(Query2);
		pstmt.setInt(1,rno);
		rs1=pstmt.executeQuery();
		rs1.next();
		
		String name=rs1.getString(1);
		String mail = rs1.getString(2);
		String subject = rs1.getString(3).trim();
		String content = rs1.getString(4).trim();
		content = content.replaceAll("\r\n","<BR>");
		
		String filename = rs1.getString(5);
		int filesize = rs1.getInt(6)/1000;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("\t<META HTTP-EQUIV=\"CONTENT-TYPE\" CONTENT=\"TEXT/HTML; CHARSET=euc-kr\"/>\r\n");
      out.write("\t<LINK REL=\"stylesheet\" type=\"text/css\" href=\"../include/style.css\"/>\t\t\r\n");
      out.write("\t<TITLE>게시글 출력</TITLE>\r\n");
      out.write("</HEAD>\r\n");
      out.write("\r\n");
      out.write("<BODY>\r\n");
      out.write("\r\n");
      out.write("<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>\r\n");
      out.write("\t<TR BGCOLOR=#A0A0A0>\r\n");
      out.write("\t\t<TD ALIGN=CENTER><FONT SIZE=4><B>게시판 ( 게시글 출력 )</B></FONT></TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("</TABLE>\r\n");
      out.write("\r\n");

//------------------------------- JSP CODE START ( 세션 변수에 따른 문서 선택 )
	String member_id = (String)session.getAttribute("member_id");
	if(member_id == null) {

      out.write("\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../member/LoginForm.jsp", out, false);
      out.write('\r');
      out.write('\n');
 
	} else { 

      out.write("\t\t\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../member/LoginState.jsp", out, false);
      out.write('	');
      out.write('\r');
      out.write('\n');
 
	}
//------------------------------- JSP CODE END 	

      out.write("\r\n");
      out.write("\r\n");
      out.write("<BODY>\r\n");
      out.write("\r\n");
      out.write("<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=1 ALIGN=CENTER>\r\n");
      out.write("\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH=120 ALIGN=CENTER><B>이름</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=500>");
      out.print(name );
      out.write("</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH=120 ALIGN=CENTER><B>전자우편</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=500>");
      out.print( mail);
      out.write("</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=500>");
      out.print(subject );
      out.write("</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=500>");
      out.print(content );
      out.write("</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH=120 ALIGN=CENTER><B>첨부파일</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=500>\r\n");

	if(filename == null){
		out.println("첨부된 파일이 없습니다.");
	}else{
		String IMGURL="../images/btn_filedown.gif";
		out.println("<IMG ALIGN=ABSMIDDLE SRC="+IMGURL+">");

      out.write("\r\n");
      out.write("\t<A HREF=\"FileDownload.jsp?filename=");
      out.print(filename );
      out.write('"');
      out.write('>');
      out.print(filename );
      out.write("</A>\r\n");
      out.write("\t(");
      out.print(filesize );
      out.write("KByte)\r\n");

	}

      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR> \r\n");
      out.write("\t \r\n");
      out.write("</TABLE>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>\r\n");
      out.write("\r\n");
      out.write("\t<TR ALIGN=CENTER>\r\n");
      out.write("\t\t<TD WIDTH=\"310\" ALIGN=LEFT>\r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_list.gif\" STYLE=CURSOR:HAND onClick=\"javascript:location.replace('BoardList.jsp?column=");
      out.print(column);
      out.write("&key=");
      out.print(encoded_key);
      out.write("')\">\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD WIDTH=\"310\" ALIGN=RIGHT>    \t\r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_reply.gif\" STYLE=CURSOR:HAND onClick=\"javascript:location.replace('BoardReply.jsp?rno=");
      out.print(rno);
      out.write("&column=");
      out.print(column);
      out.write("&key=");
      out.print(encoded_key);
      out.write("')\">&nbsp;&nbsp;\r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_mdfy.gif\" STYLE=CURSOR:HAND onClick=\"javascript:location.replace('BoardModify.jsp?rno=");
      out.print(rno);
      out.write("&column=");
      out.print(column);
      out.write("&key=");
      out.print(encoded_key);
      out.write("')\">&nbsp;&nbsp;\r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_del.gif\" STYLE=CURSOR:HAND onClick=\"javascript:location.replace('BoardDelete.jsp?rno=");
      out.print(rno);
      out.write("&column=");
      out.print(column);
      out.write("&key=");
      out.print(encoded_key);
      out.write("')\">\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");
      out.write("</TABLE>\r\n");

	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		rs1.close();
		pstmt.close();
		conn.close();
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}