<%-- 
    Document   : Contact
    Created on : Dec 6, 2017, 3:32:46 PM
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

            <!-- Main -->
            <!--map-->
            <div id="map"></div>
            <script>
                function initMap() {
                    var mapDiv = document.getElementById('map');
                    var map = new google.maps.Map(mapDiv, {
                        center: {lat: 20.980931, lng: 105.787480},
                        zoom: 15
                    });
                }
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>
        </div>
        <!--form-->
        <div class="_contact">
            <div class="left_contact">
                <fieldset>
                    <legend>Thông tin liên hệ</legend>
                    <table>
                        <tr>
                            <td>Họ và tên<span> *</span></td>
                            <td><input type="textbox" name="hovaten" required></td>
                        </tr>
                        <tr>
                            <td>Email<span> *</span></td>
                            <td><input type="email" name="email" required></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ<span> *</span></td>
                            <td><input type="textbox" name="diachi" required></td>
                        </tr>
                        <tr>
                            <td>Điện thoại<span> *</span></td>
                            <td><input type="nummber" name="dienthoai" required></td>
                        </tr>
                        <tr>
                            <td>Thông tin thêm</td>
                            <td><textarea></textarea></td>
                        </tr>
                        <tr>
                            <td>Tiêu đề</td>
                            <td><input type="textbox" name="tieude"></td>
                        </tr>
                        <tr>
                            <td>Nội dung<span> *</span></td>
                            <td><textarea></textarea></td>
                        </tr>
                    </table>
                </fieldset> 
                <br>
                <button type="button" onclick="alert('Nội dung của bạn đã được gửi đến Bookstore. Xin cảm ơn!')">Gửi thông tin</button>
            </div>
            <div class="right_contact">
                <ul>
                    <li><img src="images/company.png"> Công ty BOOKSTORE</li>
                    <li><img src="images/home.png"> Địa chỉ : Km 10, Trần Phú, Hà Đông, Hà nội, Việt Nam</li>
                    <li><img src="images/phone.png"> Tel: (84-24)9 866 888</li>
                    <li><img src="images/fax.png"> Fax: (84-24)7 866 888</li>
                    <li><img src="images/email.png"> Email: bookstore.co@fpt.vn</li>
                </ul>
                <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fnhasachtiki%2F&tabs=timeline&width=400px&height=50&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="400px" height="200" style="border:none;overflow:hidden; margin: 0 50px;" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
            </div>
        </div> 
        <!-- End Main -->

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
