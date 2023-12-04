package com.project.ecommerce.dao;

import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.model.Employee;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class EmployeeDAO {
	public static List<Employee> listShipper() throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		List<Employee> list = new ArrayList<>();
		String sql= String.format("Select * from dbo.Employee where role=0");
		ResultSet resultSet= statement.executeQuery(sql);
		
		while(resultSet.next()) {
			Employee employee= new Employee(resultSet.getInt("id"),resultSet.getString("name"),resultSet.getString("phone"),resultSet.getString("email"),resultSet.getString("address"),resultSet.getInt("role"));			
			list.add(employee);
			
		}
		return list;
		
	}
	public static Employee employeeByID(int ID) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("Select * from Employee where id="+ID);
		ResultSet resultSet= statement.executeQuery(sql);
		Employee employee= new Employee();
		while(resultSet.next()) {
			employee=new Employee(resultSet.getInt("id"),resultSet.getString("name"),resultSet.getString("phone"),resultSet.getString("email"),resultSet.getString("address"),resultSet.getInt("role"));
		}
		return employee;		
	}
	public boolean UpdateProfile(String name, String phone, String address,int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("Update dbo.Employee set name= N'"+name+"', address=N'"+address+"', phone='"+phone+"' where id= "+id);
		int result= statement.executeUpdate(sql);
		while(result>0) {
			return true;
		}
		return false;		
	}
	public int changePass(String oldPass, String newPass, int id) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sql= String.format("Select * from Employee where password='"+oldPass+"' and id="+id);
		ResultSet resultSet= statement.executeQuery(sql);
		while(resultSet.next()) {
			String sql2= String.format("Update Employee set password= N'"+newPass+"' where id="+id);
			
			int result= statement.executeUpdate(sql2);
			while(result>0) {
				return 0;
			}
			return 2;	
			
		}return 1;
			
	}
	public boolean checkEmailExits(String email) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqString="select * from Employee where email='"+email+"'";
		ResultSet resultSet= statement.executeQuery(sqString);
		if (resultSet.next()) {
			return true;
			
		}
		return false;
		
	}
	public boolean changePasswordForgot(String emailString, String pasString) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="update employee set Password='"+pasString+"' where email= '"+emailString+"'";
		int result = statement.executeUpdate(sqlString);
			if (result>=0) {
				return true;
				
			}
		
		return false;
	}

}
