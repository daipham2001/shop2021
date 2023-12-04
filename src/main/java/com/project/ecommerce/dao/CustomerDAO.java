package com.project.ecommerce.dao;

import com.project.ecommerce.model.Customer;
import com.project.ecommerce.model.DBConnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class CustomerDAO {
	public static Customer customerByID(int ID) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("Select * from Customer where id="+ID);
		ResultSet resultSet= statement.executeQuery(sql);
		Customer customer= new Customer();
		while(resultSet.next()) {
			 customer= new Customer(resultSet.getInt("id"),resultSet.getString("name"),resultSet.getString("phone"),resultSet.getString("email"),resultSet.getString("password"),resultSet.getString("address"));			
		}
		return customer;		
	}
	public boolean checkEmailExits(String email) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqString="select * from Customer where email='"+email+"'";
		ResultSet resultSet= statement.executeQuery(sqString);
		if (resultSet.next()) {
			return true;
			
		}
		return false;
		
	}
	public boolean changePasswordForgot(String emailString, String pasString) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="update customer set Password='"+pasString+"' where email= '"+emailString+"'";
		int result = statement.executeUpdate(sqlString);
			if (result>=0) {
				return true;
				
			}
		
		return false;
	}
	public boolean UpdateProfile(String name, String phone, String address,int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("Update dbo.Customer set name= N'"+name+"', address=N'"+address+"', phone='"+phone+"' where id= "+id);
		int result= statement.executeUpdate(sql);
		while(result>0) {
			return true;
		}
		return false;		
	}
	public int changePass(String oldPass, String newPass, int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("Select * from Customer where password='"+oldPass+"' and id="+id);
		ResultSet resultSet= statement.executeQuery(sql);
		while(resultSet.next()) {
			String sql2= String.format("Update Customer set password= N'"+newPass+"' where id="+id);
			
			int result= statement.executeUpdate(sql2);
			while(result>0) {
				return 0;
			}
			return 2;	
			
		}return 1;
			
	}

}
