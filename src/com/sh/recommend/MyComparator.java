package com.sh.recommend;

import java.util.ArrayList;
import java.util.Comparator;

public class MyComparator implements Comparator<ArrayList<Object>>{

	@Override
	public int compare(ArrayList<Object> o1, ArrayList<Object> o2) {
		// TODO Auto-generated method stub
		float a=(float) o1.get(1);
		float b=(float) o2.get(1);
		return (int) (100*b-100*a);
	}

	
	
}
