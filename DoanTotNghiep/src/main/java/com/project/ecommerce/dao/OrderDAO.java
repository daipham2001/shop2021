package com.project.ecommerce.dao;

import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.model.Order;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class OrderDAO {
	public static void main(String[] args) {
		try {
			listOrderBystatus(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean insertOrder(int customerID, String create_date, int total, String address, String name,
			String time, String phone) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="INSERT INTO dbo.Orders(customerID, created_date, total, status, address, name, time, phone)\r\n" + 
				"VALUES ("+customerID+", '"+ create_date+"',"+total+",0 ,N'"+address+"', N'"+ name+"', N'"+time+"', N'"+phone+"')";
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
	public static int OrderbyID(String date, int customerID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		int idOrders=0;
		String sqlString = String.format("select *from Orders where customerID="+customerID+" and created_date='"+date+"'");
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			 idOrders= rSet.getInt("id");
		}
	return idOrders;
	}
	public static List<Order> listOrderBystatus(int i) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		List<Order> list = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		String sql= String.format("Select * from dbo.Orders where status="+i);
		ResultSet resultSet= statement.executeQuery(sql);
		
		while(resultSet.next()) {
			String beforeCreatedDate= resultSet.getString("created_date");
			String beforeCreatedDate2= resultSet.getString("time");
			Date afterCreatedDate = new Date();
			Date afterCreatedDate2 = new Date();
			 try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
				afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Order order= new Order(resultSet.getInt("id"),resultSet.getInt("customerID"),resultSet.getInt("employeeID"),afterFormat.format(afterCreatedDate),resultSet.getInt("total"),resultSet.getInt("status"),resultSet.getString("address"),resultSet.getString("name"),afterFormat.format(afterCreatedDate2),resultSet.getString("phone"),resultSet.getInt("shiperID"));
			list.add(order);
		}
		return list;
		
	}
	public static List<Order> listOrderByCustomer(int id,int status) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		List<Order> list = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		String sql= String.format("Select * from dbo.Orders where customerID="+id+" and status="+status);
		ResultSet resultSet= statement.executeQuery(sql);
		
		while(resultSet.next()) {
			String beforeCreatedDate= resultSet.getString("created_date");
			String beforeCreatedDate2= resultSet.getString("time");
			Date afterCreatedDate = new Date();
			Date afterCreatedDate2 = new Date();
			 try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
				afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Order order= new Order(resultSet.getInt("id"),resultSet.getInt("customerID"),resultSet.getInt("employeeID"),afterFormat.format(afterCreatedDate),resultSet.getInt("total"),resultSet.getInt("status"),resultSet.getString("address"),resultSet.getString("name"),afterFormat.format(afterCreatedDate2),resultSet.getString("phone"),resultSet.getInt("shiperID"));			
			list.add(order);
		}
		return list;
		
	}
	public boolean updateShipperOrder(int employeeID, int shipperID, int idOrder) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="Update dbo.Orders set employeeID="+employeeID+",status=1,shiperID="+shipperID+" where id="+idOrder;
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean updateOrderComplete(int idOrder) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="Update dbo.Orders set status=2 where id="+idOrder;
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
	public int countOrderByShipper(int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		int count=0;
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="select count(*) as count from Orders a inner join Employee b on a.shiperID=b.ID where a.status=1 and b.ID="+id;
		ResultSet resultSet=statement.executeQuery(sqlString);
		while(resultSet.next()) {
			count= resultSet.getInt("count");
		}
		return count;
	}
	public int countOrderDetailByCustomerID(int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		int count=0;
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="select count(*) as count from Order_detail a inner join Orders b on a.OrderID=b.ID where b.customerID="+id;
		ResultSet resultSet=statement.executeQuery(sqlString);
		while(resultSet.next()) {
			count= resultSet.getInt("count");
		}
		return count;
	}
}
