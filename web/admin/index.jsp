<%-- 
    Document   : index
    Created on : Dec 19, 2017, 3:03:02 PM
    Author     : QuyTaNgoc
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản trị</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>

    </head>
    <body>
        <%
            if (request.getSession().getAttribute("user") == null) {
        %>
        <div>
            <p>Bạn không có quyền truy cập trang web này</p>
            <p>Xin vui lòng quay lại <a href="../index.jsp">Trang chủ</a></p>
        </div>
        <%
        } else {
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

            <jsp:include page="content.jsp"></jsp:include>


            </div>
        <%
            }
        %>



    </body>
</html>