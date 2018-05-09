/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.orderdetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OrderDetails;

/**
 *
 * @author QuyTaNgoc
 */
public class CheckOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        response.setContentType("text/html;charset=UTF-8");
        orderdetailDAO dao = new orderdetailDAO();        
        try {
            PrintWriter out = response.getWriter();
            ArrayList<OrderDetails> list = dao.getListProducts(id);
            for (int i = 0; i < list.size(); i++) {                
                    out.println("<tr>");
                    out.println("<th scope='row'>");
                    out.print(list.get(i).getProductId().getId());
                    out.println("</th>");
                    out.println("<td>");
                    out.print(list.get(i).getProductId().getName());
                    out.println("</td>");
                    out.println("<td>");
                    out.print(list.get(i).getProductId().getPrice());
                    out.println("</td>");
                    out.println("<td>");
                    out.print(list.get(i).getQuantity());
                    out.println("</td>");
                    out.println("</tr>");                
            }          

        } catch (SQLException ex) {
            Logger.getLogger(CheckOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
