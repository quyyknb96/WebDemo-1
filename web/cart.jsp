<%-- 
    Document   : cart
    Created on : Dec 12, 2017, 1:13:45 AM
    Author     : QuyTaNgoc
--%>

<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bander.jsp"></jsp:include>
        </div>
        <div class="content">
        <%
            if (session.getAttribute("user") == null) {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <%
            }
        %>

        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null || cart.getCartItems().size() == 0) {
                cart = new Cart();
                session.setAttribute("cart", cart);
        %>
        <div>Hiện bạn chưa có mặt hàng nào trong Giỏ hàng</div>
        <%
        } else {
        %>
        <div>Bạn hiện có <%=cart.getCartItems().size()%> mặt hàng trong Giỏ hàng</div>
        <table class="table table-bordered mgleft">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Đơn giá</th>   
                    <th scope="col">Số lượng</th>                             
                </tr>
            </thead>
            <tbody>
                <%
                    Integer i = 1;
                    for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
                %>
                <tr>
                    <th scope="col"><%=i++%></th>
                    <td><%=list.getValue().getProduct().getName()%> &nbsp;&nbsp;&nbsp; <span>[<a href="CartServlet?command=sub&key=<%=list.getKey()%>">Xóa</a>]</span></td>
                    <td><%=list.getValue().getProduct().getPrice()%></td>
                    <td><%=list.getValue().getQuantity()%></td>                
                </tr>
                <%
                    }
                %>
                <tr>
                    <th scope="col" >Tổng cộng</th>
                    <td colspan="2"></td>
                    <td><%=cart.totalCart()%> đ</td>
                </tr>                
            </tbody>
        </table>
        <button  class="btn btn-primary mgleft" id="btn-check"> Thanh toán đơn hàng</button>
        <%
            }
        %>

        <form id="frm-payment" action="PaymentServlet" method="POST">
            <div class="form-group">
                <label>Số điện thoại liên hệ:</label>
                <input class="form-control" name="phone" type="text" required >
            </div>
            <div class="form-group">
                <label>Địa chỉ nhận hàng:</label>
                <input class="form-control" name="address" type="text" required>
            </div>
            <button type="submit" class="btn btn-primary">Thanh toán đơn hàng</button>
        </form>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
