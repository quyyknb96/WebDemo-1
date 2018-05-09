<%-- 
    Document   : order_process
    Created on : Dec 21, 2017, 11:47:33 PM
    Author     : QuyTaNgoc
--%>

<%@page import="plus.StringUtils"%>
<%@page import="plus.StringUtils"%>
<%@page import="model.OrderDetails"%>
<%@page import="DAO.orderdetailDAO"%>
<%@page import="model.Orders"%>
<%@page import="DAO.orderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

            <%
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                orderDAO orderDAO = new orderDAO();
                Orders order = orderDAO.getOrder(id);
                orderdetailDAO orderdetailDAO = new orderdetailDAO();
                OrderDetails orderdetail = new OrderDetails();
            %>

            <div id="rightContent">
                <p>Tên khách hàng : <%=name%></p>
                <p>Thời gian đặt mua : <%=order.getDate()%></p>
                <p>Số điện thoại : <%=order.getPhone()%></p>
                <p>Địa chỉ : <%=order.getAddress()%></p>
                <div id="order_details">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Mã sản phẩm</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Số lượng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (OrderDetails od : orderdetailDAO.getListProducts(id)) {
                            %>
                            <tr>
                                <th scope="row"><%=od.getProductId().getId()%></th>
                                <td><%=od.getProductId().getName()%></td>
                                <td><%=od.getProductId().getPrice()%></td>
                                <td><%=od.getQuantity()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <%
                        if (StringUtils.removeAccent(order.getStatus()).indexOf(StringUtils.removeAccent("Đang xử lý")) != -1) {
                    %>
                    <form id="frm_rejectOrder" action="../OrderServlet" method="POST">
                        <input type="hidden" name="command" value="reject">
                        <input type="hidden" name="check" value="admin">
                        <input type="hidden" name="orderID" value="<%=id%>">
                        <button type="submit" class="btn-danger">Hủy đơn hàng</button>
                    </form>
                    <form id="frm_acceptOrder" action="../OrderServlet" method="POST">
                        <input type="hidden" name="command" value="accept">
                        <input type="hidden" name="orderID" value="<%=id%>">
                        <button type="submit" class="btn-danger">Nhận đơn hàng</button>
                    </form>
                    <%
                    } else {
                        if (StringUtils.removeAccent(order.getStatus()).indexOf(StringUtils.removeAccent("chấp nhận")) != -1) {
                    %>
                    <button> <a href="print_bill.jsp?id=<%=order.getId()%>" >In hóa đơn</a> </button>
                    <%
                            }
                        }
                    %>

                </div>


            </div>
    </body>
</html>
