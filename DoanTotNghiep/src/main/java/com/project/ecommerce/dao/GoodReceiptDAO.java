package com.project.ecommerce.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.model.GoodReceipt;
import com.sun.org.apache.bcel.internal.generic.Select;


public class GoodReceiptDAO {
	public static List<GoodReceipt> listGoodReceipts() throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<GoodReceipt> listGoodReceipts = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
	
		String sqlString = String.format("select * from GoodReceipt");

	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			String beforeCreatedDate= rSet.getString("created_date");
			Date afterCreatedDate = new Date();
			 try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			GoodReceipt goodReceipt = new GoodReceipt(rSet.getInt("id"),rSet.getInt("employeeID"),afterFormat.format(afterCreatedDate),rSet.getInt("total"));
			listGoodReceipts.add(goodReceipt);

		}
		return listGoodReceipts;
	}
	public int insertGoodReceipt(int id, String time) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql=String.format("select * from GoodReceipt where employeeID="+id+" and created_date='"+time+"'");
		ResultSet resultSet= statement.executeQuery(sql);
		while(resultSet.next()) {
			return 1;
		}
		String sqlString="INSERT INTO dbo.GoodReceipt(employeeID, created_date, total)\r\n" + 
				"VALUES ("+id+", '"+ time+"',0)";
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return 0;
		} else {
			return 2;
		}
	}
	public boolean deleteGoodReceipt(int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql=String.format("delete from GoodReceipt where id="+id);
		int rSet = statement.executeUpdate(sql);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean updateGoodReceipt(int id,int total) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="UPDATE dbo.GoodReceipt set total= total+"+total+ " where id="+ id;
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}

public static GoodReceipt goodReceiptById(int id) throws SQLException {
	DBConnect dBconnect=new DBConnect();
	Statement stm = dBconnect.getConnection().createStatement();
	SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");

	GoodReceipt goodReceipt= new GoodReceipt();
	String sqlString = String.format("select * from GoodReceipt where ID="+id);
	ResultSet rSet = stm.executeQuery(sqlString);
	while (rSet.next()) {
		String beforeCreatedDate= rSet.getString("created_date");
		Date afterCreatedDate = new Date();
		 try {
			afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		goodReceipt = new GoodReceipt(rSet.getInt("id"),rSet.getInt("employeeID"),afterFormat.format(afterCreatedDate), rSet.getInt("total"));
	}
return goodReceipt;
}
	
}
