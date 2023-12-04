package com.project.ecommerce.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	public static void main(String[] args) {
		DBConnect dbConnect = new DBConnect();
		dbConnect.getConnection();

	}

	public Connection conn = null;

	String hostName = "localhost";
	String sqlInstanceName = "SQLEXPRESS";
	String database = "DIENTU";
	String userName = "dai";
	String password = "1";

	public Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionURL = "jdbc:sqlserver://" + hostName + ":1433" + ";instance=" + sqlInstanceName
					+ ";databaseName=" + database;

			Connection conn = DriverManager.getConnection(connectionURL, userName, password);
			if (conn != null) {
				return conn;
			}

		} catch (ClassNotFoundException e) {
			System.out.print(e);
		} catch (SQLException e) {
			System.out.print("Error: " + e.getMessage());
		}
		return conn;
	}

	public Connection returnConnection() {
		return conn;
	}
}
