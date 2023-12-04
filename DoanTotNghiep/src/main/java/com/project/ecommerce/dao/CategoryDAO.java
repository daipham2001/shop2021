package com.project.ecommerce.dao;

import com.project.ecommerce.model.Category;
import com.project.ecommerce.model.DBConnect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
;

public class CategoryDAO {
	public static void main(String[] args) {
		try {
			listCategory();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public static List<Category> listCategory() throws SQLException {

		DBConnect dBconnect=new DBConnect();
		//Connection connection = dBconnect.getConnection();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Category> listCategory = new ArrayList<>();
		String sqlString = String.format("select * from category");

	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
				Category category = new Category(rSet.getInt("id"),rSet.getString("name"));
			listCategory.add(category);

		}

		return listCategory;
	}
	public static Category categoryById(int id) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		Category category= new Category();
		String sqlString = String.format("select * from category where ID="+id);
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			category = new Category(rSet.getInt("id"),rSet.getString("name"));

		}
	return category;
	}
	public static Category categoryByBrandID(int id) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		Category category= new Category();
		String sqlString = String.format("select Category.id,Category.name from Category inner join brand on Category.ID=Brand.cateID where Brand.id="+id);
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			category = new Category(rSet.getInt("id"),rSet.getString("name"));

		}
	return category;
	}
	public static Category categoryByidProduct(String id) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		Category category= new Category();
		String sqlString = String.format("select Category.id,Category.name from Category inner join brand on Category.ID=Brand.cateID inner join Product on Brand.id= Product.brandID where product.id='"+id+"'");
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			category = new Category(rSet.getInt("id"),rSet.getString("name"));

		}
	return category;
	}
	public int insertCategory(String name) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString1 = String.format("select * from category where name=N'"+name+"'");
		ResultSet rSet1 = statement.executeQuery(sqlString1);
		if (rSet1.next()) {
			return 1;
		}
		else {
		String sqlString="INSERT INTO dbo.Category(name)\r\n" + 
				"VALUES (N'"+name+"')";
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return 0;
		} else {
			return 2;
		}
	}
	}
	public int deleteCategory(int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="DELETE FROM dbo.Category where id="+id;
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return 0;
		} else {
			return 2;
		}
	}
	public int editCategory(int id, String name) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString = String.format("select * from category where name=N'"+name+"'");
		ResultSet rSet1 = statement.executeQuery(sqlString);
		if (rSet1.next()) {
			return 1;
		}
		else {
		String sqlString1="Update dbo.Category set name= N'"+name+"' where id="+id;
		int rSet = statement.executeUpdate(sqlString1);
		if (rSet >= 0) {
			return 0;
		} else {
			return 2;
				}
		}
	}
	public int countCategoryinBrand(int id) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		String sqlString = String.format("select count(*) as count from Brand where cateID="+id);
		ResultSet rSet = stm.executeQuery(sqlString);
		int count=0;
		while (rSet.next()) {
			 count= rSet.getInt("count");
		} 
		return count;
	}
}
