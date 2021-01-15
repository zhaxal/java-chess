<%@ page import="game.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        var selected = null;
        var posInitial = null;
        var posFinal = null;

        $(document).ready(function(){
            $("button").click(function(){
                posInitial = $(this).attr("id");
                console.log(posInitial);
                selected = document.getElementById(posInitial).innerHTML;
                console.log(selected);
            });
        });


    </script>
    <script>
            $(document).ready(function(){
                $("td").click(function(){
                    if (posInitial !== $(this).attr("id").substr(2)){
                    posFinal = $(this).attr("id").substr(2);
                    document.getElementById(posFinal).innerHTML = selected;
                    document.getElementById(posInitial).innerHTML = "";
                    }
                });
            });

    </script>
    <title>Chess</title>

    <style>
        body  { text-align       : center          ; }
        table { margin-left      : auto            ;
            margin-right     : auto            ;
            border           : 2px solid Black ;
            border-collapse  : collapse        ;
            color            : Beige           ;
            background-color : Sienna          ;
            text-align       : center          ;
            font-family      : Tahoma          ;
            font-weight      : bold            ; }
        td    { width            : 50px            ;
            height           : 50px            ; }
        input { text-align       : center          ; }
        .light { background-color : Beige           ; color: black; }
        .dark  { background-color : BurlyWood       ; color: black; }
        .info1 { position         : fixed           ;
            top              : 20px            ;
            left             : 10px            ; }
        .info2 { position         : fixed           ;
            top              : 40px            ;
            left             : 10px            ;
            text-align       : left            ; }
        button {
            padding: 0;
            border: none;
            background: none;
            font-size: 30px}
    </style>

    <script>
        var numberlabel='8'; //variable for indicating digit index of board cell
        var letterlabel = "A"; //variable for indicating digit index of board cell
        //---------------------------------------------------------------------------------------------------------------------------
        var turn        = "White"  ;
        var squareClass = "light"  ;
        //---------------------------------------------------------------------------------------------------------------------------
        function toggleTurn        ()  { if ( turn        == "White" ) { turn        = "Black" ; } else { turn        = "White" ; } }
        function toggleSquareClass ()  { if ( squareClass == "light" ) { squareClass = "dark"  ; } else { squareClass = "light" ; } }
        function getNextCharacter     ( character )  { return String.fromCodePoint( character.codePointAt(0) + 1 ) ; }
        function getPreviousCharacter ( character )  { return String.fromCodePoint( character.codePointAt(0) - 1 ) ; }
        //---------------------------------------------------------------------------------------------------------------------------
    </script>

    <%
        Piece pawnB1 = new Pawn(1,"A7");
        Piece pawnB2 = new Pawn(1,"B7");
        Piece pawnB3 = new Pawn(1,"C7");
        Piece pawnB4 = new Pawn(1,"D7");
        Piece pawnB5 = new Pawn(1,"E7");
        Piece pawnB6 = new Pawn(1,"F7");
        Piece pawnB7 = new Pawn(1,"G7");
        Piece pawnB8 = new Pawn(1,"H7");

        Piece rookB1 = new Rook(1,"A8");
        Piece rookB2 = new Rook(1,"H8");
        Piece knightB1 = new Knight(1,"B8");
        Piece knightB2 = new Knight(1,"G8");
        Piece bishopB1 = new Bishop(1,"C8");
        Piece bishopB2 = new Bishop(1,"F8");
        Piece queenB = new Queen(1,"D8");
        Piece kingB = new King(1,"E8");

        Piece rookW1 = new Rook(0,"A1");
        Piece rookW2 = new Rook(0,"H1");
        Piece knightW1 = new Knight(0,"B1");
        Piece knightW2 = new Knight(0,"G1");
        Piece bishopW1 = new Bishop(0,"C1");
        Piece bishopW2 = new Bishop(0,"F1");
        Piece queenW = new Queen(0,"D1");
        Piece kingW = new King(0,"E1");

        Piece pawnW1 = new Pawn(0,"A2");
        Piece pawnW2 = new Pawn(0,"B2");
        Piece pawnW3 = new Pawn(0,"C2");
        Piece pawnW4 = new Pawn(0,"D2");
        Piece pawnW5 = new Pawn(0,"E2");
        Piece pawnW6 = new Pawn(0,"F2");
        Piece pawnW7 = new Pawn(0,"G2");
        Piece pawnW8 = new Pawn(0,"H2");


    %>

</head>
<body>

<br>
<table>
    <tr>
        <td> </td>
        <td>A</td>
        <td>B</td>
        <td>C</td>
        <td>D</td>
        <td>E</td>
        <td>F</td>
        <td>G</td>
        <td>H</td>
        <td> </td>
    </tr>

    <script>
        for (var row = 1;row <= 8;row++) //loop which goes from very first row of board to the last not including rows with letters
        {
            document.write("<tr>"); //starting row tag
            letterlabel = "A"; //this variable is responsible to be set for "A" value as every row our inner loop will go from "A" to "H"
            for (var column = 1;column <= 10;column++) //inner loop for going through all columns in a row
            {
                if (column == 1 || column == 10) //checking if it is column for displaying number label of a row
                {
                    document.write("<td>" + numberlabel + "</td>"); //setting cell with number label
                }
                else
                {
                    document.write("<td id=\""+ "td" + letterlabel + numberlabel + "\" class=" + squareClass + "><button id=\"" + letterlabel + numberlabel + "\"> </button></td>"); //setting cell with id corresponding for current cell position, generated by letterlabel and numberlabel
                    if (row == 2) //checking if it is row for black pawns
                    {
                        document.getElementById(letterlabel + numberlabel).innerHTML = "♟"; //setting black pawn images for cell ID generated by letterlable and numberlabel of current cell
                    }
                    else if (row == 7) //checking if it is row for white pawns
                    {
                        document.getElementById(letterlabel + numberlabel).innerHTML = "♙"; //setting white pawn images for cell ID generated by letterlable and numberlabel of current cell
                    }
                    toggleSquareClass(); //changing style (background) of cell for the next one
                    letterlabel = getNextCharacter(letterlabel); //replacing current letter label for the next one in alphabet
                }
            }
            numberlabel=getPreviousCharacter(numberlabel); //replacing current digit label for the next one
            document.write("</tr>"); //closing row tag
            toggleSquareClass(); //changing style (background) of cell for the next one, so board will get needed pattern
        }
        //code for setting other figures using IDs we just set up
        document.getElementById("A1").innerHTML = "♖";
        document.getElementById("B1").innerHTML = "♘";
        document.getElementById("C1").innerHTML = "♗";
        document.getElementById("D1").innerHTML = "♕";
        document.getElementById("E1").innerHTML = "♔";
        document.getElementById("F1").innerHTML = "♗";
        document.getElementById("G1").innerHTML = "♘";
        document.getElementById("H1").innerHTML = "♖";
        document.getElementById("A8").innerHTML = "♜";
        document.getElementById("B8").innerHTML = "♞";
        document.getElementById("C8").innerHTML = "♝";
        document.getElementById("D8").innerHTML = "♛";
        document.getElementById("E8").innerHTML = "♚";
        document.getElementById("F8").innerHTML = "♝";
        document.getElementById("G8").innerHTML = "♞";
        document.getElementById("H8").innerHTML = "♜";


    </script>


    <tr>
        <td> </td>
        <td>A</td>
        <td>B</td>
        <td>C</td>
        <td>D</td>
        <td>E</td>
        <td>F</td>
        <td>G</td>
        <td>H</td>
        <td> </td>
    </tr>
</table>



</body>
</html>
