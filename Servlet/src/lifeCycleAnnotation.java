import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@WebServlet("/lifeCycleAnnotation")
public class lifeCycleAnnotation extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet요청 수행");
    }

    @Override
    public void init() throws ServletException{
        System.out.println("init 요청");
    }

    @Override
    public void destroy(){
        System.out.println("destroy 요청");
    }

    @PostConstruct
    public void beforeInit(){
        System.out.println("init 요청 전 처리 루틴");
    }

    @PreDestroy
    public void afterDestroy(){
        System.out.println("destroy 요청 후 처리 루틴");
    }
}
