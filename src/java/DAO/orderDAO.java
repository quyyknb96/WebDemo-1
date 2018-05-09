/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.ConnectDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import jxl.read.biff.BiffException;
import jxl.write.WriteException;
import model.BillStatistic;
import model.Orders;
import model.Users;
import plus.StringUtils;

/**
 *
 * @author QuyTaNgoc
 */
public class orderDAO {

    public int getOrderID(int userID, String date) throws SQLException {
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM orders WHERE user_id = '" + userID + "' AND date = '" + date + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            int i = -1;
            if (rs.next()) {
                i = rs.getInt("id");
            }
            connection.close();
            return i;
        }

    }

    public ArrayList<Orders> getFullList() throws SQLException {
        ArrayList<Orders> list;
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM orders";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                Orders order = new Orders();
                sql = "SELECT * FROM users WHERE id = '"+rs.getInt("user_id")+"'";
                ps = connection.prepareCall(sql);
                ResultSet rsx = ps.executeQuery();
                Users user = new Users();
                rsx.next();
                user.setFullname(rsx.getString("fullname"));
                user.setEmail(rsx.getString("email"));
                user.setUsername(rsx.getString("username"));
                user.setRole(rsx.getInt("role"));
                order.setUserId(user);
                order.setId(rs.getInt("id"));
                order.setStatus(rs.getString("status"));
                order.setDate(rs.getString("date"));
                order.setPhone(rs.getString("phone"));
                order.setTotalMoney(rs.getInt("total_money"));
                order.setAddress(rs.getString("address"));
                list.add(order);
            }
            connection.close();
        }
        return list;
    }

    public ArrayList<Orders> getListOrder(int userID) throws SQLException {
        ArrayList<Orders> list;
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM orders WHERE user_id = '" + userID + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                Orders order = new Orders();
                order.setId(rs.getInt("id"));
                order.setStatus(rs.getString("status"));
                order.setDate(rs.getString("date"));
                order.setPhone(rs.getString("phone"));
                order.setTotalMoney(rs.getInt("total_money"));
                order.setAddress(rs.getString("address"));
                list.add(order);
            }
            connection.close();
        }
        return list;
    }
    
    public Orders getOrder(int id) throws SQLException {
        
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM orders WHERE id = '" + id + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Orders order = new Orders();
                userDAO userDAO = new userDAO();
                Users user = userDAO.getUser(rs.getInt("user_id"));
                order.setUserId(user);
                order.setId(rs.getInt("id"));
                order.setStatus(rs.getString("status"));
                order.setDate(rs.getString("date"));
                order.setPhone(rs.getString("phone"));
                order.setTotalMoney(rs.getInt("total_money"));
                order.setAddress(rs.getString("address"));
                connection.close();
                return order;
            }            
        }
        return null;
    }

    public void insertOrder(Orders order) throws SQLException {
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "INSERT INTO orders (total_money, user_id, date, phone,address,status) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, order.getTotalMoney());
            ps.setInt(2, order.getUserId().getId());
            ps.setString(3, order.getDate());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getAddress());
            ps.setString(6, order.getStatus());
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateContact(Integer id, String phone, String address) throws SQLException {
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "UPDATE orders set phone = ?,address = ? WHERE id = '" + id + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, phone);
            ps.setString(2, address);
            ps.execute();
        }
    }

    public void rejectOrder(int id) throws SQLException {
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "UPDATE orders set status = ? WHERE id = '" + id + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            Date ct = new Date(System.currentTimeMillis());
            SimpleDateFormat timeFormat = new SimpleDateFormat(" 'lúc' dd/MM/yyyy hh:mm:ss a");
            String current_time = timeFormat.format(ct);
            ps.setString(1, "Đã hủy bỏ" + current_time);
            ps.execute();
            connection.close();
        }
    }
    public void acceptOrder(int id) throws SQLException {
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "UPDATE orders set status = ? WHERE id = '" + id + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            Date ct = new Date(System.currentTimeMillis());
            SimpleDateFormat timeFormat = new SimpleDateFormat(" 'lúc' dd/MM/yyyy hh:mm:ss a");
            String current_time = timeFormat.format(ct);
            ps.setString(1, "Đã chấp nhận" + current_time);
            ps.execute();
            connection.close();
        }
    }

    public int getTotalMonth(int month) throws SQLException, ParseException {
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM orders";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            int total = 0;
            while (rs.next()) {
                String date_string = rs.getString("date");
                SimpleDateFormat formatter = new SimpleDateFormat("E dd/MM/yyyy 'at' hh:mm:ss a");
                Date date = formatter.parse(date_string);
                Calendar dt = new GregorianCalendar();
                dt.setTime(date);
                int m = dt.get(Calendar.MONTH) + 1;
                if (month == m && StringUtils.removeAccent(rs.getString("status")).indexOf(StringUtils.removeAccent("đã chấp nhận")) != -1) {
                    total += rs.getInt("total_money");
                }
            }
            connection.close();
            return total;
        }
    }

    public ArrayList<BillStatistic> getBillStatistic_month(int year) throws SQLException, ParseException {
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM orders";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            orderDAO orderDAO = new orderDAO();
            ArrayList<BillStatistic> list = new ArrayList<>();
            for (int i = 0; i < 12; i++) {
                BillStatistic bs = new BillStatistic();
                bs.setDate((i + 1) + "-" + year);
                list.add(bs);
            }
            while (rs.next()) {
                String date_string = rs.getString("date");
                SimpleDateFormat formatter = new SimpleDateFormat("E dd/MM/yyyy 'at' hh:mm:ss a");
                Date date = formatter.parse(date_string);
                Calendar dt = new GregorianCalendar();
                dt.setTime(date);
                int y = dt.get(Calendar.YEAR);
                if (year == y && StringUtils.removeAccent(rs.getString("status")).indexOf(StringUtils.removeAccent("đã chấp nhận")) != -1) {
                    int m = dt.get(Calendar.MONTH);
                    list.get(m).setTotal_order(list.get(m).getTotal_order() + 1);
                    list.get(m).setTotal_quantity(list.get(m).getTotal_quantity() + rs.getInt("total_money"));
                    HashSet hs = list.get(m).getTotal_user();
                    hs.add(rs.getInt("user_id"));
                    list.get(m).setTotal_user(hs);
                }
            }
            connection.close();
            return list;
        }
    }

    public ArrayList<BillStatistic> getBillStatistic_week(int year, int month) throws SQLException, ParseException {
        try (Connection connection = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM orders";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            orderDAO orderDAO = new orderDAO();
            String date_string = Integer.toString(month) + "/" + Integer.toString(year);
            SimpleDateFormat formatter = new SimpleDateFormat("MM/yyyy");
            Date date = formatter.parse(date_string);
            Calendar dt = new GregorianCalendar();
            dt.setTime(date);
            ArrayList<BillStatistic> list = new ArrayList<>();
            for (int i = 0; i < dt.getActualMaximum(Calendar.DAY_OF_WEEK_IN_MONTH); i++) {
                BillStatistic bs = new BillStatistic();
                bs.setDate("Tuần " + (i + 1) + " " + month + "-" + year);
                list.add(bs);
            }
            while (rs.next()) {
                date_string = rs.getString("date");
                formatter = new SimpleDateFormat("E dd/MM/yyyy 'at' hh:mm:ss a");
                date = formatter.parse(date_string);
                dt = new GregorianCalendar();
                dt.setTime(date);
                int y = dt.get(Calendar.YEAR);
                int m = dt.get(Calendar.MONTH) + 1;
                if (year == y && month == m && StringUtils.removeAccent(rs.getString("status")).indexOf(StringUtils.removeAccent("đã chấp nhận")) != -1) {
                    list.get(dt.get(Calendar.DAY_OF_WEEK_IN_MONTH) - 1).setTotal_order(list.get(dt.get(Calendar.DAY_OF_WEEK_IN_MONTH) - 1).getTotal_order() + 1);
                    list.get(dt.get(Calendar.DAY_OF_WEEK_IN_MONTH) - 1).setTotal_quantity(list.get(dt.get(Calendar.DAY_OF_WEEK_IN_MONTH) - 1).getTotal_quantity() + rs.getInt("total_money"));
                    HashSet hs = list.get(dt.get(Calendar.DAY_OF_WEEK_IN_MONTH) - 1).getTotal_user();
                    hs.add(rs.getInt("user_id"));
                    list.get(dt.get(Calendar.DAY_OF_WEEK_IN_MONTH) - 1).setTotal_user(hs);
                }
            }
            connection.close();
            return list;
        }
    }

    public static void main(String[] args) throws SQLException, ParseException, IOException, BiffException, WriteException {
        orderDAO od = new orderDAO();
        String date_string = "12/2017";
        SimpleDateFormat formatter = new SimpleDateFormat("MM/yyyy");
        Date date = formatter.parse(date_string);
        Calendar dt = new GregorianCalendar();
        dt.setTime(date);
        System.out.println(dt.get(Calendar.MONTH));
    }
}
