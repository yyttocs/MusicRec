package com.sh.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Test {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String u = "12";
		ConnDB db = new ConnDB();
		
		try {
			
			conn = db.getConn();
		    stmt = conn.createStatement();
			rs = stmt.executeQuery("select password from user_table where username='"+u+"'");
			while (rs.next()) {
				System.out.println(rs.getString("password"));
			}
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			try {
				if(rs != null) {
					rs.close();
					rs = null; 
				}
				if(stmt != null) {
					stmt.close();
					stmt = null;
				}
				if(conn != null) {
					conn.close();
					conn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}
