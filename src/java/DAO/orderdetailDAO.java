/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import model.Cart;
import model.Item;
import model.OrderDetails;
import model.Products;

/**
 *
 * @author QuyTaNgoc
 */
public class orderdetailDAO {

    public ArrayList<OrderDetails> getListProducts(int id) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM order_details WHERE order_id = '" + id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<OrderDetails> list = new ArrayList<>();
        while(rs.next()){
            OrderDetails od = new OrderDetails();
            productDAO dao = new productDAO();
            od.setQuantity(rs.getInt("quantity"));
            od.setProductId(dao.getProduct(rs.getInt("product_id")));
            list.add(od);
        }
        return list;
    }

    public void insertOrder_detail(int orderID, Cart cart) throws SQLException {
        Connection connection = ConnectDB.getConnection();
            String sql = "INSERT INTO order_details (order_id,product_id,quantity) VALUES (?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, orderID);
            for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
                ps.setInt(2, list.getValue().getProduct().getId());
                ps.setInt(3, list.getValue().getQuantity());
                ps.executeUpdate();
            }
        connection.close();
    }
    
    public static void main(String[] args) throws SQLException {
        orderdetailDAO dao = new orderdetailDAO();
        ArrayList<OrderDetails> list = dao.getListProducts(1);
        
            System.out.println(list.get(0).getProductId().getId()+" "+list.get(0).getProductId().getName()+" "+list.get(0).getQuantity());
        
    }

}
