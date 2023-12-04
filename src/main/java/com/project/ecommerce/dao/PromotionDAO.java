package com.project.ecommerce.dao;

import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.model.Promotion;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
;

public class PromotionDAO {
	public static List<Promotion> listPromotion() throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		List<Promotion> list = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		String sql= String.format("Select * from dbo.Promotion");
		ResultSet resultSet= statement.executeQuery(sql);
		
		while(resultSet.next()) {
			String beforeCreatedDate= resultSet.getString("dateStart");
			String beforeCreatedDate2= resultSet.getString("dateEnd");
			Date afterCreatedDate = new Date();
			Date afterCreatedDate2 = new Date();
			try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
				afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Promotion promotion= new Promotion(resultSet.getInt("id"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getInt("employeeID"),resultSet.getString("reason"));			
			list.add(promotion);
			
		}
		return list;
		
	}
	public static Promotion PromotionByID(int ID) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		String sql= String.format("Select * from dbo.Promotion where id="+ID);
		ResultSet resultSet= statement.executeQuery(sql);
		Promotion promotion= new Promotion();
		while(resultSet.next()) {
			String beforeCreatedDate= resultSet.getString("dateStart");
			String beforeCreatedDate2= resultSet.getString("dateEnd");
			Date afterCreatedDate = new Date();
			Date afterCreatedDate2 = new Date();
			try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
				afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			promotion= new Promotion(resultSet.getInt("id"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getInt("employeeID"),resultSet.getString("reason"));			
		}
		return promotion;		
	}
	
	public static Promotion promotionbyCurrentDate() throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		String sqlString= String.format("select * from Promotion where dateStart <= '"+date+"' and dateEnd >= '"+date+"'");
		ResultSet resultSet= statement.executeQuery(sqlString);
		Promotion promotion= new Promotion();
		while(resultSet.next()) {
			String beforeCreatedDate= resultSet.getString("dateStart");
			String beforeCreatedDate2= resultSet.getString("dateEnd");
			Date afterCreatedDate = new Date();
			Date afterCreatedDate2 = new Date();
			try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
				afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			promotion= new Promotion(resultSet.getInt("id"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getInt("employeeID"),resultSet.getString("reason"));			
		}
		return promotion;	
	}
	
	public void insertPromotion(String dateStart, String dateEnd, int idEmployee,String reason) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		
		String sql= String.format("insert into dbo.Promotion(dateStart, dateEnd, employeeID,reason) VAlues ('"+dateStart+"','"+dateEnd+"',"+idEmployee+",N'"+reason+"')");
		int result= statement.executeUpdate(sql);
	
	}
	public void updatePromotion(String dateStart, String dateEnd, int idEmployee, int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		
		String sql= String.format("Update dbo.Promotion set dateStart='"+dateStart+"',dateEnd='"+dateEnd+"', employeeID="+idEmployee+" where id="+id);
		System.out.print(sql);
		int result= statement.executeUpdate(sql);
	
	}
	public boolean deletePromotion( int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		
		String sql= String.format("delete from promotion where id="+id);
		int result= statement.executeUpdate(sql);
		if(result>0) {
			return true;
		}
		return false;
	
	}

}
