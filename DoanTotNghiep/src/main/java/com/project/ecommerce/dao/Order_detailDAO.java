package com.project.ecommerce.dao;

import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.model.Order_detail;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class Order_detailDAO {
	public void insertOrder_detail(int orderID, String productID, int quantity, int price) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="INSERT INTO dbo.Order_detail(orderID, productID, quantity, price)\r\n" + 
				"VALUES ("+orderID+", '"+ productID+"',"+quantity+","+price+")";
		int rSet = statement.executeUpdate(sqlString);
		
	}
	public static int Order_detailbyID(int orderID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		int idOrder_detail=0;
		String sqlString = String.format("select *from Order_detail where OrderID="+orderID);
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			idOrder_detail= rSet.getInt("id");
		}
	return idOrder_detail;
	}
	public static List<Order_detail> listOrderDetailByOrderID(int orderID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Order_detail> list = new ArrayList<>();
		String sqlString = String.format("select *from Order_detail where OrderID="+orderID);
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Order_detail order_detail= new Order_detail(rSet.getInt("id"),rSet.getInt("orderID"),rSet.getString("ProductID"),rSet.getInt("quantity"),rSet.getInt("price"));
			list.add(order_detail);
		}
	return list;
	}
}
