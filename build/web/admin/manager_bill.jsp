<%-- 
    Document   : manage_bill
    Created on : Dec 19, 2017, 3:47:33 PM
    Author     : QuyTaNgoc
--%>

<%@page import="model.Orders"%>
<%@page import="DAO.orderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hóa đơn</title>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
            <%
                orderDAO orderDAO = new orderDAO();
            %>
            <div id="rightContent">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Mã đơn hàng</th>
                            <th scope="col">Tên khách hàng</th>
                            <th scope="col">Ngày đặt hàng</th>
                            <th scope="col">Tổng số tiền</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Địa chỉ</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Orders order : orderDAO.getFullList()) {
                        %>
                        <tr>
                            <th scope="row"><%=order.getId()%></th>
                            <td><%=order.getUserId().getFullname()%></td>
                            <td><%=order.getDate()%></td>
                            <td><%=order.getTotalMoney()%></td>
                            <td><%=order.getPhone()%></td>
                            <td><%=order.getAddress()%></td>
                            <td><%=order.getStatus()%></td>
                            <td><a href="order_process.jsp?id=<%=order.getId()%>&name=<%=order.getUserId().getFullname()%>">Chi tiết</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

            </div>


        </div>
    </body>
</html>
