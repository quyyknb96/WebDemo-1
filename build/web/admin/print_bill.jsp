<%-- 
    Document   : print_bill
    Created on : Dec 22, 2017, 11:15:52 PM
    Author     : QuyTaNgoc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.OrderDetails"%>
<%@page import="model.Orders"%>
<%@page import="DAO.orderdetailDAO"%>
<%@page import="DAO.orderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookstore</title>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css?family=Cinzel|Open+Sans+Condensed:300" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <script type="text/javascript" src="js/layout.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <style>
            .container{
                border: 1px solid #660000;
                margin: 10px auto;
                padding-right: 5px;
            }
            h1{
                text-align: center;
                color: red;
            }
            table tr th{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            orderDAO orderDAO = new orderDAO();
            orderdetailDAO odDAO = new orderdetailDAO();
            Orders order = orderDAO.getOrder(id);
            ArrayList<OrderDetails> list = odDAO.getListProducts(id);
        %>
        <div class="container">
            <form class="form-horizontal">
                <h1>BOOKSTORE</h1>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fullname">Tên khách hàng:</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control" id="fullname" value="<%=order.getUserId().getFullname()%>">
                    </div>

                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="phone">Ngày đặt hàng:</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control" id="day" value="<%=order.getDate()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="phone">Điện thoại:</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control" id="phone" value="<%=order.getPhone()%>">
                    </div>
                </div>                    
                <div class="form-group">
                    <label class="control-label col-sm-2" for="address">Địa chỉ:</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control" id="address" value="<%=order.getAddress()%>">
                    </div>
                </div>
                <table style="width: 100%;" class="table table-bordered">
                    <thead>
                        <tr >
                            <th scope="col">Mã Sách</th>
                            <th scope="col">Tên Sách</th>
                            <th scope="col">Số lượng</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            for (OrderDetails od : list) {
                        %>
                        <tr>
                            <th scope="row"><%=od.getProductId().getId()%></th>
                            <td><%=od.getProductId().getName()%></td>
                            <td><%=od.getQuantity()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <div class="form-group" >
                    <label class="control-label col-sm-2" for="total">Tổng tiền:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="total" value="<%=order.getTotalMoney()%>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="address">Thời gian xuất hóa đơn:</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control" id="day" value="<%
                               Date date = new Date(System.currentTimeMillis());
                               SimpleDateFormat timeFormat = new SimpleDateFormat("E dd/MM/yyyy 'at' hh:mm:ss a" );
                               String current_time = timeFormat.format(date);
                               out.print(current_time);
                               %>">
                    </div>
                </div>
            </form>
                    <center><button class="btn" onclick="$(this).css('display','none');window.print();">In hóa đơn</button></center>
        </div>
    </body>
</html>

