import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class Server implements Runnable{
    Socket socket;
    public Server(Socket socket){
        this.socket = socket;
    }

    @Override
    public void run() {
        try(Scanner scanner = new Scanner(socket.getInputStream());
            PrintWriter printWriter = new PrintWriter(socket.getOutputStream(), true)){

            if (scanner.hasNextLine()){
                String str = scanner.nextLine();
                printWriter.println(str);
            }
        } catch (IOException e){
            e.printStackTrace();
        }
    }
}
