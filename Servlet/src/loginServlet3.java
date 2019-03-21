import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class loginServlet3 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/jspdb";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String str = null;
        String userID = request.getParameter("uid");
        String userPW = request.getParameter("upw");


        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, "perext", "joowan0935");
            String query = "SELECT * FROM account WHERE uNo=1";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            rs.next();
            String realID = rs.getString(2);
            String realPW = rs.getString(3);

            if (userID.equals(realID) && userPW.equals(realPW)) {
                str = "로그인되었습니다.";
            } else {
                str = "아이디나 패스워드가 다릅니다.";
            }
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();


            out.println("<HTML>");
            out.println("<HEAD></HEAD>");
            out.println("<BODY>");
            out.println("<div align=center");
            out.println(str + "<br>");
            out.println("</div>");
            out.println("</BODY></HTML>");


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }


}
