import game.*;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

@ServerEndpoint("/gameroom")
public class GameRoom {
    static Set<Session> players = Collections.synchronizedSet(new HashSet<Session>());
    @OnOpen
    public void handleOpen(Session userSession){
        players.add(userSession);
    }

    @OnMessage
    public void handleMove(String move) throws IOException {
        boolean possible = false;
        String piece = move.substring(0,1);
        String posInit = move.substring(1,3);
        String posFinal = move.substring(3,5);
        System.out.println(move.substring(5) +"kaef");
        int turn;
        if(move.substring(5).equals("White")){
            turn = 0;
        }else {
            turn = 1;
        }
        System.out.println(turn);

        System.out.println(posInit);
        System.out.println(posFinal);
        switch (piece){
            case "♖":
                Piece rookW = new Rook(0,posInit);
                possible = rookW.makeMove(posFinal);
                if (turn != rookW.color){
                    possible = false;
                }
                break;
            case "♜":
                Piece rookB = new Rook(1,posInit);
                possible = rookB.makeMove(posFinal);
                if (turn != rookB.color){
                    possible = false;
                }
                break;
            case "♘":
                Piece knightW = new Knight(0,posInit);
                possible = knightW.makeMove(posFinal);
                if (turn != knightW.color){
                    possible = false;
                }
                break;
            case "♞":
                Piece knightB = new Knight(1,posInit);
                possible = knightB.makeMove(posFinal);
                if (turn != knightB.color){
                    possible = false;
                }
                break;
            case "♗":
                Piece bishopW = new Bishop(0,posInit);
                possible = bishopW.makeMove(posFinal);
                if (turn != bishopW.color){
                    possible = false;
                }
                break;
            case "♝":
                Piece bishopB = new Bishop(1,posInit);
                possible = bishopB.makeMove(posFinal);
                if (turn != bishopB.color){
                    possible = false;
                }
                break;
            case "♕":
                Piece queenW = new Queen(0,posInit);
                possible = queenW.makeMove(posFinal);
                if (turn != queenW.color){
                    possible = false;
                }
                break;
            case "♛":
                Piece queenB = new Queen(1,posInit);
                possible = queenB.makeMove(posFinal);
                if (turn != queenB.color){
                    possible = false;
                }
                break;
            case "♔":
                Piece kingW = new King(0,posInit);
                possible = kingW.makeMove(posFinal);
                if (turn != kingW.color){
                    possible = false;
                }
                break;
            case "♚":
                Piece kingB = new King(1,posInit);
                possible = kingB.makeMove(posFinal);
                if (turn != kingB.color){
                    possible = false;
                }
                break;
            case "♙":
                Piece pawnW = new Pawn(0,posInit);
                possible = pawnW.makeMove(posFinal);
                if (turn != pawnW.color){
                    possible = false;
                }
                break;
            case "♟":
                Piece pawnB = new Pawn(1,posInit);
                possible = pawnB.makeMove(posFinal);
                if (turn != pawnB.color){
                    possible = false;
                }
                break;
        }


        if (possible) {
            ServerThread st = new ServerThread();
            ClientThread ct = new ClientThread(move);
            FutureTask message = new FutureTask<String>(st);
            Thread t = new Thread(message);
            t.start();
            ct.start();
            String d = "";
            try {
                d = (String) message.get();
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }


            d = d.substring(0, 5);
            System.out.println(d);

            Iterator<Session> iterator = players.iterator();
            while (iterator.hasNext()) iterator.next().getBasicRemote().sendText(moveJson(d));
        }
    }

    private String moveJson(String move){
        JsonObject jsonObject = Json.createObjectBuilder().add("message", move).build();
        StringWriter stringWriter = new StringWriter();
        try(JsonWriter jsonWriter = Json.createWriter(stringWriter)){jsonWriter.writeObject(jsonObject);}
        return stringWriter.toString();
    }

    @OnClose
    public void handleClose(Session userSession){
        players.remove(userSession);
    }




}
