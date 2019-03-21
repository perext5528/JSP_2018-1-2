import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num1, num2;
        int result;
        String op;
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();
        num1 = Integer.parseInt(request.getParameter("num1"));
        num2 = Integer.parseInt(request.getParameter("num2"));
        op = request.getParameter("operator");

        Calc calc = new Calc(num1, num2, op);
        result = calc.getResult();

        out.println("<HTML>");
        out.println("<HEAD><TITLE>계산기</TITLE></HEAD>");
        out.println("<BODY>");
        out.println("<TABLE width=400 height=100 align=center border=1>");
        out.println("<TR align=center><TD>");
        out.println("<H2>계산결과</H2>");
        out.println("<HR>");
        out.println(num1 + " " + op + " " + num2 + " = " + result);
        out.println("</TD></TR>");
        out.println("</TABLE>");
        out.println("</BODY></HTML>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
