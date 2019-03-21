<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*"  %>
<%@ page import="java.io.*"  %>

<%request.setCharacterEncoding("euc-kr");%>

<%
	String saveFolder="Upload_Files";
	MultipartRequest multi=null;
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath(saveFolder);
	out.println("������ : "+realFolder+"<BR>");
	
	int sizeLimit = 10*1024*1024;
	String encType = "euc-kr";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	multi=new MultipartRequest(request, realFolder, sizeLimit, encType, policy);
	
	String name = multi.getParameter("username");
	int number = Integer.parseInt(multi.getParameter("usernumber"));
	
	String filename = multi.getFilesystemName("userfile");
	out.println("����� ���ϸ� : "+filename+"<BR>");
	
	String orginfilename = multi.getOriginalFileName("userfile");
	out.println("���ε� ���ϸ� : "+orginfilename+"<BR>");
	
	if(filename!=null){
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		out.println("fname : "+fname+"<BR>");
		
		File file = multi.getFile(fname);
		
		int filesize=(int)file.length();
		out.println("������ ũ�� : "+filesize+"<BR>");
		
		String filetype = multi.getContentType(fname);
		out.println("������ Ÿ�� : "+filetype+"<BR>");
	}
%>

<A HREF="FileDownload.jsp?filename=<%=filename%>"><%=filename %></A>