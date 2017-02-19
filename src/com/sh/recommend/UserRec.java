package com.sh.recommend;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;


import com.sh.model.ItemType;

public class UserRec {
	
	ItemType itemTypedao=new ItemType();
	ArrayList<ArrayList<Object>> result=new ArrayList<ArrayList<Object>>();
	
	public static void main(String[] args)
	{
		UserRec userRec=new UserRec();
		ArrayList<ArrayList<Object>> list=userRec.getRecList(1, 2);
		Collections.sort(list, new MyComparator());
		for(int i=0;i<list.size();i++)
		{
			ArrayList<Object> obj=list.get(i);
			int userID=(int) obj.get(0);
			float score=(float) obj.get(1);
			System.out.println(userID+" "+score);
		}
	}
	
	//生成推荐列表，传入当前用户ID和歌曲ID
	public ArrayList<ArrayList<Object>> getRecList(int curUser,int itemID)
	{
		ArrayList<Integer> typeIDList=itemTypedao.getTypeByItem(itemID);
		ArrayList<Integer> userList=itemTypedao.getUserList(curUser);
		
		for(int j=0;j<userList.size();j++)
		{
		  float resultScore=0;
		  int userID=userList.get(j);
		  for(int i=0;i<typeIDList.size();i++)   // same type list
		  {
			int typeID=typeIDList.get(i);
			float r1=itemTypedao.getSumScoreByUserType(curUser, typeID);
			float r2=itemTypedao.getSumScoreByUserType(userID, typeID);
			float scoreInSameType=getTypeScore(r1,r2,typeID);
			
			ArrayList<ArrayList<Object>> sameTypelist=itemTypedao.getSameItemsByType(curUser, userID, typeID);
			float scoreInSameTypeSameItem=getTypeSameScore(sameTypelist,(float)0.6);
			
			ArrayList<ArrayList<Object>> differentTypelist=itemTypedao.getSameItemsinOtherType(curUser, userID, typeID);
			float scoreInDifferentTypeSameItem=getTypeSameScore(differentTypelist,(float)0.1);
			
			//System.out.println(scoreInSameType+" "+scoreInSameTypeSameItem+" "+scoreInDifferentTypeSameItem);
			resultScore+=scoreInSameType;//0.3
			resultScore+=scoreInSameTypeSameItem;//0.6
			resultScore+=scoreInDifferentTypeSameItem;//0.1
		  }
		  String s=String.format("%.2f", resultScore);
		  ArrayList<Object> list=new ArrayList<Object>();
		  list.add(userID);
		  list.add(Float.parseFloat(s));		  
		  result.add(list);
		}
		return result;		
	}
	

	// same type and same item score
	private float getTypeSameScore(ArrayList<ArrayList<Object>> list,float arg)
	{
		float sum=0;
		float p =0;
		float m1 =0;
		float m2 =0;
		for(int i=0;i<list.size();i++)
		{
			ArrayList<Object> row=list.get(i);
			int itemID=(int)row.get(0);
			float r1=Float.parseFloat(row.get(2).toString());
			float r2=Float.parseFloat(row.get(4).toString());
			float averageRating=itemTypedao.getAverageRatingByItem(itemID);
			p +=Math.abs(r1-averageRating)*Math.abs(r2-averageRating);
			m1 +=Math.pow(r1-averageRating, 2);
			m2 +=Math.pow(r2-averageRating, 2);		 		
		}
		if(m1*m2!=0)
			sum=p/(float)Math.sqrt(m1*m2);
		sum=(float) (sum*arg);
		return sum;
	}
	
	// same type and different item score
	private float getTypeScore(float r1,float r2,int typeID)
	{
		float averageRating=itemTypedao.getAverageRatingByType(typeID);
		float p=Math.abs(r1-averageRating)*Math.abs(r2-averageRating);
		float m1 =(float) Math.pow(r1-averageRating, 2);
		float m2 =(float) Math.pow(r2-averageRating, 2);	
		float sum=0;
		if(m1*m2!=0)
			sum=p/(float)Math.sqrt(m1*m2);
		return (float) (sum*0.3);
	}
	 
	
	
}
