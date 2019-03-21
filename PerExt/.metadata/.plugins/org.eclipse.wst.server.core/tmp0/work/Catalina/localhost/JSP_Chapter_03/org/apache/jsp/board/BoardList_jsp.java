/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.29
 * Generated at: 2018-09-10 05:20:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.net.URLEncoder;

public final class BoardList_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
request.setCharacterEncoding("EUC-KR"); 
      out.write("\r\n");
      out.write("\r\n");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	
	int TotalRecords = 0;
	
	String Query1 = " ";
	String Query2 = " ";
	String encoded_key = " ";
	
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
		
		if(column.equals("")||key.equals("")){
			Query1 = "SELECT count(RcdNo) FROM board";
			Query2 = "SELECT RcdNo, UsrSubject, UsrName, UsrDate, UsrRefer, RcdLevel FROM board ORDER BY GrpNo DESC, RcdOrder ASC";
		}else{
			Query1 = "SELECT count(RcdNo) FROM board WHERE "+column+" LIKE '%"+key+"%'";
			Query2 = "SELECT RcdNo, UsrSubject, UsrName, UsrDate, UsrRefer, RcdLevel FROM board WHERE "+column+" LIKE '%"+key+"%'"+" ORDER BY GrpNo DESC, RcdOrder ASC";
		}
		pstmt = conn.prepareStatement(Query1);
		rs1 = pstmt.executeQuery();
		pstmt = conn.prepareStatement(Query2);
		rs2 = pstmt.executeQuery();
		
		rs1.next();
		TotalRecords = rs1.getInt(1);
		

      out.write("\r\n");
      out.write("\r\n");
      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("\t<META HTTP-EQUIV=\"CONTENT-TYPE\" CONTENT=\"TEXT/HTML; CHARSET=euc-kr\"/>\r\n");
      out.write("\t<LINK REL=\"stylesheet\" type=\"text/css\" href=\"../include/style.css\"/>\t\r\n");
      out.write("\t<TITLE>게시글 리스트</TITLE>\r\n");
      out.write("</HEAD>\r\n");
      out.write("\r\n");
      out.write("<BODY>\r\n");
      out.write("\r\n");
      out.write("<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>\r\n");
      out.write("\t<TR BGCOLOR=#A0A0A0>\r\n");
      out.write("\t\t<TD ALIGN=CENTER><FONT SIZE=4><B>게시판 ( 리스트 )</B></FONT></TD>\r\n");
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
      out.write(" \r\n");
      out.write("<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=1 ALIGN=CENTER>\r\n");
      out.write("\r\n");
      out.write("\t<TR ALIGN=CENTER>\r\n");
      out.write("\t\t<TD WIDTH=45><B>번호</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=395><B>제목</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=65><B>작성자</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=70><B>작성일</B></TD>\r\n");
      out.write("\t\t<TD WIDTH=45><B>참조</B></TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");

	while(rs2.next()){
		int rno = rs2.getInt("RcdNo");
		String subject = rs2.getString("UsrSubject");
		
		String name = rs2.getString("UsrName");
		
		long date = rs2.getLong("UsrDate");
		SimpleDateFormat Current = new SimpleDateFormat("yyyy/MM/dd");
		String today = Current.format(date);
		
		int refer = rs2.getInt("UsrRefer");
		int level = rs2.getInt("RcdLevel");
	

      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD WIDTH=45 ALIGN=CENTER>");
      out.print(TotalRecords);
      out.write("</TD>\r\n");
      out.write("\t\t<TD WIDTH=395 ALIGN=LEFT>\r\n");
      out.write("\t\t");

		for(int i=0; i<level; i++) out.println("&nbsp;&nbsp;");
		if(level>0){
			String IMGURL="../images/re.gif";
			out.println("<IMG ALIGN=ABSMIDDLE SRC=" + IMGURL + ">");
		}
		
		int max_length=34;
		int cut_length = max_length-(level);
		
		if(subject.length() > cut_length){
			subject = subject.substring(0, cut_length);
			subject = subject + "..";
		}
		
      out.write("\r\n");
      out.write("\t\t<A HREF=\"BoardContent.jsp?rno=");
      out.print(rno);
      out.write("&column=");
      out.print(column);
      out.write("&key=");
      out.print(encoded_key);
      out.write('"');
      out.write('>');
      out.print(subject);
      out.write("</A>\r\n");
      out.write("\t\t");

		long now = System.currentTimeMillis();
		long dist = (now-date)/1000;
		long during = 60*60*24;
		
		if(dist<during){
			String IMGURL="../images/new.gif";
			out.println("<IMG ALIGN=ABSMIDDLE width=15 HEIGHT=12 SRC="+IMGURL+">");
		}
		
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD WIDTH=65 ALIGN=CENTER>");
      out.print(name);
      out.write("</TD>\r\n");
      out.write("\t\t<TD ALIGN=CENTER>");
      out.print(today);
      out.write("</TD>\r\n");
      out.write("\t\t<TD ALIGN=CENTER>");
      out.print(refer);
      out.write("</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");

		TotalRecords--;
	}

      out.write("\r\n");
      out.write("\t\r\n");
      out.write("</TABLE>\r\n");
      out.write("\r\n");
      out.write("<FORM NAME=\"BoardSearch\" METHOD=POST action=\"BoardList.jsp\">\r\n");
      out.write("\r\n");
      out.write("<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>\r\n");
      out.write("\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD ALIGN=LEFT WIDTH=100>\r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_new.gif\" onClick=\"javascript:location.replace('BoardWrite.jsp?column=");
      out.print(column);
      out.write("&key=");
      out.print(encoded_key);
      out.write("')\" STYLE=CURSOR:HAND>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD WIDTH=320 ALIGN=CENTER>\r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_bf_block.gif\">&nbsp;\r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_bf_page.gif\">&nbsp;    \t\r\n");
      out.write("\t\t\t1&nbsp;&nbsp;2&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;5&nbsp;&nbsp;6&nbsp;&nbsp;7&nbsp;&nbsp;8&nbsp;&nbsp;9&nbsp;&nbsp;10&nbsp;\r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_nxt_page.gif\">&nbsp; \r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_nxt_block.gif\">    \t    \t\t     \r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD WIDTH=200 ALIGN=RIGHT>\r\n");
      out.write("\t\t\t<SELECT NAME=\"column\" SIZE=1>\r\n");
      out.write("\t\t\t\t<OPTION VALUE=\"\" SELECTED>선택</OPTION>\r\n");
      out.write("\t\t\t\t<OPTION VALUE=\"UsrSubject\">제목</OPTION>\r\n");
      out.write("\t\t\t\t<OPTION VALUE=\"UsrContent\">내용</OPTION>\r\n");
      out.write("\t\t\t</SELECT> \r\n");
      out.write("\t\t\t<INPUT TYPE=TEXT NAME=\"key\" SIZE=10 MAXLENGTH=20> \r\n");
      out.write("\t\t\t<IMG SRC=\"../images/btn_search.gif\" ALIGN=absmiddle STYLE=CURSOR:HAND\r\n");
      out.write("\t\t\tonClick=\"javascript:submit()\">\r\n");
      out.write("\t\t</TD>    \r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");
      out.write("</TABLE>\r\n");
      out.write("\r\n");
      out.write("</FORM>\r\n");
      out.write("\r\n");

	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		rs2.close();
		rs1.close();
		pstmt.close();
		conn.close();
	}

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