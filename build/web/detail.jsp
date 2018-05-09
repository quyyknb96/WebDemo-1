<%-- 
    Document   : detail
    Created on : Dec 11, 2017, 3:28:58 PM
    Author     : QuyTaNgoc
--%>

<%@page import="model.Cart"%>
<%@page import="model.Products"%>
<%@page import="DAO.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết mặt hàng</title>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bander.jsp"></jsp:include>
        </div>
        <div class="content">
        <%
            productDAO productDAO = new productDAO();
            Products product = productDAO.getProduct(Integer.parseInt(request.getParameter("productID")));
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>

        <div class="row product-summary">
            <div class="product-image">
                <img src="<%=product.getImage()%>">
            </div>
            <div class="product-cart">
                <div class="item-name">
                    <%=product.getName()%>
                </div>
                <div class="item-brand">
                    <p><strong>Tác giả :</strong> <%=product.getAuthor()%></p>
                    <p><strong>Nhà xuất bản :</strong> <%=product.getPublisher()%></p>
                    <p><strong>Năm xuất bản :</strong> <%=product.getPublishingYear()%></p>
                </div>
                <div class="item-decription">
                    <div>Mô tả:</div>
                    <textarea readonly><%=product.getDescription()%> </textarea>
                </div>
                <div class="item-prince">
                    <p><strong>Giá :</strong> <%=product.getPrice()%> đ</p>
                </div>
                <form action="CartServlet?command=plus" method="POST">
                    <input type="hidden" name="productID" value="<%=product.getId()%>">
                    <button class="btn" id="add-to-cart" type="submit">Thêm vào Giỏ hàng</button>
                </form>
            </div>
        </div>
                     <script src="https://apis.google.com/js/plusone.js"></script>
        
        <div id="comments-holder" style="margin-left: auto; margin-right: auto; width:90%"> 
            <div id="comments">
                
            </div>
        </div>
        
        <script>
            var yo = 'https://bookstoreptitdemo.blogspot.com/2018/04/' + window.location.href.split("/")[window.location.href.split("/").length - 1]
            gapi.comments.render('comments', {
                href: window.location,
                width: '735',
                first_party_property: 'BLOGGER',
                view_type: 'FILTERED_POSTMOD'
            });
        </script>

    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
