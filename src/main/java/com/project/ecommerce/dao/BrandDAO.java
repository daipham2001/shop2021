package com.project.ecommerce.dao;

import com.project.ecommerce.model.Brand;
import com.project.ecommerce.model.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BrandDAO {
	
	//list Brand By Category
	public static List<Brand> listBrand(int id) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		List<Brand> listBrand = new ArrayList<>();
		String sqlString = String.format("select * from brand where cateID=?");
		PreparedStatement statement= dBconnect.getConnection().prepareStatement(sqlString);
		statement.setInt(1, id);
		ResultSet rSet= statement.executeQuery();
		while (rSet.next()) {
			Brand brand = new Brand(rSet.getInt("id"),rSet.getInt("cateID"),rSet.getString("name"));
			listBrand.add(brand);
		}
		return listBrand;
	}
	
	//list All Brand
	public static List<Brand> listAllBrand() throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Brand> listBrand = new ArrayList<>();
		String sqlString = String.format("select * from Brand order by cateID");	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Brand brand = new Brand(rSet.getInt("id"),rSet.getInt("cateID"),rSet.getString("name"));
			listBrand.add(brand);
		}
		return listBrand;
	}
	
	// Brand by ID
	public static Brand brandById(int id) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Brand brand= new Brand();
		String sqlString = String.format("select * from brand where ID=?");
		PreparedStatement statement= dBconnect.getConnection().prepareStatement(sqlString);
		statement.setInt(1, id);
		ResultSet rSet = statement.executeQuery();
		while (rSet.next()) {
			brand = new Brand(rSet.getInt("id"),rSet.getInt("cateID"),rSet.getString("name"));
		}
		return brand;
	}
	
	//insertN
	public int insertBrand(String name,int idCate) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString1 = String.format("select * from Brand where name=N'"+name+"' and cateID="+idCate);
		ResultSet rSet1 = statement.executeQuery(sqlString1);
		if (rSet1.next()) {
			return 1;
		}
		else {
		String sqlString="INSERT INTO dbo.Brand(name,cateid) VALUES(N'"+name+"',"+idCate+")";
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return 0;
		} else {
			return 2;
		}
	}
	}
	
	//deleteBrand
	public int deleteBrand(int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		String sqlString="DELETE FROM dbo.Brand where id=?";
		PreparedStatement statement= dbConnect.getConnection().prepareStatement(sqlString);
		statement.setInt(1, id);
		int rSet = statement.executeUpdate();
		if (rSet >= 0) {
			return 0;
		} else {
			return 2;
		}
	}
	public int editBrand(int id, String name,int idCate) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString = String.format("select * from Brand where name= N'"+name+"' and cateID="+idCate);
		ResultSet rSet1 = statement.executeQuery(sqlString);
		if (rSet1.next()) {
			return 1;
		}
		else {
		String sqlString1="Update dbo.Brand set name= N'"+name+"' where id="+id;
		int rSet = statement.executeUpdate(sqlString1);
		if (rSet >= 0) {
			return 0;
		} else {
			return 2;
		}
	}
}
	// count Brand In Product
	public int countBrandinProduct(int id) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		String sqlString = String.format("select count(*) as count from Product where brandID=?");
		PreparedStatement statement= dBconnect.getConnection().prepareStatement(sqlString);
		statement.setInt(1, id);
		ResultSet rSet = statement.executeQuery();
		int count=0;
		while (rSet.next()) {
			 count= rSet.getInt("count");
		} 
		return count;
	}
}
