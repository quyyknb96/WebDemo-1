/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.productDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Products;

/**
 *
 * @author QuyTaNgoc
 */
public class CartServlet extends HttpServlet {

    private final productDAO productDAO = new productDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
       String command = request.getParameter("command");       
       Cart cart = (Cart) session.getAttribute("cart");
        try {            
            switch(command){
                case "plus":
                    int productID = Integer.parseInt(request.getParameter("productID"));
                    Products product = productDAO.getProduct(productID);
                    if (cart.getCartItems().containsKey(productID)){
                        cart.plusToCart(productID, new Item(product ,cart.getCartItems().get(productID).getQuantity()));
                        
                    }else{
                        cart.plusToCart(productID, new Item(product, 1));
                    }
                    break;
                case "sub":
                    Integer key = Integer.parseInt(request.getParameter("key"));
                    Item item = cart.getCartItems().get(key);
                    cart.subToCart(key, item);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }


}
