import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "ColorFilter")
public class ColorFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpSession session = httpReq.getSession();

        String color = (String) session.getAttribute("color");
        if (color!=null && color.equals("White")){
            System.out.println("White is already chosen!");
            session.setAttribute("alert", "White color is chosen, so choose another one!");
        } else if (color!=null && color.equals("Black")){
            session.setAttribute("alert", "Black color is chosen, so choose another one!");
        }


        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
