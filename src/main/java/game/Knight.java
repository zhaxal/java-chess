package game;

public class Knight extends Piece {
    public Knight(int color, String pos) {
        super(color, pos);
    }

    @Override
    public boolean makeMove(String posFinal) {
        int finalX = xDecryptor(posFinal);  //getting position in x,y coordinates
        int finalY = yDecryptor(posFinal);

        if(((finalY == y+2) && (finalX == x-1 || finalX == x+1)) || ((finalY == y-2) && (finalX == x-1 || finalX == x+1)) ||
                ((finalX == x+2) && (finalY == y-1 || finalY == y+1)) || ((finalX == x-2) && (finalY == y-1 || finalY == y+1))  //knight logic
        ){
            return true;
        }else{
            return false;
        }

    }
}
