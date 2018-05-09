/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.orderDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.read.biff.BiffException;
import jxl.write.WriteException;
import plus.exportExcel;

/**
 *
 * @author QuyTaNgoc
 */
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            String command = request.getParameter("command");
            orderDAO orderDAO = new orderDAO();
            switch (command) {
                case "update":
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");
                    String id = request.getParameter("orderID");
                    orderDAO.updateContact(Integer.parseInt(id), phone, address);
                    response.sendRedirect("trackorders.jsp");
                    break;
                case "reject":
                    int orderID = Integer.parseInt(request.getParameter("orderID"));
                    orderDAO.rejectOrder(orderID);
                    if (request.getParameter("check") != null) {
                        response.sendRedirect("admin/manager_bill.jsp");
                    } else {
                        response.sendRedirect("trackorders.jsp");
                    }
                    break;
                case "bill_month":
                    int month = Integer.parseInt(request.getParameter("month"));
                    ArrayList<Integer> list = new ArrayList<>();
                    for (int i = 1; i <= month; i++) {
                        int total = orderDAO.getTotalMonth(i);
                        list.add(total);
                    }
                    String m = list.toString();
                    response.getWriter().write(m);
                    break;
                case "statistic_month":
                    // Đường dẫn tuyệt đối tới thư mục gốc của web app.
                    String appPath = request.getServletContext().getRealPath("");
                    appPath = appPath.replace('\\', '/');
                    appPath = appPath + "StatisticMonth.xls";
                    int year = Integer.parseInt(request.getParameter("year"));
                    exportExcel.bill_month(orderDAO.getBillStatistic_month(year), year, appPath);
                    response.getWriter().write(appPath);
                    break;
                case "statistic_week":
                    String file = request.getServletContext().getRealPath("");
                    file = file.replace('\\', '/');
                    file = file + "StatisticWeek.xls";
                    int mo = Integer.parseInt(request.getParameter("month"));
                    int ye = Integer.parseInt(request.getParameter("year"));
                    exportExcel.bill_week(orderDAO.getBillStatistic_week(ye, mo), ye, mo, file);
                    response.getWriter().write(file);
                    break;
                case "accept":
                    int ID = Integer.parseInt(request.getParameter("orderID"));
                    orderDAO.acceptOrder(ID);
                    response.sendRedirect("admin/manager_bill.jsp");
                    break;
                    
            }
        } catch (SQLException | ParseException | BiffException | WriteException ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
