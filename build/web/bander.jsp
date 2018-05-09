<%-- 
    Document   : bander
    Created on : Dec 6, 2017, 10:31:50 AM
    Author     : QuyTaNgoc
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <div class="container">
            <!--thanh tiêu đề-->
            <div class="menu">
                <ul>
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li>|</li>
                    <li><a href="news.jsp">Tin tức</a></li>
                    <li>|</li>
                    <li><a href="sales.jsp">Khuyến mãi</a></li>
                    <li>|</li>
                    <li><a href="Contact.jsp">Liên hệ</a></li>
                        <%
                            if (request.getSession().getAttribute("user") != null) {
                                Users user = (Users) request.getSession().getAttribute("user");
                                if (user.getRole() > 1) {
                        %>
                    <li>|</li>
                    <li><a href="admin">Quản lý</a></li>
                        <%
                                }
                            }
                        %>
                </ul>
            </div>
    </body>
</html>
