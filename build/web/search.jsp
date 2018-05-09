<%-- 
    Document   : search
    Created on : Dec 7, 2017, 11:52:43 PM
    Author     : QuyTaNgoc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Products"%>
<%@page import="DAO.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm kiếm</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bander.jsp"></jsp:include>
        </div>
        <div class="content">
            <div>Kết quả tìm kiếm cho : <%=request.getParameter("query").replace("+", " ")%></div>
        <div class="products">
            <div class="book"></div>

            <%
                productDAO productsDAO = new productDAO();
                int id = Integer.parseInt(request.getParameter("categoryID"));
                ArrayList<Products> list = productsDAO.searchListProducts(id, request.getParameter("query"));
                int total_record = list.size();
                int curent_page = 1;
                int limit = 6;
                int total_page = (int) Math.ceil((float) total_record / limit);
                if (request.getParameter("pages") == null || Integer.parseInt(request.getParameter("pages")) < 1) {
                    curent_page = 1;
                } else {
                    if (request.getParameter("pages") != null && Integer.parseInt(request.getParameter("pages")) > total_page) {
                        curent_page = total_page;
                    } else {
                        curent_page = Integer.parseInt(request.getParameter("pages"));
                    }
                }
                int start = (curent_page - 1) * limit;
                if (total_record == 0) {
            %>
            <div>Không có kết quả tương ứng</div>
            <%
            } else {
                for (int i=start;i<Math.min(limit+start, total_record);i++) {
            %>
            <form action="detail.jsp" method="GET" class="product">
                <img src=<%=list.get(i).getImage()%>>
                <p><%=list.get(i).getName()%></p>
                <h5><%=list.get(i).getPrice()%> đ</h5>
                <input type="hidden" name="productID" value="<%=list.get(i).getId()%>" >
                <button type="submit" class="btn">Mua</button>
            </form>
            <%
                    }
                }
            %>
        </div>
        <div class="start">
            <%
                if (curent_page > 1 && total_page > 1) {
            %>
            <a href="search.jsp?categoryID=<%=request.getParameter("categoryID")%>&query=<%=request.getParameter("query") %>&pages=<%=curent_page - 1%>">Prev</a>
            <%
                }
            %>
            <%
                for (int i = 1; i <= total_page; i++) {
                    if (i == curent_page) {
            %>
            <span><%=i%></span>
            <%
            } else {
            %>
            <a href="search.jsp?categoryID=<%=request.getParameter("categoryID")%>&query=<%=request.getParameter("query") %>&pages=<%=i%>"><%=i%></a>
            <%
                    }
                }
            %>
            <%
                if (curent_page < total_page && total_page > 1) {
            %>
            <a href="search.jsp?categoryID=<%=request.getParameter("categoryID")%>&query=<%=request.getParameter("query") %>&pages=<%=curent_page + 1%>">Next</a>
            <%
                }
            %>
        </div>
    </div>


    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
