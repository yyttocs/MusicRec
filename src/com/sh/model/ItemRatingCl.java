package com.sh.model;

import java.sql.*;

public class ItemRatingCl {
	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public ResultSet recommended() {
       try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String str = "select * from item_table where ItemID in (select ItemID from rating_table where Rating=5)";
			rs = stmt.executeQuery(str);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//用户对已评分歌曲，即用户歌单
	public ResultSet recommendedMusicList(String s) {
	       try {
				
				conn = new ConnDB().getConn();
				stmt = conn.createStatement();
				String str = "select * from rating_table where UserID in (select UserID from user_table where UserName='" + s + "')";
				rs = stmt.executeQuery(str);			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return rs;
		}
	
	
	
	//找到用户是否已经对歌曲进行评分
	public ResultSet recommended1(String s) {
	       try {
				
				conn = new ConnDB().getConn();
				stmt = conn.createStatement();
				String str = "select * from rating_table where UserID in (select UserID from user_table where UserName='" + s + "')";
				rs = stmt.executeQuery(str);			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return rs;
		}
	
	
	
	public boolean addRating(int userID,int ItemID,int Rating) {
		boolean b = false;
		
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String str = "select * from rating_table where UserID="+userID+" and ItemID="+ItemID;
			rs = stmt.executeQuery(str);
			if(rs.next()) {
				return b;
			}
			String strSql = "insert into rating_table values('"+userID+"','"+ItemID+"','"+Rating+"')";
			stmt.executeUpdate(strSql);	
			b = true;	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return b;
 		
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
