<%-- 
    Document   : statistic_bill
    Created on : Dec 19, 2017, 4:11:12 PM
    Author     : QuyTaNgoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">               
            <jsp:include page="menu.jsp"></jsp:include>
            <div id="rightContent">
                <div class="month">
                    <label>Thống kê theo tháng</label> <br>
                    <label>Nhập năm:</label>
                    <input type="text" id="year">
                    <button id="month" class="btn">Thống kê</button>
                    <form id="frm_month" style="display: none;" action="../DownloadFileServlet" method="POST">
                        <input type="hidden" name="filename" value="StatisticMonth.xls">
                        <button class="button" type="submit">Tải xuống</button>
                    </form>
                </div>
                <div class="week">
                    <label>Thống kê theo tuần</label> <br>
                    <label>Nhập năm: &nbsp;</label>
                    <input type="text" id="year"> <br>
                    <label>Nhập tháng:</label>
                    <input type="text" id="month">
                    <button id="week" class="btn">Thống kê</button>
                    <form id="frm_week" style="display: none;" action="../DownloadFileServlet" method="POST">
                        <input type="hidden" name="filename" value="StatisticWeek.xls">
                        <button type="submit">Tải xuống</button>
                    </form>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <script>
            $(document).ready(function () {
                $("#month").click(function () {
                    var year = $(this).parent().children("#year").val();
                    $(this).parent().children("#frm_month").css("display", "inline-block");
                    $.post('../OrderServlet', {year: year, command: 'statistic_month'}, function (data) {
                    });
                });
                $("#week").click(function () {
                    $(this).parent().children("#frm_week").css("display", "inline-block");
                    var year = $(this).parent().children("#year").val();
                    var month = $(this).parent().children("#month").val();
                    $.post('../OrderServlet', {year: year, month: month, command: 'statistic_week'}, function (data) {
                        
                    });
                });
            });
        </script>
    </body>
</html>
