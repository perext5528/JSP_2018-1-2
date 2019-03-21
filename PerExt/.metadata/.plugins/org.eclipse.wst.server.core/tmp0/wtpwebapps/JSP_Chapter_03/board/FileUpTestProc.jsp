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
	out.println("저장경로 : "+realFolder+"<BR>");
	
	int sizeLimit = 10*1024*1024;
	String encType = "euc-kr";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	multi=new MultipartRequest(request, realFolder, sizeLimit, encType, policy);
	
	String name = multi.getParameter("username");
	int number = Integer.parseInt(multi.getParameter("usernumber"));
	
	String filename = multi.getFilesystemName("userfile");
	out.println("저장된 파일명 : "+filename+"<BR>");
	
	String orginfilename = multi.getOriginalFileName("userfile");
	out.println("업로드 파일명 : "+orginfilename+"<BR>");
	
	if(filename!=null){
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		out.println("fname : "+fname+"<BR>");
		
		File file = multi.getFile(fname);
		
		int filesize=(int)file.length();
		out.println("파일의 크기 : "+filesize+"<BR>");
		
		String filetype = multi.getContentType(fname);
		out.println("파일의 타입 : "+filetype+"<BR>");
	}
%>

<A HREF="FileDownload.jsp?filename=<%=filename%>"><%=filename %></A>