package com.sh.model;

import java.sql.*;
import java.util.Vector;
import java.util.Map;
import java.util.HashMap;

public class UserBeanCl {

	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	//验证用户是否存在
	
	public boolean checkUser(String u,String p) {

		boolean b = false;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select Password from user_table where UserName='"+u+"'");
			
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
	
	public ResultSet getPersonDetails(int userId) {
	       try {
				
				conn = new ConnDB().getConn();
				stmt = conn.createStatement();
				String str = "select * from user_table where UserID='" + userId + "'";
				rs = stmt.executeQuery(str);			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return rs;
		}
	
	public boolean setUser(int uid,String s_Sex,String s_Eamil) {
		boolean b = true;
		try {			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			stmt.executeUpdate("update user_table set Email='"+s_Eamil+"',Sex='"+s_Sex+"' where UserID="+uid);
			
		} catch (Exception e) {
			e.printStackTrace();
			b=false;
		} finally {
 			this.close();
 		}
		return b;
	}
	
	public boolean updatePw(int uid,String s_UserPassword) {
		boolean b = true;
		try {			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			stmt.executeUpdate("update user_table set Password='"+s_UserPassword+"' where UserID="+uid);
			
		} catch (Exception e) {
			e.printStackTrace();
			b=false;
		} finally {
 			this.close();
 		}
		return b;
		
	}
	
	public boolean checkUser(String u) {
		boolean b = false;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from user_table");
			
			while(rs.next()) {
				if(rs.getString(1).equals(u)) {
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
	//注册时，用户名是否已存在
	public boolean checkUserName(String u) {
		boolean b = false;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from user_table");
			
			while(rs.next()) {
				if(rs.getString(2).equals(u)) {
					b = true;
					break;
				}				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return b;
	}
	
	public int getUserID(String UserName) {
		int userID = 0;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select UserID from user_table where UserName='"+UserName+"'");
			
			if(rs.next()) 
				userID = rs.getInt(1); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return userID;
	}
	
	
	public String getUserName(int userid) {
		String userName = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from user_table where UserID='"+userid+"'");
			
			if(rs.next()) 
				userName = rs.getString(2); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return userName;
	}
	
	public String getUserEmail(int userid) {
		String userEmail = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from user_table where UserID='"+userid+"'");

			if(rs.next()) 
				userEmail = rs.getString(4);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return userEmail;
	}
	
	public String getUserSex(int userid) {
		String userSex = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from user_table where UserID='"+userid+"'");
			
			if(rs.next()) 
				userSex = rs.getString(5); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return userSex;
	}
    public void getNowId() {
        try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from user_table");
			
			while(rs.next()) {
				UserBean.Id = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}   	
    }
	
	public boolean addUser(UserBean user) {
		boolean b = false;
		int userId = user.getUserId();
	    String username = user.getUsername();
	    String password = user.getPassword();
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String strSql = "insert into user_table values('"+userId+"','"+username+"','"+password+"','','')";
			stmt.executeUpdate(strSql);	
			b = true;	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		return b;
	}

	public boolean addUser(String u,String p) {
		boolean b = false;
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select UserName from user_table");
			
			if(rs.next()) {
				if(rs.getString(1).equals(u)) {
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
	
	//获取系统用户
	public ResultSet getAllUsers() {
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			
			String sql = "select * from user_table";
			rs = stmt.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	//删除用户
		public boolean deleteByID(int UserID) 
		{
				boolean b = false;
				try {
					
					conn = new ConnDB().getConn();
					stmt = conn.createStatement();
					String strSql = "delete from user_table where UserID=" + UserID;
					stmt.executeUpdate(strSql);	
					b = true;	
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
		 			this.close();
		 		}
				
				return b;
		}
	
	public Vector<Integer> getTestUser () {
		Vector<Integer> users = new Vector<Integer>();
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from rating_table");
			
			while (rs.next()) {
				int userID = rs.getInt("UserID");
				if(users.indexOf(userID)==-1)
					users.add(userID);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
 		
 		return users;
	}
	
	public Vector<Integer> getTestItem () {
		Vector<Integer> items = new Vector<Integer>();
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from rating_table");
			
			while (rs.next()) {
				int itemID = rs.getInt("ItemID");
				if(items.indexOf(itemID)==-1)
					items.add(itemID);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
 		
 		return items;
	}
	
	public  Map<Integer,Map<Integer,Float>> getUser_items() {
        Map<Integer,Map<Integer,Float>> user_items=new HashMap<Integer,Map<Integer,Float>>();
        Map<Integer,Float> userMap;	  
        try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from rating_table");
			
			while (rs.next()) {
				int userID = rs.getInt("UserID");
				int itemID = rs.getInt("ItemID");
				float rate = rs.getInt("Rating");
				if (!user_items.containsKey(Integer.valueOf(userID)))  // 判断该项目是否已在映射中
				{
					userMap = new HashMap<Integer, Float>();
					userMap.put(itemID, rate);
					user_items.put(userID, userMap);
				} else {
					userMap = user_items.get(Integer.valueOf(userID));
					userMap.put(itemID, rate);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
 		
 		return user_items;
	}
	
	public String getItemInfo(int ItemID) {
		String ItemName = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select ItemName from item_table where ItemID = " + ItemID;
			rs = stmt.executeQuery(sql);
			if(rs.next())
			ItemName = rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return ItemName;
	}
	public String getEmailByName(String name)
	{
		String Email = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select Email from user_table where UserName = '" + name+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next())
				Email = rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return Email;
	}
	public String getPasswordByName(String name)
	{
		String Password = "";
		try {
			
			conn = new ConnDB().getConn();
			stmt = conn.createStatement();
			String sql = "select Password from user_table where UserName = '" + name+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next())
				Password = rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
 			this.close();
 		}
		
		return Password;
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
