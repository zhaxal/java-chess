import java.io.DataOutputStream;
import java.net.Socket;

public class ClientThread extends Thread{
    private String name;
    public ClientThread(String name){
        this.name = name;
    }
    @Override
    public void run() {
        try{

            Socket s=new Socket("localhost",6666);
            DataOutputStream dout=new DataOutputStream(s.getOutputStream());
            dout.writeUTF(name);
            dout.flush();
            dout.close();
            s.close();
        }catch(Exception e){System.out.println(e);}
    }
}
