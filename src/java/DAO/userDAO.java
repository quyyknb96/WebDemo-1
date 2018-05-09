/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.ConnectDB;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jxl.read.biff.BiffException;
import jxl.write.WriteException;
import model.Users;
import plus.MD5;
import plus.exportExcel;

/**
 *
 * @author QuyTaNgoc
 */
public class userDAO {

    public boolean checkEmail(String email) throws SQLException {
        if ("".equals(email)) {
            return true;
        }
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = '"+ email +"'";
            PreparedStatement ps;
            try {
                ps = connection.prepareCall(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    connection.close();
                    return true;
                }
            } catch (SQLException e) {
                Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }catch (SQLException e) {
                Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        return false;
    }
    
    public boolean checkUser(String user) throws SQLException{
        if ("".equals(user)) {
            return true;
        }
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = '"+user+"'";
            PreparedStatement ps;
            try {
                ps = connection.prepareCall(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    connection.close();
                    return true;
                }
            } catch (SQLException e) {
                Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return false;
    }
    
    public void insertUser(Users u) throws UnsupportedEncodingException{
        Connection connection = ConnectDB.getConnection();
        String sql = "INSERT INTO users(username, password, email, fullname) VALUES (?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getFullname());
            ps.executeUpdate();
            connection.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
  
    }
    
    public boolean updateUser(int id, String fullname,String old_password, String new_password, String re_new_password) 
            throws UnsupportedEncodingException, SQLException{
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM users WHERE id = '"+id+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Users user = new Users();
       if(rs.next()){
           sql = "UPDATE users SET fullname =? WHERE id = '"+id+"'";
           ps = connection.prepareCall(sql);
           ps.setString(1,fullname);
           ps.executeUpdate();
           if(old_password == "" && new_password == "" && re_new_password == ""){
               return true;
           }
           if((rs.getString("password") == null ? MD5.encryption(old_password) == null : rs.getString("password").equals(MD5.encryption(old_password)))
                   && (new_password == null ? re_new_password == null : new_password.equals(re_new_password)) ){
               sql ="UPDATE users SET password =? WHERE id = '"+id+"'";
               ps = connection.prepareCall(sql);
               ps.setString(1,MD5.encryption(new_password));
               ps.executeUpdate();
               return true;
           }else{
               return false;
           }

        }
       return true;
    }
    
    public Users checkLogin(String username, String password) throws SQLException{
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM users WHERE username='"+username+"' and password='"+password+"' ";
            PreparedStatement ps;
            try {
                ps = (PreparedStatement) connection.prepareCall(sql);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    Users u = new Users();
                    u.setId(rs.getInt("id"));
                    u.setUsername(rs.getString("username"));
                    u.setEmail(rs.getString("email"));
                    u.setRole(rs.getInt("role"));
                    u.setFullname(rs.getString("fullname"));
                    connection.close();
                    return u;
                }
            } catch (SQLException e) {
            }
        }
        return null;
    }
    
    public Users getUser(int id) throws SQLException{
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM users WHERE id = '"+id+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Users user = new Users();
        if(rs.next()){
            user.setId(rs.getInt("id"));
            user.setFullname(rs.getString("fullname"));
            user.setEmail(rs.getString("email"));
            user.setUsername(rs.getString("username"));
            user.setRole(rs.getInt("role"));
            return(user);
        }
        return null;
    }
    
    public Users getUserByUsername(String id) throws SQLException{
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM users WHERE username = '"+id+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Users user = new Users();
        if(rs.next()){
            user.setId(rs.getInt("id"));
            user.setFullname(rs.getString("fullname"));
            user.setEmail(rs.getString("email"));
            user.setUsername(rs.getString("username"));
            user.setRole(rs.getInt("role"));
            return(user);
        }
        return null;
    }
    
    public static void main(String args[]) throws SQLException, ParseException, IOException, BiffException, WriteException{
      orderDAO dao = new orderDAO(); 
        
   }
}
