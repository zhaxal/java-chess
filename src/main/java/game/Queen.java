package game;

import static java.lang.Math.abs;

public class Queen extends Piece {
    public Queen(int color, String pos) {
        super(color, pos);
    }

    @Override
    public boolean makeMove(String posFinal) {
        int finalX = xDecryptor(posFinal);  //getting position in x,y coordinates
        int finalY = yDecryptor(posFinal);
        if((abs(finalX - x) == abs(finalY - y)) || (finalX > x && finalY == y) || (finalX < x && finalY == y) ||
                (finalX == x && finalY > y) || (finalX == x && finalY < y)){            //queen logic
            return true;
        }
        return false;
    }
}
