package com.project.ecommerce.dao;

import com.project.ecommerce.model.Comment;
import com.project.ecommerce.model.DBConnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
;

public class CommentDAO {
	public static List<Comment> listCommentByProduct(String id) throws SQLException{
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		List<Comment> listComments= new ArrayList<>();
		String sql= String.format("Select *from comment where ProductID= '"+id+"'");
		ResultSet resultSet= statement.executeQuery(sql);
		while(resultSet.next()) {
			Comment comment= new Comment(resultSet.getInt("id"),resultSet.getString("productID"),resultSet.getInt("customerID"),resultSet.getInt("rating"),resultSet.getString("comment"));
			listComments.add(comment);
		}
		return listComments;
	}
	public boolean insertComment(String textComment, int rating, int iduser, String idProduct) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="INSERT INTO dbo.Comment(ProductID, CustomerID, rating, comment)\r\n" + 
				"VALUES (N'"+idProduct+"',"+ iduser+","+rating+",N'"+textComment+"')";
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean deleteComment(int idComment) throws SQLException {
		DBConnect dbConnect=new DBConnect();
		Statement statement= dbConnect.getConnection().createStatement();
		String sqlString="delete from Comment where id="+idComment;
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
}
