/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.productDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Products;

/**
 *
 * @author QuyTaNgoc
 */
public class ProductServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            String command = request.getParameter("command");
            Products product = new Products();
            productDAO productDAO = new productDAO();
            switch (command) {
                case "add":
                    product.setName(request.getParameter("name"));
                    product.setAuthor(request.getParameter("author"));
                    product.setPrice(Integer.parseInt(request.getParameter("price")));
                    product.setStatus(request.getParameter("status"));
                    product.setPublisher(request.getParameter("publisher"));
                    product.setPublishingYear(request.getParameter("publishing_year"));
                    product.setDescription(request.getParameter("description"));
                    int categoryID = Integer.parseInt(request.getParameter("category_id"));
                    product.setImage("images/" + request.getParameter("image"));
                    productDAO.insertProduct(product, categoryID);
                    response.sendRedirect("admin/manager_product.jsp");
                    break;
                case "edit":
                    product.setId(Integer.parseInt(request.getParameter("id")));
                    product.setName(request.getParameter("name"));
                    product.setAuthor(request.getParameter("author"));
                    product.setPrice(Integer.parseInt(request.getParameter("price")));
                    product.setStatus(request.getParameter("status"));
                    product.setPublisher(request.getParameter("publisher"));
                    product.setPublishingYear(request.getParameter("publishing_year"));
                    product.setDescription(request.getParameter("description"));
                    categoryID = Integer.parseInt(request.getParameter("category_id"));
                    if ((request.getParameter("image")) != "") {
                        product.setImage("images/" + request.getParameter("image"));
                    }
                    productDAO.updateProduct(product, categoryID);
                    response.sendRedirect("admin/manager_product.jsp");
                    break;
                case "remove":
                    int id = Integer.parseInt(request.getParameter("id"));
                    productDAO.removeProduct(id);
                    response.sendRedirect("admin/manager_product.jsp");
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
