package game;

public abstract class Piece {
    private int color;
    private String pos; //position with letters "A1"

    public int x;
    public int y;

    public Piece(int color, String pos){
        this.color = color;
        this.pos = pos;
        this.x = xDecryptor(pos);
        this.y = yDecryptor(pos);
    }

    public abstract boolean makeMove(String posFinal);

    public int xDecryptor(String p){
        return (int) p.substring(0,1).charAt(0) - 65;
    }                                                    //methods that convert "A1" to y=0 x=0 for sake of convenience
    public int yDecryptor(String p){
        return Integer.parseInt(p.substring(1)) - 1;
    }





}
