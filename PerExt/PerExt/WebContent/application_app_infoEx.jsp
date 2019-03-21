<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*"%>
<%
out.println("getMimeType, getResource, getRealPath 정보 출력<HR>");
out.println("rpi.png 문서의 MIME 타입 : " + application.getMimeType("rpi.png") + "<BR>");
out.println("루트의 URL 정보 : " + application.getResource("/")+"<BR>");
out.println("루트의 실제 경로 : " + application.getRealPath("/")+"<BR><BR><BR>");

String PathAndName = "./application_app_infoEx.txt";
char[] my_buff = new char[512];
int length = -1;

InputStreamReader isr = new InputStreamReader(application.getResourceAsStream(PathAndName));
BufferedReader br = new BufferedReader(isr);

out.println("application_app_infoEx.txt의 내용 출력<HR>");
while((length = br.read(my_buff)) != -1){
	out.println(new String(my_buff, 0, length));
}
br.close();
isr.close();

%>