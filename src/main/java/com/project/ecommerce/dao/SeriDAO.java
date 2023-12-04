package com.project.ecommerce.dao;

import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.model.Seri;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class SeriDAO {
    public void UpdateStatusSeri(String productID, int orderDetaiID, int quantity) throws SQLException {
        DBConnect dBconnect = new DBConnect();
        Statement stm = dBconnect.getConnection().createStatement();
        String sql = String.format("UPDATE tOP(" + quantity + ") DBO.Seri SET STATUS = 1, Order_detailID=" + orderDetaiID + " WHERE STATUS=0 and productID='" + productID + "'");
        int result = stm.executeUpdate(sql);
    }

    public int insertSeri(String seri, String productID, int goodReceiptID) throws SQLException {
        DBConnect dBconnect = new DBConnect();
        Statement stm = dBconnect.getConnection().createStatement();
        String sql = String.format("insert into Seri(ID,ProductID,GoodReceipt_detailID,status) values(N'" + seri + "',N'" + productID + "'," + goodReceiptID + ", 0)");
        int result = stm.executeUpdate(sql);
        if (result > 0) {
            return 0;
        } else {
            return 1;
        }

    }

    public static List<Seri> listSeriByProductID(String idProduct) throws SQLException {

        DBConnect dBconnect = new DBConnect();

        Statement stm = dBconnect.getConnection().createStatement();
        List<Seri> listSeri = new ArrayList<>();
        String sqlString = String.format("select * from seri where productID='" + idProduct + "'");


        ResultSet rSet = stm.executeQuery(sqlString);
        while (rSet.next()) {
            Seri seri = new Seri(rSet.getString("id"), rSet.getString("productID"), rSet.getInt("GoodReceipt_detailID"), rSet.getInt("Order_detailID"), rSet.getInt("status"));
            listSeri.add(seri);

        }

        return listSeri;
    }

    public static List<Seri> listSeriByProductIDOrderID(String idProduct, int OrderDetailID) throws SQLException {

        DBConnect dBconnect = new DBConnect();
        ;
        Statement stm = dBconnect.getConnection().createStatement();
        List<Seri> listSeri = new ArrayList<>();
        String sqlString = String.format("select c.ID, c.ProductID,c.GoodReceipt_detailID, c.Order_detailID,c.status\r\n" +
                " from Order_detail a inner join Orders b on a.OrderID=b.ID \r\n" +
                " inner join Seri c on a.ID=c.Order_detailID where a.OrderID=" + OrderDetailID + " and c.ProductID='" + idProduct + "'");


        ResultSet rSet = stm.executeQuery(sqlString);
        while (rSet.next()) {
            Seri seri = new Seri(rSet.getString("id"), rSet.getString("productID"), rSet.getInt("GoodReceipt_detailID"), rSet.getInt("Order_detailID"), rSet.getInt("status"));
            listSeri.add(seri);

        }

        return listSeri;
    }
}
