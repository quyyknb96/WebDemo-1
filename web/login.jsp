<%-- 
    Document   : login
    Created on : Dec 9, 2017, 11:22:18 PM
    Author     : QuyTaNgoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
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
            <h2>Đăng nhập</h2>
            <div>
                <p style="color: red;"><%
                    if (request.getAttribute("error") != null) {
                        out.print(request.getAttribute("error"));
                    }
                    %></p>

            </div>
            <div class="form-group">
                <label for="">USERNAME</label>
                <input type="text" class="form-control" name="username" autocomplete="off" placeholder="Enter your username" >

            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">PASSWORD</label>
                <input type="password" class="form-control" name="password" autocomplete="off" placeholder="Password">
            </div>
            <div>
                <p>Bạn chưa có tài khoản, đến ngay với màn hình <a href="register.jsp">Đăng ký</a></p>
            </div>
                    <div class="row" style="margin: 0px;">
                        <span>Hoặc đăng nhập <a style="font-size: 18px; color: blue;" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://demoweb.com/demoWeb/login-google&response_type=code &client_id=253986303488-9d2474numbpmhfoflpmbr5on7tabortq.apps.googleusercontent.com&approval_prompt=force">ngay</a> với Google+</span>
                    </div>
                    <div class="row" style="margin: 0px;">
                        <span>Hoặc đăng nhập <a style="font-size: 18px; color: blue;" href="https://www.facebook.com/dialog/oauth?client_id=146224182894627&redirect_uri=https://demoweb.com/demoWeb/login-facebook">ngay</a> với Facebook</span>
                    </div>
            <input type="hidden" name="command" value="login">
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
                    
    </div>
                    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
