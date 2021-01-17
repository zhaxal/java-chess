import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "StartFilter")
public class StartFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("Entering filter");
        System.out.println(req.getParameter("username"));
        System.out.println(req.getParameter("optradio"));
        if (req.getParameter("username").equals("") && req.getParameter("optradio")==null){
            req.getRequestDispatcher("welcome_page.jsp").forward(req,resp);
        }
        chain.doFilter(req, resp);


    }

    public void init(FilterConfig config) throws ServletException {

    }

}
