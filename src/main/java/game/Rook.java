package game;

public class Rook extends Piece {
    public Rook(int color, String pos) {
        super(color, pos);
    }

    @Override
    public boolean makeMove(String posFinal) {
        int finalX = xDecryptor(posFinal);  //getting position in x,y coordinates
        int finalY = yDecryptor(posFinal);
        if((finalX > x && finalY == y) || (finalX < x && finalY == y) ||
                (finalX == x && finalY > y) || (finalX == x && finalY < y)){    //rook logic
            return true;
        }
        return false;
    }
}
