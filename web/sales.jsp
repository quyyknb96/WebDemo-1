<%-- 
    Document   : sales
    Created on : Dec 6, 2017, 3:29:13 PM
    Author     : QuyTaNgoc
--%>

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
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bander.jsp"></jsp:include>

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
        <!--Sales-->
        <div class="books_sales">
            <div id="list_books">Khuyến Mãi</div>
            <div class="product_sales">
                <img src="images/t1.jpg">
                <p>Đừng Coi Ai Đó Là Cả Thế Giới</p>
                <h5>52.500 đ<span class="price_regular"> 75.000 đ</span><span class="sale_tag">-30%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/t4.jpg">
                <p>Đắc Nhân Tâm</p>
                <h5>45.600 đ<span class="price_regular"> 76.000 đ</span><span class="sale_tag">-40%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/t5.jpg">
                <p>Cà Phê Cùng Tony</p>
                <h5>60.000 đ<span class="price_regular"> 85.000 đ</span><span class="sale_tag">-29%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>

            <div class="product_sales">
                <img src="images/n1.jpg">
                <p>The Complete Sherlock Holmes (2 Volumes)</p>
                <h5>197.000 đ<span class="price_regular"> 327.000 đ</span><span class="sale_tag">-40%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/n2.jpg">
                <p>Me Before You</p>
                <h5>139.000 đ<span class="price_regular"> 235.000 đ</span><span class="sale_tag">-41%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/n3.jpg">
                <p>Life Of Pi (Mass Market Paperback)</p>
                <h5>149.000 đ<span class="price_regular"> 211.000 đ</span><span class="sale_tag">-29%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/n4.jpg">
                <p>The Choice</p>
                <h5>133.000 đ<span class="price_regular"> 188.000 đ</span><span class="sale_tag">-29%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/n5.jpg">
                <p>A GAME OF THRONES - 7 Volumes (Paperback)</p>
                <h5>1.229.000 ₫<span class="price_regular"> 2.048.000 đ</span><span class="sale_tag">-40%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/e2.jpg">
                <p>Cẩm Nang Việc Làm</p>
                <h5>55.000 ₫<span class="price_regular"> 79.000 đ</span><span class="sale_tag">-30%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/e3.jpg">
                <p>Câu Chuyện Do Thái</p>
                <h5>76.000 ₫<span class="price_regular"> 109.000 đ</span><span class="sale_tag">-30%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/e4.jpg">
                <p>Đắc Nhân Tâm</p>
                <h5>44.500 ₫<span class="price_regular"> 60.000 đ</span><span class="sale_tag">-35%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
            <div class="product_sales">
                <img src="images/e5.jpg">
                <p>Góc Nhìn Của Người Thông Thái</p>
                <h5>42.000 ₫<span class="price_regular"> 63.000 đ</span><span class="sale_tag">-31%</span></h5>
                <a href="#" class="btn">Mua</a>
            </div>
        </div>
    </div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
