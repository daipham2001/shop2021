
package com.project.ecommerce.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.project.ecommerce.model.CustomerSession;
import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.tool.MD5;

public class LoginDAO {

	public int checkLogin(String email, String password) throws SQLException {
				DBConnect dbConnect = new DBConnect();
				MD5 md5=new MD5();
				PreparedStatement statement= null;
				String sql = "select * from customer where email=? and password=?";
				statement= dbConnect.getConnection().prepareStatement(sql);
				statement.setString(1, email);
				statement.setString(2, md5.mahoa(password));
				ResultSet rSet= statement.executeQuery();
				if (rSet.next()) {
				CustomerSession.id= rSet.getInt("id");
				CustomerSession.name= rSet.getString("name");
				CustomerSession.phone= rSet.getString("phone");
				CustomerSession.email= rSet.getString("email");
				CustomerSession.address=rSet.getString("address");
				
				return 0;
			}
			return 1;
		}
		
}
