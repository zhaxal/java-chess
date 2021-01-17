<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script>
        var selected = null;
        var posInitial = null;
        var turn = "White";
        var posFinal = null;
        var websocket = new WebSocket("ws://localhost:8080/chess_war_exploded/gameroom");
        var webchat = new WebSocket("ws://localhost:8080/chess_war_exploded/gamechat");
        var username = "<%=session.getAttribute("username")%>";
        webchat.onmessage = function processMessage (message){
            var jsonData = JSON.parse(message.data);
            if(jsonData.message != null) messagesTextArea.value += jsonData.message + "\n";
        }
        function sendMessage(){
            webchat.send(messageText.value);
            messageText.value = "";
        }
        function setUsername(){
            webchat.send(username);
        }
        websocket.onmessage = function processMove(message){
            var jsonData = JSON.parse(message.data)
            if(jsonData.message != null){
                if(turn === "Black"){
                    turn = "White";
                }else {
                    turn = "Black";
                }
                var posI = jsonData.message.substr(1,2);
                var posF = jsonData.message.substr(3);
                var piece = jsonData.message.substr(0,1);
                document.getElementById(posF).innerHTML = piece;
                document.getElementById(posI).innerHTML = "";
            }
        }
        $(document).ready(function(){
            $("button").click(function(){
                posInitial = $(this).attr("id");
                selected = document.getElementById(posInitial).innerHTML;
            });
        });
        $(document).ready(function(){
            $("td").click(function(){
                if ((posInitial !== $(this).attr("id").substr(2)) && selected !== ""){
                    posFinal = $(this).attr("id").substr(2);
                    websocket.send(selected+posInitial+posFinal+turn);
                    selected = "";
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
            font-weight      : bold            ;
        }
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
        var squareClass = "light"  ;
        //---------------------------------------------------------------------------------------------------------------------------
        function toggleSquareClass ()  { if ( squareClass == "light" ) { squareClass = "dark"  ; } else { squareClass = "light" ; } }
        function getNextCharacter     ( character )  { return String.fromCodePoint( character.codePointAt(0) + 1 ) ; }
        function getPreviousCharacter ( character )  { return String.fromCodePoint( character.codePointAt(0) - 1 ) ; }
        //---------------------------------------------------------------------------------------------------------------------------
    </script>

</head>
<body>
<h1 >Welcome, <%=session.getAttribute("username")%>!</h1>

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

<textarea id = "messagesTextArea" readonly = "readonly" rows="10" cols="45"></textarea><br/>
<form method="post" name="myform">
    <input id="messageText" type= "text" name="message" size="50"/><input id="somebutton" type="button" value="Send" onclick="sendMessage()"/>
    <input type="button" value="Connect" onclick="setUsername()"/>
</form>

<script>
    console.log("<%=session.getAttribute("color")%>");
    var color = "<%=session.getAttribute("color")%>";
    if (color == "White"){
        // for (var i = 8; i>6; i--){
        //     for (var j = "A"; j<"I"; j++){
        //         document.getElementById("td"+j+i).disabled = true;
        //         console.log("td"+j+i);
        //     }
        // }
        document.getElementById("A8").disabled = true;
        document.getElementById("B8").disabled = true;
        document.getElementById("C8").disabled = true;
        document.getElementById("D8").disabled = true;
        document.getElementById("E8").disabled = true;
        document.getElementById("F8").disabled = true;
        document.getElementById("G8").disabled = true;
        document.getElementById("H8").disabled = true;
        document.getElementById("A7").disabled = true;
        document.getElementById("B7").disabled = true;
        document.getElementById("C7").disabled = true;
        document.getElementById("D7").disabled = true;
        document.getElementById("E7").disabled = true;
        document.getElementById("F7").disabled = true;
        document.getElementById("G7").disabled = true;
        document.getElementById("H7").disabled = true;


    } else {
        // for (var i = 2; i>0; i--){
        //     for (var j = "A"; j<"I"; j++){
        //         document.getElementById("td"+j+i).disabled = true;
        //         console.log("td"+j+i);
        //     }
        // }
        document.getElementById("A2").disabled = true;
        document.getElementById("B2").disabled = true;
        document.getElementById("C2").disabled = true;
        document.getElementById("D2").disabled = true;
        document.getElementById("E2").disabled = true;
        document.getElementById("F2").disabled = true;
        document.getElementById("G2").disabled = true;
        document.getElementById("H2").disabled = true;
        document.getElementById("A1").disabled = true;
        document.getElementById("B1").disabled = true;
        document.getElementById("C1").disabled = true;
        document.getElementById("D1").disabled = true;
        document.getElementById("E1").disabled = true;
        document.getElementById("F1").disabled = true;
        document.getElementById("G1").disabled = true;
        document.getElementById("H1").disabled = true;
    }
</script>
</body>
</html>