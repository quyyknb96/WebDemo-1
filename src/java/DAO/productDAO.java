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
import model.Products;
import plus.StringUtils;

/**
 *
 * @author QuyTaNgoc
 */
public class productDAO {

    // lấy danh sách sản phẩm dựa vào mã danh mục
    public ArrayList<Products> getListProducts(int category_Id) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM products WHERE category_id = '" + category_Id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Products> list = new ArrayList<>();
        while (rs.next()) {
            Products product = new Products();
            Category category = new Category();
            sql = "SELECT * FROM category WHERE category_id = '" + rs.getInt("category_id") + "'";
            ps = connection.prepareCall(sql);
            ResultSet rsx = ps.executeQuery();
            rsx.next();
            category.setCategoryId(rsx.getInt("category_id"));
            category.setCategoryName(rsx.getString("category_name"));
            product.setCategoryId(category);
            product.setId(rs.getInt("id"));
            product.setImage(rs.getString("image"));
            product.setName(rs.getString("name"));
            product.setAuthor(rs.getString("author"));
            product.setPublisher(rs.getString("publisher"));
            product.setPublishingYear(rs.getString("publishing_year"));
            product.setPrice(rs.getInt("price"));
            product.setStatus(rs.getString("status"));
            product.setDescription(rs.getString("description"));
            list.add(product);
        }
        connection.close();
        return list;
    }

    public ArrayList<Products> getFullProduct() throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM products";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Products> list = new ArrayList<>();
        while (rs.next()) {
            Products product = new Products();
            Category category = new Category();
            sql = "SELECT * FROM category WHERE category_id = '" + rs.getInt("category_id") + "'";
            ps = connection.prepareCall(sql);
            ResultSet rsx = ps.executeQuery();
            rsx.next();
            category.setCategoryId(rsx.getInt("category_id"));
            category.setCategoryName(rsx.getString("category_name"));
            product.setCategoryId(category);
            product.setId(rs.getInt("id"));
            product.setImage(rs.getString("image"));
            product.setName(rs.getString("name"));
            product.setAuthor(rs.getString("author"));
            product.setPublisher(rs.getString("publisher"));
            product.setPublishingYear(rs.getString("publishing_year"));
            product.setPrice(rs.getInt("price"));
            product.setStatus(rs.getString("status"));
            product.setDescription(rs.getString("description"));
            list.add(product);
        }
        connection.close();
        return list;
    }

    //lấy sản phẩm theo ID
    public static Products getProduct(int productID) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM products WHERE id = '" + productID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Products product = new Products();
            Category category = new Category();
            sql = "SELECT * FROM category WHERE category_id = '" + rs.getInt("category_id") + "'";
            ps = connection.prepareCall(sql);
            ResultSet rsx = ps.executeQuery();
            rsx.next();
            category.setCategoryId(rsx.getInt("category_id"));
            category.setCategoryName(rsx.getString("category_name"));
            product.setCategoryId(category);
            product.setId(rs.getInt("id"));
            product.setImage(rs.getString("image"));
            product.setName(rs.getString("name"));
            product.setAuthor(rs.getString("author"));
            product.setPublisher(rs.getString("publisher"));
            product.setPublishingYear(rs.getString("publishing_year"));
            product.setPrice(rs.getInt("price"));
            product.setStatus(rs.getString("status"));
            product.setDescription(rs.getString("description"));
            connection.close();
            return product;
        }
        connection.close();
        return null;
    }

    public ArrayList<Products> searchListProducts(Integer categoryID, String query) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = new String();
        if (categoryID != 0) {
            sql = "SELECT * FROM products WHERE category_id = '" + categoryID + "'";
        } else {
            sql = "SELECT * FROM products";
        }
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Products> list = new ArrayList<>();
        String s = query.replace("+", " ");
        while (rs.next()) {
            if (StringUtils.removeAccent(rs.getString("name")).indexOf(StringUtils.removeAccent(s)) != -1) {
                Products product = new Products();
                Category category = new Category();
                sql = "SELECT * FROM category WHERE category_id = '" + rs.getInt("category_id") + "'";
                ps = connection.prepareCall(sql);
                ResultSet rsx = ps.executeQuery();
                rsx.next();
                category.setCategoryId(rsx.getInt("category_id"));
                category.setCategoryName(rsx.getString("category_name"));
                product.setCategoryId(category);
                product.setId(rs.getInt("id"));
                product.setImage(rs.getString("image"));
                product.setName(rs.getString("name"));
                product.setAuthor(rs.getString("author"));
                product.setPublisher(rs.getString("publisher"));
                product.setPublishingYear(rs.getString("publishing_year"));
                product.setPrice(rs.getInt("price"));
                product.setStatus(rs.getString("status"));
                product.setDescription(rs.getString("description"));
                list.add(product);
            }
        }
        connection.close();
        return list;
    }

    public void insertProduct(Products product, int categoryID) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "INSERT INTO products (image, name, author, publisher, publishing_year, price, status, description, category_id) VALUES (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setString(1, product.getImage());
        ps.setString(2, product.getName());
        ps.setString(3, product.getAuthor());
        ps.setString(4, product.getPublisher());
        ps.setString(5, product.getPublishingYear());
        ps.setInt(6, product.getPrice());
        ps.setString(7, product.getStatus());
        ps.setString(8, product.getDescription());
        ps.setInt(9, categoryID);
        ps.executeUpdate();
        connection.close();
    }
    public void updateProduct(Products product, int categoryID) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "UPDATE products SET name=?,author=?,publisher=?,publishing_year=?,price=?,status=?,description=?,category_id=? WHERE id = '"+product.getId()+"'";
        if(product.getImage() != null){
            sql = "UPDATE products SET name=?,author=?,publisher=?,publishing_year=?,price=?,status=?,description=?,category_id=?,image=? WHERE id = '"+product.getId()+"'";
        }
        PreparedStatement ps = connection.prepareCall(sql);
        if(product.getImage() != null){
            ps.setString(9, product.getImage());
        }
        ps.setString(1, product.getName());
        ps.setString(2, product.getAuthor());
        ps.setString(3, product.getPublisher());
        ps.setString(4, product.getPublishingYear());
        ps.setInt(5, product.getPrice());
        ps.setString(6, product.getStatus());
        ps.setString(7, product.getDescription());
        ps.setInt(8, categoryID);
        ps.execute();
        connection.close();
    }
    
    public void removeProduct(int id) throws SQLException{
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "DELETE FROM products WHERE id = '"+id+"'";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.execute();
        }
    }

    public static void main(String[] args) throws SQLException {
        productDAO dao = new productDAO();
        Products product = new Products();

    }

}
