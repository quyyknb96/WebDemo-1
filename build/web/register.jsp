<%-- 
    Document   : register
    Created on : Dec 9, 2017, 12:12:45 AM
    Author     : QuyTaNgoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký thành viên</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bander.jsp"></jsp:include>
        </div>
        <div class="content">
        <%
            if (session.getAttribute("user") != null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
        %>

        <form action="UsersServlet" method="POST">
            <h2>Đăng ký thành viên</h2>
            <div>
                <p style="color: red;"><%
                    if (request.getAttribute("error") != null) {
                        out.print(request.getAttribute("error"));
                    }
                    %></p>

            </div>
            <div class="form-group">
                <label for="">Fullname</label>
                <input type="text" class="form-control" name="fullname" id="fullname"  placeholder="Enter your fullname">

            </div>
            <div class="form-group" style="margin-bottom: 25px;">
                <label for="">Username</label>
                <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your username">                
                <small id="usernameHelp" ></small>
            </div>
            <div class="form-group" style="margin-bottom: 25px;">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" name="email" id ="email" placeholder="Enter your email">                
                <p id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</p>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
            <input type="hidden" value="insert" name="command">
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript">
        $(document).ready(function () {
            var x_timer;
            $("#email").keyup(function (e) {
                clearTimeout(x_timer);
                var email = $(this).val();
                x_timer = setTimeout(function () {
                    check_email_ajax(email);
                }, 1000);
            });
            function check_email_ajax(email) {
                $("#emailHelp").html('<img src="img/ajax-loader.gif" />');
                $.post('CheckEmailServlet', {'email': email}, function (data) {
                    $("#emailHelp").html(data);
                });
            }
            $("#username").keyup(function (e) {
                clearTimeout(x_timer);
                var username = $(this).val();
                x_timer = setTimeout(function () {
                    check_username_ajax(username);
                }, 1000);
            });
            function check_username_ajax(username) {
                $("#usernameHelp").html('<img src="img/ajax-loader.gif" />');
                $.post('CheckUsernameServlet', {'username': username}, function (data) {
                    $("#usernameHelp").html(data);
                });
            }
        });
    </script>
</body>
</html>
