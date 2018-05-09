/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package plus;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import model.BillStatistic;

/**
 *
 * @author QuyTaNgoc
 */
public class exportExcel {

    public static void bill_month(ArrayList<BillStatistic> list, int year,String myFile) throws IOException, BiffException, WriteException {
        WritableWorkbook workbook;
        workbook = Workbook.createWorkbook(new File(myFile));
        WritableSheet sheet = workbook.createSheet("Result", 0);
        sheet.addCell(new Label(0, 0, "Thống kê hóa đơn trong năm " + year));
        int rowBegin = 3;
        int colBegin = 0;
        sheet.addCell(new Label(0, 2, "Thời gian"));
        sheet.addCell(new Label(1, 2, "Tổng số hóa đơn"));
        sheet.addCell(new Label(2, 2, "Tổng số khách hàng"));
        sheet.addCell(new Label(3, 2, "Doanh thu"));
        for (int i = rowBegin; i < list.size() + rowBegin; i++) {
            sheet.addCell(new Label(0, i, list.get(i - rowBegin).getDate()));
            sheet.addCell(new jxl.write.Number(1, i, list.get(i - rowBegin).getTotal_order()));
            sheet.addCell(new jxl.write.Number(2, i, list.get(i - rowBegin).getTotal_user().size()));
            sheet.addCell(new jxl.write.Number(3, i, list.get(i - rowBegin).getTotal_quantity()));
        }
        // write file
        workbook.write();
        // close
        workbook.close();
    }
    
    public static void bill_week(ArrayList<BillStatistic> list, int year,int month,String myFile) throws IOException, BiffException, WriteException {
        WritableWorkbook workbook;
        workbook = Workbook.createWorkbook(new File(myFile));
        WritableSheet sheet = workbook.createSheet("Result", 0);
        sheet.addCell(new Label(0, 0, "Thống kê hóa đơn trong tháng "+month+"-"+ year));
        int rowBegin = 3;
        int colBegin = 0;
        sheet.addCell(new Label(0, 2, "Thời gian"));
        sheet.addCell(new Label(1, 2, "Tổng số hóa đơn"));
        sheet.addCell(new Label(2, 2, "Tổng số khách hàng"));
        sheet.addCell(new Label(3, 2, "Doanh thu"));
        for (int i = rowBegin; i < list.size() + rowBegin; i++) {
            sheet.addCell(new Label(0, i, list.get(i - rowBegin).getDate()));
            sheet.addCell(new jxl.write.Number(1, i, list.get(i - rowBegin).getTotal_order()));
            sheet.addCell(new jxl.write.Number(2, i, list.get(i - rowBegin).getTotal_user().size()));
            sheet.addCell(new jxl.write.Number(3, i, list.get(i - rowBegin).getTotal_quantity()));
        }
        // write file
        workbook.write();
        // close
        workbook.close();
    }

}
