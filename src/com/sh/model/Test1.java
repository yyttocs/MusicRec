package com.sh.model;

import java.util.Map;
import java.util.Vector;
import com.sh.recommend.*;
public class Test1 {
	public static void main(String[] args) {
		UserBeanCl b = new UserBeanCl();
		Vector<Integer> users = b.getTestUser();
		Vector<Integer> items = b.getTestItem();
		Map<Integer,Map<Integer,Float>> user_items = b.getUser_items();
		Matrix m = new Matrix(user_items);
		m.printMatrix();
		for(int i=0;i<10;i++) {	
			System.out.println(users.elementAt(i));
		    System.out.println(items.elementAt(i));
		}
	}
}
