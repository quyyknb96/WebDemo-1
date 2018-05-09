<%-- 
    Document   : edit_product
    Created on : Dec 22, 2017, 8:48:03 AM
    Author     : QuyTaNgoc
--%>

<%@page import="model.Category"%>
<%@page import="DAO.categoryDAO"%>
<%@page import="model.Products"%>
<%@page import="DAO.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
            <%
                int id = 0;
                Products product = new Products();
                if (request.getParameter("id") != null) {
                    id = Integer.parseInt(request.getParameter("id"));
                    product = productDAO.getProduct(id);

                }
                categoryDAO categoryDAO = new categoryDAO();
                String mode = request.getParameter("mode");
                productDAO productDAO = new productDAO();

            %>

            <div id="rightContent">
                <form action="../ProductServlet" method="POST">
                    <input type="hidden" id="mode" name="command" value="<%=mode%>">
                    <div class="form-group">
                        <label for="id">ID:</label>
                        <input type="number" class="form-control" name="id" id="id" value="<%=product.getId()%>">
                    </div>
                    <div class="form-group">
                        <label for="image">Ảnh bìa</label>
                        <img id="img" src="<%out.print("../" + product.getImage());%>">
                        <input type="file" id="image" name="image" value="">
                    </div>
                    <div class="form-group">
                        <label for="name">Tên sách:</label>
                        <input type="text" class="form-control" name="name" id="name" value="<%=product.getName()%>">
                    </div>
                    <div class="form-group">
                        <label for="category">Thể loại</label>
                        <input type="text" class="form-control" name="categoryID" id="category" value="<%if (request.getParameter("id") != null) {out.print(product.getCategoryId().getCategoryName());}%>" >
                        <select class="custom-select" name="category_id">
                            <%
                                for (Category c : categoryDAO.getListCategory()) {
                            %>
                            <option value="<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>   
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="author">Tên tác giả:</label>
                        <input type="text" class="form-control" name="author" id="author" value="<%=product.getAuthor()%>">
                    </div>
                    <div class="form-group">
                        <label for="publisher">Nhà xuất bản:</label>
                        <input type="text" class="form-control" name="publisher" id="publisher" value="<%=product.getPublisher()%>"> 
                    </div>
                    <div class="form-group">
                        <label for="publishing_year">Năm xuất bản:</label>
                        <input type="text" class="form-control" name="publishing_year" id="publishing_year" value="<%=product.getPublishingYear()%>">
                    </div>
                    <div class="form-group">
                        <label for="price">Giá bán:</label>
                        <input type="text" class="form-control" name="price" id="price" value="<%=product.getPrice()%>">
                    </div>
                    <div class="form-group">
                        <label for="status">Trạng thái:</label>
                        <input type="text" class="form-control" name="status" id="status" value="<%=product.getStatus()%>">
                    </div>
                    <div class="form-group">
                        <label for="description">Mô tả:</label>
                        <textarea class="form-control" name="description" rows="5" id="description"><%=product.getDescription()%> </textarea>
                    </div>
                    <button type="submit" id="button" class="btn btn-default">Thêm</button>
                </form>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                let mode = $("#mode").val();
                if (mode === "read") {
                    //xem
                    $("#image").css("display", "none");
                    $("#image").prop("disabled", true);
                    $("#button").css("display", "none");
                    $(".custom-select").css("display", "none");
                    $("#rightContent form .form-group input").attr("readonly", true);
                    $("#rightContent form .form-group textarea").attr("readonly", true);
                } else {                    
                    if (mode === "add") {
                        //thêm
                        $("#rightContent #id").parent().css("display", "none");
                        $("#rightContent form .form-group input").val("");
                        $("#category").css("display", "none");
                    } else {
                        //sửa
                        $("#rightContent #id").attr("readonly",true);
                        $("#button").text("Cập nhật");
                        $("#category").css("display", "none");
                        let cate = $("#category").val();
                        let ind=0;
                        $(".custom-select option").each(function (){
                            if($(this).text() === cate){
                                ind = $(this).index();
                            }
                        });
                        $(".custom-select option").eq(ind).prop("selected",true);
                    }
                }
            });
        </script>
    </body>
</html>
