package com.project.ecommerce.dao;

import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.model.Promotion_detail;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Promotion_detailDAO {
	public static List<Promotion_detail> listPromotion_detail() throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		List<Promotion_detail> list = new ArrayList<>();
		String sql= String.format("select A.productID,A.promotionID, A.percent_promotion,B.dateStart, B.dateEnd,C.name from Promotion_detail as A inner join Promotion as B on A.promotionID= B.id inner join Product as C on A.productID=C.ID");
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
			
			Promotion_detail promotion_detail= new Promotion_detail(resultSet.getString("productID"),resultSet.getInt("promotionID"),resultSet.getInt("percent_promotion"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getString("name"));			
			list.add(promotion_detail);
			
		}
		return list;
		
	}
	public static List<Promotion_detail> listPromotion_detailbyID(int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		List<Promotion_detail> list = new ArrayList<>();
		String sql= String.format("select  A.productID,A.promotionID, A.percent_promotion,B.dateStart, B.dateEnd,C.name from Promotion_detail as A inner join Promotion as B on A.promotionID= B.id inner join Product as C on A.productID=C.ID where B.ID="+id);
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
			
			Promotion_detail promotion_detail= new Promotion_detail(resultSet.getString("productID"),resultSet.getInt("promotionID"),resultSet.getInt("percent_promotion"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getString("name"));			
			list.add(promotion_detail);
			
		}
		return list;
		
	}
	public static Promotion_detail Promotion_detailByID(String productID, int  promotionID) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("Select * from dbo.Promotion_detail where productID='"+productID+"' and promotionID="+promotionID);
		ResultSet resultSet= statement.executeQuery(sql);
		Promotion_detail promotion_detail= new Promotion_detail();
		while(resultSet.next()) {
			
			promotion_detail=  new Promotion_detail(resultSet.getString("productID"),resultSet.getInt("promotionID"),resultSet.getInt("percent_promotion"));			
		}
		return promotion_detail;		
	}
	public boolean deletePromotion_detail( String idProduct,int idPromotion) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("delete from dbo.Promotion_detail where productID='"+idProduct+"' and promotionID="+idPromotion);
		
		int result= statement.executeUpdate(sql);
		if(result>0) {
			return true;
		}
		return false;
		
	}
	public boolean updatePromotion_detail(String productID,int promotionID, int percent_promotion) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("update dbo.Promotion_detail set percent_promotion="+percent_promotion+" where productID= N'"+productID+"' and promotionID= "+promotionID);
		int result= statement.executeUpdate(sql);
		if(result>0) {
			return true;
		}
		return false;
		
	}
	public int insertProductToPromotionDetail(String idProduct, int percent_promotion, int idPromotion) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString=String.format("select * from Promotion_detail where productID='"+idProduct+"' and promotionID="+idPromotion);
		ResultSet resultSet= statement.executeQuery(sqlString);
		while(resultSet.next()) {
			return 1;
		}
		String sqlString2=String.format("insert into Promotion_detail(productID,promotionID,percent_promotion) Values(N'"+idProduct+"',"+idPromotion+","+percent_promotion+")");
		int resultSet2= statement.executeUpdate(sqlString2);
		if(resultSet2>0) {
			return 0;
		} else {
		return 2;
		}
	}
	public int countPromotion_detailbyID(int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString=String.format("select count(*) as count from Promotion_detail where promotionID="+id);
		ResultSet resultSet= statement.executeQuery(sqlString);
		int count=0;
		while(resultSet.next()) {
			count= resultSet.getInt("count");
		}
		return count;
	
	}
}
