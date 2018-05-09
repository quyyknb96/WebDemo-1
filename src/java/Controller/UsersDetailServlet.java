/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.userDAO;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author QuyTaNgoc
 */
public class UsersDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            throws ServletException, IOException, UnsupportedEncodingException {
        try {
            request.setCharacterEncoding("UTF-8");
            String fullname = request.getParameter("fullname");
            String old_password = request.getParameter("old_password");
            String new_password = request.getParameter("new_password");
            String re_new_password = request.getParameter("re_new_password");
            int id = Integer.parseInt(request.getParameter("id"));
            
            userDAO dao = new userDAO();
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            user.setFullname(fullname);
            session.setAttribute("user", user);
            if (dao.updateUser(id, fullname, old_password, new_password, re_new_password)) {
                request.setAttribute("alert", "Cập nhật thành công");
                
            } else {
                request.setAttribute("alert", "Cập nhật không thành công. Xin bạn kiểm tra lại thông tin cập nhật!");
            }
            String url = "/user_detail.jsp";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UsersDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
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
