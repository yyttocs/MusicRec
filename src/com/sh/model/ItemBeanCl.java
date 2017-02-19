package com.sh.model;

import java.sql.*;
import java.util.Vector;

public class ItemBeanCl {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	

	
	public boolean addMusic(String ItemName,String ItemSong,String MusicName,String Singer) 
	{
		boolean b = false;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String strSql = "insert into item_table (ItemName,ItemSong,MusicName,Singer) values('"+ItemName+"','"+ItemSong+"','"+MusicName+"','"+Singer+"')";
			stmt.executeUpdate(strSql);	
			b = true;	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return b;
	}
	
	
	//删除歌曲
	public boolean deleteByID(int ItemID) 
	{
			boolean b = false;
			try {
				
				conn = new ConnDB().getConn();
				stmt = conn.createStatement();
				String strSql = "delete from item_table where ItemID=" + ItemID;
				stmt.executeUpdate(strSql);	
				b = true;	
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
	 			this.close();
	 		}
			
			return b;
	}
	
	public int  getItemID(String itemName) {
		int a = -1;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select ItemID from Item_table where ItemName='" + itemName + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				a = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return a;
	}
	
	public String getItemSong(String itemName) {
		String a = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select ItemSong from Item_table where ItemName='" + itemName + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				a = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return a;
	}
	
	public String getMusicName(String itemName) {
		String a = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select MusicName from Item_table where ItemName='" + itemName + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				a = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return a;
	}
	
	public String getSinger(String itemName) {
		String a = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select Singer from Item_table where ItemName='" + itemName + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				a = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return a;
	}
	//
	public String getSingerByMusicName(String MusicName) {
		String a = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select Singer from Item_table where ItemName='" + MusicName + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				a = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return a;
	}
	
	
	
	public String getItemName(int itemID) {
		String a = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select ItemName from Item_table where ItemID='" + itemID + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				a = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return a;
	}
	
	public ResultSet getItemNames(int typeID) {
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			
			String sql = "select * from item_table where ItemID in (select ItemID from Item_type_table where TypeID=" + typeID +")";
			rs = stmt.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	
	public ResultSet getAllItems() {
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			
			String sql = "select * from item_table";
			rs = stmt.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}

	public static void main(String[] args) throws Exception
	{
		
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
