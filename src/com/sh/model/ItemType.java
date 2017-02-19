package com.sh.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ItemType {
	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	
	public boolean add(int ItemID,int Type) 
	{
		boolean b = false;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String strSql = "insert into Item_type_table values("+ItemID+","+Type+")";
			stmt.executeUpdate(strSql);	
			b = true;	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return b;
	}
	
	
	public ArrayList<Integer> getTypeByItem(int itemID) {
				
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select TypeID from Item_type_table where ItemID='" + itemID + "'";
			rs = stmt.executeQuery(sql);
			ArrayList<Integer>list=new ArrayList<Integer>();
			while(rs.next())
			{
				list.add(rs.getInt(1));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return new ArrayList<Integer>() ;
	}
	
	
	public ArrayList<ArrayList<Object>> getSameItemsByType(int curUser,int user,int typeID) {
		
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select s.ItemID, s.UserID, s.Rating,t.UserID,t.Rating from (select r.* from rating_table r,Item_type_table it where "
					+ "r.ItemID=it.ItemID and r.UserID=" + curUser +" and it.TypeID="+ typeID+") s,"
					+ "(select r.* from rating_table r,Item_type_table it where "
					+ "r.ItemID=it.ItemID and r.UserID=" + user+"  and it.TypeID="+ typeID+") t "
					+ "where s.ItemID=t.ItemID;";
			rs = stmt.executeQuery(sql);
			ArrayList<ArrayList<Object>> list=new ArrayList<ArrayList<Object>>();
			while(rs.next())
			{
				ArrayList<Object> a=new ArrayList<Object>();
				for(int i=1;i<6;i++)
				{
				  a.add(rs.getInt(i));
				}
				list.add(a);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return new ArrayList<ArrayList<Object>>();
		
	}
	
	public float getSumScoreByUserType(int userID,int typeID) {
		
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select t.TypeID, sum(r.Rating) sum from Item_type_table t,rating_table r where r.UserID=" + userID + " and "
					+ "t.ItemID=r.ItemID and t.TypeID="+typeID+" group by t.TypeID";
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				return rs.getFloat(2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return 0 ;
	}
	
    public float getAverageRatingByType(int typeID) {
		
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select avg(sum) ave from (select r.UserID, sum(r.Rating) sum from Item_type_table t,rating_table r where "
					+ "t.ItemID=r.ItemID and t.TypeID="+typeID+" group by r.UserID) temp";
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				return rs.getFloat(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return 0 ;
	}
    
    public float getAverageRatingByItem(int itemID) {
		
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select ItemID, avg(Rating) sum from rating_table where ItemID="+itemID+" group by ItemID";
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				return rs.getFloat(2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return 0 ;
	}

    public ArrayList<ArrayList<Object>> getSameItemsinOtherType(int curUser,int user,int typeID) {
		
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select s.ItemID, s.UserID, s.Rating,t.UserID,t.Rating from (select r.* from rating_table r,Item_type_table it where "
					+ "r.ItemID=it.ItemID and r.UserID=" + curUser +" and it.TypeID<>"+ typeID+") s,"
					+ "(select r.* from rating_table r,Item_type_table it where "
					+ "r.ItemID=it.ItemID and r.UserID=" + user+"  and it.TypeID<>"+ typeID+") t "
					+ "where s.ItemID=t.ItemID;";
			//System.out.println(sql);
			rs = stmt.executeQuery(sql);
			ArrayList<ArrayList<Object>> list=new ArrayList<ArrayList<Object>>();
			while(rs.next())
			{
				ArrayList<Object> a=new ArrayList<Object>();
				for(int i=1;i<6;i++)
				{
				  a.add(rs.getInt(i));
				}
				list.add(a);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return new ArrayList<ArrayList<Object>>();
		
	}
    
    
    //获取当前用户列表
	public ArrayList<Integer> getUserList(int curUser) {
		
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select distinct UserID from rating_table where UserID <>" + curUser;
			//System.out.println(sql);
			rs = stmt.executeQuery(sql);
			ArrayList<Integer>list=new ArrayList<Integer>();
			while(rs.next())
			{
				list.add(rs.getInt(1));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return new ArrayList<Integer>() ;
	}
	
	
	
	public static void main(String[] args) throws Exception
	{
		ArrayList<Integer> list=new ItemType().getUserList(1);
		for(int i=0;i<list.size();i++)
		{
			System.out.println(list.get(i));
		}
			
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
