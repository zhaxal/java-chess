package game;

public class King extends Piece {
    public King(int color, String pos) {
        super(color, pos);
    }

    @Override
    public boolean makeMove(String posFinal) {
        int finalX = xDecryptor(posFinal);  //getting position in x,y coordinates
        int finalY = yDecryptor(posFinal);

        if((finalX == x+1 && finalY == y+1) || (finalX == x && finalY == y+1) ||
                (finalX == x-1 && finalY == y+1) || (finalX == x+1 && finalY == y) ||       //king logic
                (finalX == x+1 && finalY == y-1) || (finalX == x-1 && finalY == y-1) ||
                (finalX == x && finalY == y-1) || (finalX == x-1 && finalY == y)){
            return true;
        }else{
            return false;
        }
    }
}
