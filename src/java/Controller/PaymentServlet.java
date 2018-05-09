/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.orderDAO;
import DAO.orderdetailDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Orders;
import model.Users;

/**
 *
 * @author QuyTaNgoc
 */
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Date ct = new Date(System.currentTimeMillis());
            SimpleDateFormat timeFormat = new SimpleDateFormat("E dd/MM/yyyy 'at' hh:mm:ss a" );
            String current_time = timeFormat.format(ct);
            orderDAO orderDAO = new orderDAO();
            Orders order = new Orders();
            Users user = new Users();
            user = (Users) session.getAttribute("user");
            Cart cart = new Cart();
            cart = (Cart) session.getAttribute("cart");
            order.setTotalMoney(cart.totalCart());
            order.setUserId(user);
            order.setAddress(request.getParameter("address"));
            order.setPhone(request.getParameter("phone"));
            order.setDate(current_time);
            order.setStatus("Đang xử lý");
            orderDAO.insertOrder(order);
            int ID_order = orderDAO.getOrderID(user.getId(), current_time);
            orderdetailDAO orderdetailDAO = new orderdetailDAO();
            orderdetailDAO.insertOrder_detail(ID_order, cart);
            session.removeAttribute("cart");
            response.sendRedirect("trackorders.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
