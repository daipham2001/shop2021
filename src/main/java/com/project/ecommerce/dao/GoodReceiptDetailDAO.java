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
import com.project.ecommerce.model.GoodReceiptDetail;

public class GoodReceiptDetailDAO {
	public static List<GoodReceiptDetail> listGoodReceiptDetailbyID(int id) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<GoodReceiptDetail> listGoodReceiptDetail = new ArrayList<>();
	
		String sqlString = String.format("select * from GoodReceipt_detail where GoodReceiptID="+id);
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			 GoodReceiptDetail goodReceiptDetail = new GoodReceiptDetail(rSet.getInt("id"),rSet.getString("productID"),rSet.getInt("goodReceiptID"),rSet.getInt("price"),rSet.getInt("quantity"));
			 listGoodReceiptDetail.add(goodReceiptDetail);

		}
		return listGoodReceiptDetail;
	}
	public int insertGoodReceiptDetail(int id, String productID, int price, int quantity) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		
		String sqlString="INSERT INTO dbo.GoodReceipt_detail(productID,GoodReceiptID,price, quantity) VALUES(N'"+productID+"' ,"+id+","+price+","+quantity+")";
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return 0;
		} 
			return 2;
		}
	public int getIDgoodReceiptDetal() throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="select MAX(id) as id from GoodReceipt_detail";
		ResultSet resultSet= statement.executeQuery(sqlString);
		int id=0;
		while(resultSet.next()) {
			id= resultSet.getInt("id");
		}
		return id;
	}

}
