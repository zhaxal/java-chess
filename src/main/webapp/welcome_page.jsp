<%--
  Created by IntelliJ IDEA.
  User: dairalaev
  Date: 15.01.2021
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h2>Hello, grandmaster! Welcome to the chess game!</h2>
    <p>Type your name, preferable side and start playing!</p>
    <form method="post" action="GameServlet">
        <div class="form-group">
            <label for="username">Name:</label>
            <input type="text" class="form-control" name="username" id="username">

            <label class="radio-inline">
                <input type="radio" name="optradio" value="Black">Black
            </label>
            <label class="radio-inline">
                <input type="radio" name="optradio" value="White">White
            </label>

            <input type="submit" class="btn btn-success" value="Play">
        </div>
    </form>
</div>

</body>
</html>