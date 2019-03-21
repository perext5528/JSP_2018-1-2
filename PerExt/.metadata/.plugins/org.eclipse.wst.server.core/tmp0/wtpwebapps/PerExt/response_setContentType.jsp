<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%

response.setContentType("image/png");
String filename = application.getRealPath("/") + "rpi.png";

out.clear();
pageContext.pushBody();

FileInputStream fis = new FileInputStream(filename);
BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
byte[] data = new byte[1024];
int count=0;
while((count=fis.read(data)) !=-1)
	bos.write(data);

fis.close();
bos.close();
%>