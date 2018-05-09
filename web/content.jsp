<%-- 
    Document   : content
    Created on : Dec 6, 2017, 3:05:29 PM
    Author     : QuyTaNgoc
--%>

<%@page import="DAO.categoryDAO"%>
<%@page import="model.Category"%>
<%@page import="DAO.productDAO"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <!--slideshow-->
        <div class="slideshow">
            <div id="slide">
                <img src="images/top1.jpg" id="image">
                <div class="prev">
                    <p><</p>
                </div>
                <div class="next">
                    <p>></p>
                </div>
            </div>
        </div>
    </div>
    <!--danh mục sách-->

    <%
        categoryDAO categoryDAO = new categoryDAO();
        for (Category c : categoryDAO.getListCategory()) {
    %>

    <div class="products">
        <div class="book"><a target="_blank" href="product.jsp?categoryID=<%=c.getCategoryId()%>"> <%=c.getCategoryName()%> </a></div>
        <%            productDAO dao = new productDAO();
            for (int i = 0; i < Math.min(6, dao.getListProducts(c.getCategoryId()).size()); i++) {
        %>
        <form action="detail.jsp" method="GET" class="product">
            <img src=<%=dao.getListProducts(c.getCategoryId()).get(i).getImage()%>>
            <p><%=dao.getListProducts(c.getCategoryId()).get(i).getName()%></p>
            <h5><%=dao.getListProducts(c.getCategoryId()).get(i).getPrice()%> đ</h5>
            <input type="hidden" name="productID" value="<%=dao.getListProducts(c.getCategoryId()).get(i).getId()%>" >
            <button type="submit" class="btn">Mua</button>
        </form>
        <%
            }
        %>
        
    </div>

    <%
        }
    %>

</body>
</html>
