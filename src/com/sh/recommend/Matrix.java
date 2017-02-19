package com.sh.recommend;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;


public class Matrix {
	private Map<Integer,Map<Integer,Float>> user_item;

	public Matrix(Map<Integer,Map<Integer,Float>> user_item)
	{
		this.user_item=user_item;
	}
	
	public void setMatrix(int user,int item,float rate)
	{
		Map<Integer,Float> itemRateMap;
		boolean flag=false;
		
		if(this.user_item==null)
		{
			this.user_item=new HashMap<Integer,Map<Integer,Float>>();
		}
		
		if(user_item.containsKey(Integer.valueOf(user))&&(itemRateMap=this.user_item.get(Integer.valueOf(user))).isEmpty())
		{
			itemRateMap.put(item, rate);
		}
		else if(user_item.containsKey(Integer.valueOf(user)))
		{
			itemRateMap=new HashMap<Integer,Float>();
			this.user_item.put(user, itemRateMap);			
		}
	}
	
	public void setMatrix(int user,Map<Integer,Float> itemRateMap)
	{
		if(this.user_item==null)
		{
			this.user_item=new HashMap<Integer,Map<Integer,Float>>();
		}
		if(this.user_item.containsKey(Integer.valueOf(user)))
		{
			itemRateMap=new HashMap<Integer,Float>();
			this.user_item.put(user, itemRateMap);			
		}
	}
	
	public Map<Integer,Map<Integer,Float>> getMatrix()
	{
		return this.user_item;
	}
	//得到用户评价矩阵的用户ID向量
	public Vector<Integer> getUser()
	{
		Vector<Integer> users=new Vector<Integer>();
		if(this.user_item!=null)
		{
			for(int i:this.user_item.keySet())
				users.add(i);
		}
		return users;
	}
	//获得指定用户某个项目的评分
	public float getRate(int user,int item)
	{
		float rate=99;   //若用户没有对该项目评分，则设置为无效值99
		Map<Integer,Float> itemRateMap;
		
		if(this.user_item!=null)
		{
			if(this.user_item.containsKey(user))
			{
				itemRateMap=this.user_item.get(Integer.valueOf(user));
				if(itemRateMap.containsKey(item))
					rate=itemRateMap.get(Integer.valueOf(item));
			}	
		}
		return rate;
	}
	//获得指定用户的评价列表
	public Map<Integer,Float> getItemRate(int user)
	{
		Map<Integer,Float> itemRateMap=null;
		if(this.user_item!=null)
		{
			if(this.user_item.containsKey(user))
				itemRateMap=this.user_item.get(Integer.valueOf(user));
		}
		return itemRateMap;
	}

	public  Map<Integer,Vector<Float>> getCommonItem(int item_i,int item_j)
	{
		Map<Integer,Vector<Float>> CommonItem=new HashMap<Integer,Vector<Float>>();
		Map.Entry<Integer,Map<Integer,Float>> entry=null;
		Iterator<Map.Entry<Integer,Map<Integer,Float>>> it=user_item.entrySet().iterator();
		while(it.hasNext())
		{
			entry=it.next();
			int userID=entry.getKey();
			Map<Integer,Float> map=entry.getValue();
			if(map.containsKey(item_i) && map.containsKey(item_j))
			{
				float rate1=map.get(item_i);
				float rate2=map.get(item_j);
				Vector<Float> v=new Vector<Float>();
				v.add(rate1);
				v.add(rate2);
				CommonItem.put(userID, v);
			}
		}
		if(CommonItem.size()==0)
			return null;
		return CommonItem;
	}

