import java.io.DataInputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.Callable;

public class ServerThread implements Callable {


    @Override
    public Object call() throws Exception {
        String str = "";
        try{
            ServerSocket ss=new ServerSocket(6666);
            Socket s=ss.accept();//establishes connection

            DataInputStream dis=new DataInputStream(s.getInputStream());
            str=(String)dis.readUTF();
            System.out.println("message= "+str);

            ss.close();
        }catch(Exception e){
            System.out.println(e);
        }
        return str;
    }
}

