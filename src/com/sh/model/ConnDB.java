//得到数据库连接
package com.sh.model;

import java.sql.*;

public class ConnDB {
	
	private Connection conn =null; 
	private final String dbDrive = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost/cofe?setUnicode=true&characterEncoding=UTF-8";
	private final String userName = "root";
	private final String password = "";
	
	
	public Connection getConn() {
		
		try {
//          加载驱动			
			Class.forName(dbDrive);

			conn = DriverManager.getConnection(url, userName, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return conn;
	}

}
