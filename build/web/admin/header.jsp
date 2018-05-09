<%-- 
    Document   : header
    Created on : Dec 19, 2017, 2:59:32 PM
    Author     : QuyTaNgoc
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="ADMIN.css" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    </head>
    <body>

        <%

            Users user = (Users) request.getSession().getAttribute("user");
        %>
        <div id="header">
            <div class="inHeader">
                <div class="mosAdmin">
                    Hello, <%=user.getFullname()%><br>
                    <a href="../user_detail.jsp">Cá nhân</a> | <a href="../logout.jsp">Thoát</a>
                </div>
                <div class="clear"></div>
            </div>
        </div> 

    </body>
</html>
