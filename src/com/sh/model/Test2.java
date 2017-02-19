package com.sh.model;

import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import com.sh.recommend.*;
import java.sql.*;

public class Test2 {
	public static void main(String[] args) throws SQLException {
	
		ItemBeanCl ibc = new ItemBeanCl();
		
		ResultSet rs = ibc.getItemNames(1);
		while (rs.next()){
			System.out.println(rs.getString(1));
		}
		ibc.close();

	}
}
