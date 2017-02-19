package com.sh.model;

import java.sql.*;
import java.util.Vector;
import java.util.Map;
import java.util.HashMap;

public class AdminBeanCl {

	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	
	public void deleteUser(){
		
	}

	public boolean checkUser(String u,String p) {

		boolean b = false;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select AdminPassword from admin_table where AdminName='"+u+"'");
			
			if(rs.next()) {
				if(rs.getString(1).equals(p)) {
					b = true;					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
 		
 		return b;
 		
	} 
	public int getAdminID(String UserName) {
		int userID = 0;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select AdminID from admin_table where AdminName='"+UserName+"'");
			
			if(rs.next()) 
				userID = rs.getInt(1); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return userID;
	}
	public void close() {
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