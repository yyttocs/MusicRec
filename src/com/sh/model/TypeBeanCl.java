package com.sh.model;

import java.sql.*;

public class TypeBeanCl {
	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	//以ItemName为条件搜索item_table数据表，获得符合条件的记录，返回一个ResultSet类型对象
	public ResultSet search_item(String itemName) {
		
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select * from item_table where ";
			sql = sql + "ItemName like '%" + itemName +"%'";
			rs = stmt.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public ResultSet search_music(String MusicName) {
		
			try {
			
					conn = new ConnDB().getConn();

					stmt = conn.createStatement();
					
					String sql = "select * from item_table where ";
					sql = sql + "MusicName like '%"+MusicName+"%'";										
					rs = stmt.executeQuery(sql);

				} catch (Exception e) {
					e.printStackTrace();
			}
		
				return rs;
		}
	
	//获得Type_table表对应的type信息，返回一个ResultSet类型对象
	
//	public static void main(String[] args)
//	{
//		new TypeBeanCl().search_music("生活");
//	}
	public ResultSet getTypeName() {

		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from type_table");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	//找给定类型歌曲的类型中文名
	public String getTypeChiName(String TypeName) {
		String a = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select TypeChiName from Type_table where TypeName='" + TypeName + "'";
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
	
	//找指定歌曲的类型名
			public String getTypeChiNameByItemId(int itemID) {
				String a = "";
				try {
					
					conn = new ConnDB().getConn();
					stmt = conn.createStatement();
					String sql = "select TypeChiName from type_table where TypeID in (select TypeID from Item_type_table where ItemID=" + itemID +")";
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
