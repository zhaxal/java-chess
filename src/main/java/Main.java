import game.*;

public class Main {
    public static void main(String[] args) {
        Piece pawn = new Pawn(0,"A1");
        Piece king = new King(0,"E6");
        Piece bishop = new Bishop(0,"H5");
        Piece rook = new Rook(0,"H2");
        System.out.println(rook.makeMove("H8"));
        System.out.println(rook.makeMove("A8"));


    }
}
