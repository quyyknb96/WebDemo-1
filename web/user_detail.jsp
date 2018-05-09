<%-- 
    Document   : user_detail
    Created on : Dec 23, 2017, 3:16:31 PM
    Author     : QuyTaNgoc
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Cinzel|Open+Sans+Condensed:300" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <script type="text/javascript" src="js/layout.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bander.jsp"></jsp:include>
            
            <div class="content">
                 <p style="color: red;"><%
                    if (request.getAttribute("alert") != null) {
                        out.print(request.getAttribute("alert"));
                    }
                    %></p>
                <form id="form-user" action="UsersDetailServlet" method="POST">
                <%
                    Users user = new Users();
                    user = (Users) request.getSession().getAttribute("user");
                %>
                <legend>Thông tin tài khoản</legend>
                <div class="form-group">
                    <label for="fullname">Họ và tên</label>
                    <input type="fullname" class="form-control" name="fullname" id="fullname" value="<%=user.getFullname()%>">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" value="<%=user.getEmail()%>" disabled>
                </div>
                <div class="form-group">
                    <input type="hidden" name="id" value="<%=user.getId()%>">
                    <div class="input-wrap margin">
                        <label class="checkbox">
                            <input type="checkbox" name="is_change_pass" value="checked"> 
                            <span class="ico"></span> Thay đổi mật khẩu
                        </label>
                    </div>
                    <div class="password-group" style="display:none">
                        <div class="form-group">
                            <label class="control-label" for="old_password">Mật khẩu cũ</label>
                            <div class="input-wrap">
                                <input type="password" name="old_password" class="form-control" id="old_password" value="" autocomplete="off" placeholder="Nhập mật khẩu cũ">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="new-password">Mật khẩu mới</label>
                            <div class="input-wrap">
                                <input type="password" name="new_password" class="form-control" id="new_password" value="" autocomplete="off" placeholder="Mật khẩu từ 6 đến 32 ký tự">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="re_new_password">Nhập lại</label>
                            <div class="input-wrap">
                                <input type="password" name="re_new_password" class="form-control" id="re_new_password" value="" autocomplete="off" placeholder="Nhập lại mật khẩu mới">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
                $(document).ready(function () {
                    $('input[type="checkbox"]').click(function () {
                        if ($(this).is(":checked")) {
                            $(".password-group").css("display", "block");
                        } else if ($(this).is(":not(:checked)")) {
                            $(".password-group").css("display", "none");
                        }
                    });
                });
            </script>
</body>
</html>