	/*
	public  Map<Integer,Vector<Float>> getCommonItem(int user_i,int user_j)
	{
		
		Map<Integer,Float> itemMap1=null,itemMap2=null;
		Iterator<Map.Entry<Integer, Float>> irt;
		Map.Entry<Integer, Float> entry;
 		Map<Integer,Vector<Float>> CommonItem=new HashMap<Integer,Vector<Float>>();
		Vector<Float> rate;
		int item;
		
		if(this.user_item!=null)
		{
			if(this.user_item.containsKey(Integer.valueOf(user_i))&&this.user_item.containsKey(Integer.valueOf(user_j)))
			{
					itemMap1=this.user_item.get(Integer.valueOf(user_i));
					itemMap2=this.user_item.get(Integer.valueOf(user_j));	
			}
			
			if(itemMap1!=null&&itemMap2!=null)
			{
				irt=itemMap1.entrySet().iterator();
				while(irt.hasNext())
				{
					entry=irt.next();
					item=entry.getKey();
					if(itemMap2.containsKey(Integer.valueOf(item)))
					{
							rate=new Vector<Float>();
							rate.add(itemMap1.get(Integer.valueOf(item)));
							rate.add(itemMap2.get(Integer.valueOf(item)));
							CommonItem.put(item, rate);
					}				
				}
			}
		}
		return CommonItem;		
	}
*/
	
	//获得指定用户的平均评价值
	public float getUserAvgRate(int user)
	{
		float avgRate=0,sum=0,rate;
		Map<Integer,Float> itemMap1=null;
		Iterator<Map.Entry<Integer, Float>> irt;
		
		if(this.user_item!=null)
		{	
			if(this.user_item.containsKey(Integer.valueOf(user)))
					itemMap1=this.user_item.get(Integer.valueOf(user));
			
			if(itemMap1!=null)
			{
				irt=itemMap1.entrySet().iterator();
				while(irt.hasNext())
				{
					rate=irt.next().getValue();
					sum+=rate;
				}
				avgRate=sum/itemMap1.size();
			}	
		}
		return avgRate;
	}
	//获得指定两个用户的共同项目评分的平均值
	public float[] getUserAvg(int user_i,int user_j,Map<Integer,Vector<Float>> CommonItem)
	{
		float [] avgRate={0,0};
		float sum_i=0,sum_j=0;
		int size;
		
		Iterator<Map.Entry<Integer, Vector<Float>>> irt;
		Map.Entry<Integer, Vector<Float>> entry;
		
		if(CommonItem!=null)
		{	
			irt=CommonItem.entrySet().iterator();
			while(irt.hasNext())
			{
				entry=(Map.Entry<Integer, Vector<Float>>)irt.next();
				sum_i+=entry.getValue().elementAt(0);
				sum_j+=entry.getValue().elementAt(1);
			}
			size=CommonItem.size();
			avgRate[0]=sum_i/size;
			avgRate[1]=sum_j/size;
		}
		return avgRate;
	}
	//输出用户评价矩阵
	public void printMatrix()
	{
		Map<Integer,Float> itemMap1;
		Iterator<Map.Entry<Integer,Map<Integer,Float>>> user;
		Iterator<Map.Entry<Integer, Float>> irt;
		Map.Entry<Integer,Float> entry;
		if(this.user_item!=null)
		{
			user=this.user_item.entrySet().iterator();
			while(user.hasNext())
			{
				int userID=user.next().getKey();
				System.out.println("\n"+userID+":");
				
				itemMap1=this.user_item.get(Integer.valueOf(userID));
				irt=itemMap1.entrySet().iterator();
				while(irt.hasNext())
				{
					entry=(Map.Entry<Integer, Float>)irt.next();	
					System.out.print(entry.getKey()+","+entry.getValue()+";\t");
				}
			}
		}
	}
	//输出item—rating
	public void printMap1(Map<Integer,Float> map)
	{
		Iterator<Map.Entry<Integer,Float>> irt;		
		Map.Entry<Integer,Float> entry;
		
		irt=map.entrySet().iterator();
		while(irt.hasNext())
		{
			entry=(Map.Entry<Integer, Float>)irt.next();
			System.out.println(entry.getKey()+":("+entry.getKey()+","+entry.getValue()+")");
		}
	}
	//输出item—ratings
	public void printMap2(Map<Integer,Vector<Float>> map)
	{
		Iterator<Map.Entry<Integer, Vector<Float>>> irt;
		irt=map.entrySet().iterator();
		
		Map.Entry<Integer, Vector<Float>> entry;
		while(irt.hasNext())
		{
			entry=(Map.Entry<Integer, Vector<Float>>)irt.next();
			System.out.println(entry.getKey()+":("+entry.getValue().elementAt(0)+","+entry.getValue().elementAt(1)+")");
		}
	}
	
}
