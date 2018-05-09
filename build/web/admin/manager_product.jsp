<%-- 
    Document   : manager_product
    Created on : Dec 22, 2017, 8:13:17 AM
    Author     : QuyTaNgoc
--%>

<%@page import="DAO.productDAO"%>
<%@page import="model.Products"%>
<%@page import="DAO.orderDAO"%>
<%@page import="model.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

            <%
                Products product = new Products();
                productDAO productDAO = new productDAO();

            %>

            <div id="rightContent">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Mã sản phẩm</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Ảnh bìa</th>
                            <th scope="col">Nhà xuất bản</th>
                            <th scope="col">Năm xuất bản</th>
                            <th scope="col">Thể loại</th>
                            <th scope="col">Tác giả</th>
                            <th scope="col">Giá bán</th>
                            <th scope="col">Chức năng</th>
                        </tr>
                    </thead>
                    <%                        for (Products p : productDAO.getFullProduct()) {
                    %>
                    <tbody>
                        <tr>
                            <th scope="row"><%=p.getId()%></th>
                            <td><%=p.getName()%></td>
                            <td><img style="width: 100%;" src="<%out.print("../" + p.getImage());%>"></td>
                            <td><%=p.getPublisher()%> </td>
                            <td><%=p.getPublishingYear()%></td>
                            <td><%=p.getCategoryId().getCategoryName()%></td>
                            <td><%=p.getAuthor()%></td>
                            <td><%=p.getPrice()%></td>
                            <td>
                                <form action="edit_product.jsp" method="GET">                                    
                                    <input type="hidden" name="mode" value="add">
                                    <button class="btn btn-light" type="submit">Thêm</button>
                                </form>
                                <form action="edit_product.jsp" method="GET">
                                    <input type="hidden" name="id" value="<%=p.getId()%>" >
                                    <input type="hidden" name="mode" value="read">
                                    <button class="btn btn-light" type="submit">Xem</button>
                                </form>
                                <form action="edit_product.jsp" method="GET">
                                    <input type="hidden" name="id" value="<%=p.getId()%>" >
                                    <input type="hidden" name="mode" value="edit">
                                    <button class="btn btn-light" type="submit">Sửa</button>
                                </form>
                                    <form action="../ProductServlet" method="POST">
                                    <input type="hidden" name="command" value="remove" >
                                    <input type="hidden" name="id" value="<%=p.getId()%>" >
                                    <button class="btn btn-light" type="submit">Xóa</button>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                    <%
                        }
                    %>
                </table>
            </div>



        </div>
    </body>
</html>
