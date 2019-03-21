<%--
  Created by IntelliJ IDEA.
  User: azure
  Date: 2018-10-22
  Time: 오후 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="javax.management.Query" %>

<%request.setCharacterEncoding("euc-kr");%>

<%
    int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

    String m_column = request.getParameter("column");
    if(m_column == null) m_column="";

    String m_encoded_key = null;

    String m_key = request.getParameter("key");
    if(m_key != null){
        m_encoded_key = URLEncoder.encode(m_key, "euc-kr");
    }else{
        m_key="";
    }

    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs1 = null;
    ResultSet rs2 = null;

    try{
        String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
        String jdbcId = "perext";
        String jdbcPw = "joowan0935";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

        String id = request.getParameter("UserId");

        String Query1 = "SELECT count(UsrNo) FROM member WHERE UsrId='"+id+"'";
        stmt = conn.createStatement();
        rs1 = stmt.executeQuery(Query1);
        rs1.next();

        int same_id=rs1.getInt(1);
        if(same_id==0){
            String name = request.getParameter("UserName");
            String jumin1 = request.getParameter("UserJumin1");
            String jumin2 = request.getParameter("UserJumin2");
            String pass = request.getParameter("UserPass");
            String repass = request.getParameter("ReUserPass");
            String mail = request.getParameter("UserMail");
            String zip1 = request.getParameter("ZipCode1");
            String zip2 = request.getParameter("ZipCode2");
            String addr1 = request.getParameter("UserAddress1");
            String addr2 = request.getParameter("UserAddress2");
            String tel1 = request.getParameter("UserTel1");
            String tel2 = request.getParameter("UserTel2");
            String tel3 = request.getParameter("UserTel3");
            String hp1 = request.getParameter("UserHp1");
            String hp2 = request.getParameter("UserHp2");
            String hp3 = request.getParameter("UserHp3");

            long now = System.currentTimeMillis();

            String Query2 = "SELECT max(UsrNo) FROM member";
            stmt = conn.createStatement();
            rs2 = stmt.executeQuery(Query2);

            rs2.next();
            int uno = (rs2.getInt(1)) + 1;

            String Query3 = "INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(Query3);

            pstmt.setInt(1, uno);
            pstmt.setString(2, name);
            pstmt.setString(3, jumin1);
            pstmt.setString(4, jumin2);
            pstmt.setString(5, id);
            pstmt.setString(6, pass);
            pstmt.setString(7, mail);
            pstmt.setString(8, zip1);
            pstmt.setString(9, zip2);
            pstmt.setString(10, addr1);
            pstmt.setString(11, addr2);
            pstmt.setString(12, tel1);
            pstmt.setString(13, tel2);
            pstmt.setString(14, tel3);
            pstmt.setString(15, hp1);
            pstmt.setString(16, hp2);
            pstmt.setString(17, hp3);
            pstmt.setLong(18, now);

            pstmt.executeUpdate();

            rs2.close();
            rs1.close();
            stmt.close();
            pstmt.close();
            conn.close();

            String retURL = "../board/BoardList.jsp?column="+m_column+"&key"+m_encoded_key+"&CurrentPage="+m_cp;

            out.println("<script language=\"javascript\">");
            out.println("alert('회원가입이 완료되었습니다.\\n 아이디와 패스워드로 로그인하세요')");
            out.println("location.replace('"+retURL+"')");
            out.println("</script>");

            out.flush();
        }else{
            rs1.close();
            stmt.close();
            conn.close();

            out.println("<script language=\"javascript\">");
            out.println("alert('동일한 아이디가 존재합니다.')");
            out.println("history.back()");
            out.println("</script>");
            out.flush();
        }

    }catch (SQLException e){
        out.print(e);
    }
%>