/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.userDAO;
import java.io.IOException;
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
import plus.MD5;

/**
 *
 * @author QuyTaNgoc
 */
public class UsersServlet extends HttpServlet {

    userDAO userDAO = new userDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        String url = "";
        userDAO dao = new userDAO();
        Users user = new Users();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert": {
                try {
                    if (dao.checkEmail(request.getParameter("email")) || dao.checkEmail(request.getParameter("username"))) {
                        request.setAttribute("error", "Email or Username had been used. Please enter agian");
                        url = "/register.jsp";
                    } else {
                        user.setUsername(request.getParameter("username"));
                        user.setEmail(request.getParameter("email"));
                        user.setPassword(MD5.encryption(request.getParameter("password")));
                        user.setFullname(request.getParameter("fullname"));
                        userDAO.insertUser(user);
                        url = "/login.jsp";
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UsersServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;
            case "login": {
                try {
                    user = userDAO.checkLogin(request.getParameter("username"), MD5.encryption(request.getParameter("password")));
                } catch (SQLException ex) {
                    Logger.getLogger(UsersServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (user != null) {
                session.setAttribute("user", user);
                url = "/index.jsp";
            } else {
                request.setAttribute("error", "Error Username or Password");
                url = "/login.jsp";
            }
            break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
