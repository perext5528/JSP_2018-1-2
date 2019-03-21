import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/userData2")
public class userdata2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String UserID = request.getParameter("uid");
        String UserPW = request.getParameter("upw");
        String UserAge = request.getParameter("age");
        String UserCity = request.getParameter("city");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<HTML>");
        out.println("<HEAD></HEAD>");
        out.println("<BODY>");
        out.println("아이디 : "+UserID + "<br>");
        out.println("패스워드 : "+UserPW + "<br>");
        out.println("나이 : "+UserAge + "<br>");
        out.println("도시 : "+UserCity+"<br>");
        out.println("</BODY>");
        out.println("</HTML>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
