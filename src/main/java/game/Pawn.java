package game;

public class Pawn extends Piece {
    public Pawn(int color, String pos) {
        super(color, pos);
    }

    @Override
    public boolean makeMove(String posFinal) {
        int finalX = xDecryptor(posFinal);  //getting position in x,y coordinates
        int finalY = yDecryptor(posFinal);

        if (finalX == x && finalY <= y+2){  //pawn logic
            return true;
        }else {
            return false;
        }
    }
}
