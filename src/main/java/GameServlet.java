import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

@WebServlet("/GameServlet")
public class GameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String color = request.getParameter("optradio");
        String player = request.getParameter("username");

        session.setAttribute("color",color);    // sending data about player to session
        session.setAttribute("username",player);



        request.getRequestDispatcher("/board.jsp").forward(request, response);
    }

}
