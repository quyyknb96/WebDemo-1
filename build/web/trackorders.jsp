<%-- 
    Document   : trackorders
    Created on : Dec 14, 2017, 2:29:44 PM
    Author     : QuyTaNgoc
--%>

<%@page import="model.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Orders"%>
<%@page import="DAO.orderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <title>Theo dõi đơn hàng</title>
    </head>
    <body>
        <%
            if (request.getSession().getAttribute("user") == null) {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <%
        } else {
            orderDAO orderDAO = new orderDAO();
            Users user = (Users) request.getSession().getAttribute("user");
            ArrayList<Orders> list = orderDAO.getListOrder(user.getId());
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bander.jsp"></jsp:include>
        </div>
        <div class="content">
        <%
            if (list.size() == 0) {
        %>
        <div> Bạn chưa có đơn hàng nào đã đặt</div>
        <%
        } else {
        %>

        <table class="table table-hover">            
            <thead>
                <tr>
                    <th scope="col">Mã đơn hàng</th>
                    <th scope="col">Ngày đặt hàng</th>
                    <th scope="col">Số điện thoại liên hệ</th>
                    <th scope="col">Địa chỉ giao hàng</th>
                    <th scope="col">Trạng thái đơn hàng</th>
                </tr>
            </thead>        
            <%
                for (Orders l : list) {
            %>            
            <tbody>
                <tr>
                    <th scope="row"><%=l.getId()%></th>
                    <td><%=l.getDate()%></td>
                    <td><%=l.getPhone()%></td>
                    <td><%=l.getAddress()%></td>
                    <td><%=l.getStatus()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }
        %>
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

                </tbody>
            </table>
            <button class="btn-primary">Sửa thông tin liên lạc</button>
            <form id="frm_rejectOrder" action="OrderServlet" method="POST">
                <input type="hidden" name="command" value="reject">
                <input type="hidden" name="orderID" id="orderID">
                <button type="submit" class="btn-danger">Hủy đơn hàng</button>
            </form>

            <form id="frm_fixOrder" action="OrderServlet" method="POST">
                <div class="form-control">
                    <label class="col-form-label">Mã số đơn hàng</label>
                    <input class="form-control" id="orderID" name="orderID" type="text" value="Readonly input" readonly>
                </div>
                <div class="form-group">
                    <label class="col-form-label" >Số điện thoại liện hệ</label>
                    <input type="text" name="phone" id="phone" class="form-control">
                </div>
                <div class="form-group">
                    <label class="col-form-label" >Địa chỉ gia hàng</label>
                    <input type="text" name="address"id="address" class="form-control" >
                </div>
                <input type="hidden" name="command" value="update">
                <button type="submit">Lưu</button>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <%
        }
    %>
    <script>
        $(document).ready(function () {
            $(".content .table-hover tbody").click(function () {
                let id = $(this).children().children().eq(0).text();
                $("#order_details").css("display", "inline-block");
                $("#frm_fixOrder").css("display", "none");
                $.post('CheckOrderServlet', {'id': id}, function (data) {
                    $("#order_details .table-bordered tbody").html(data);
                });
                $("#frm_rejectOrder #orderID").val(id);
                $("#frm_fixOrder #orderID").val(id);
                $("#phone").val($(this).children().children().eq(2).text());
                $("#address").val($(this).children().children().eq(3).text());
                let status = $(this).children().children().eq(4).text();

                if (status !== "Đang xử lý") {
                    $("#order_details .btn-primary").css("display", "none");
                    $("#order_details #frm_rejectOrder").css("display", "none");
                } else {
                    $("#order_details .btn-primary").css("display", "inline-block");
                    $("#order_details #frm_rejectOrder").css("display", "inline-block");
                }
            });
            $("#order_details .btn-primary").click(function () {
                $("#frm_fixOrder").css("display", "block");
            });
        });
    </script>
</body>
</html>
