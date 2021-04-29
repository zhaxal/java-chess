import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

@WebServlet(name = "ClientServlet")
public class ClientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Socket socket = new Socket()){
            PrintWriter printWriter = new PrintWriter(socket.getOutputStream(), true);
            printWriter.println(request.getParameter("name") + ": " + request.getParameter("message"));
            socket.connect(new InetSocketAddress(InetAddress.getLocalHost(), 9999));
            Scanner scanner = new Scanner(socket.getInputStream());
            while (scanner.hasNextLine()){
                response.getWriter().write(scanner.nextLine());
                System.out.println(scanner.nextLine());
            }

            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF8");
            out.flush();

            request.getRequestDispatcher("board.jsp").forward(request,response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
