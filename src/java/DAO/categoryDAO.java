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
import model.Category;


/**
 *
 * @author QuyTaNgoc
 */
public class categoryDAO {
    // lấy danh sách thể loại
    public ArrayList<Category> getListCategory() throws SQLException{
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while(rs.next()){
            Category category = new Category();
            category.setCategoryId(rs.getInt("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            list.add(category);
         }
        connection.close();
        return list;
    }
    // lấy danh sách thể loại qua ID
    public String getNameCategory(int category_id) throws SQLException{
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM category WHERE category_id = '"+category_id+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Category category = new Category();
        while(rs.next()){
            category.setCategoryName(rs.getString("category_name"));
        }
        connection.close();
        return category.getCategoryName();
    }
    
    public static void main(String[] args) throws SQLException {
        categoryDAO dao = new categoryDAO();
        System.out.println(dao.getNameCategory(3).hashCode());
    }
}
