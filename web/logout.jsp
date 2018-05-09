<%-- 
    Document   : logout
    Created on : Dec 10, 2017, 8:36:23 PM
    Author     : QuyTaNgoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đang chuyển trang ...</title>
        
    </head>
    <body>
        <script>
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                    console.log('User signed out.');
                });
        </script>
        <%
            session.invalidate();
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
    </body>
</html>
