package com.sh.recommend;

import java.util.Vector;
import com.sh.model.UserBeanCl;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;
import java.util.Map.Entry;


public class Ibcf {
	//***************************************基于项目的协同过滤算法预测用户评分*****************************
	private static Matrix user_item;
	private static Vector<Integer> users;
	private static int count=0;
	private Vector<Integer> items;
	private float simThreshold;   //项目近邻的相似度阈值
	
	//获取测试用户集
	public void getTestUser() {
		UserBeanCl b = new UserBeanCl();
		users = b.getTestUser();
		System.out.println("*IBCF:There are "+users.size()+" users");
	}	
	
	//根据项目所属类别创建用户_项目评分矩阵
	public int setupMatrix() {
		
		int rn=-1;
        Map<Integer,Map<Integer,Float>> user_items=new HashMap<Integer,Map<Integer,Float>>();
        Map<Integer,Float> userMap;	
        UserBeanCl b = new UserBeanCl();
        items = b.getTestItem();
        user_items = b.getUser_items();   //     
        user_item=new Matrix(user_items); //创建用户_项目评分矩阵
        if(!user_item.getMatrix().isEmpty()) 
        	rn=0; 
        
        return rn;  //成功返回0，不成功返回-1
	}
	
	//采用pearson的相关性公式计算两个项目之间的相似度
	 public float getItemSimality(int item_i,int item_j) {
		 float p=0,m1=0,m2=0;
		 simThreshold = (float)0.7;
		 float itemSim=this.simThreshold-1;  //默认设置为小于相似度阈值
		 float rate1,rate2;
		 float [] averageRate={0,0};       
		 
		 Map<Integer,Vector<Float>> CommonUser=null;
		 Vector<Float> userRate;
		 
		 CommonUser=user_item.getCommonItem(item_i, item_j);  //获取对这两个项都有评分的用户集
		 if(CommonUser!=null)
		 {		
			 averageRate=user_item.getUserAvg(item_i, item_j, CommonUser);  //共评用户对这两个项目的平均评分	
			 
			//计算两个项目之间的相似度
			 for (int user:CommonUser.keySet())
			 {
				 userRate=CommonUser.get(Integer.valueOf(user));
				 rate1=userRate.elementAt(0);
				 rate2=userRate.elementAt(1);
				 
				 p +=(rate1-averageRate[0])*(rate2-averageRate[1]);
				 m1 +=Math.pow(rate1-averageRate[0], 2);
				 m2 +=Math.pow(rate2-averageRate[1], 2);		 
			 }
			 if(m1*m2!=0)
				 itemSim=p/(float)Math.sqrt(m1*m2);
		  }  
		 return itemSim; //返回两项目之间的相似度
	 }
	 
	 public static void main(String [] args)
	 {
		 new Ibcf().setupMatrix();
		 System.out.println(new Ibcf().getItemSimality(6, 11));
	 }
	
		 
		 
	//计算并获取某个项目的近邻项目
	 public Map<Integer,Float> getNeighbourItem(int Item)
	 {
		  float itemSim;
		  int size=items.size();  //所有被评价过的项目的数目
		  int ID;
		  
		  Map<Integer,Float> itemSimMap=new HashMap<Integer,Float>();
		//  System.out.print(simThreshold);
		  for(int i=0;i<size;i++)
		  {
			  ID=items.elementAt(i);
			  if(ID!=Item){
				   itemSim=getItemSimality(Item, ID);   //计算两项目之间的相似度
				   if(itemSim>=simThreshold)            //获取相似度大于预定阈值，则纳入邻域范围
					   itemSimMap.put(ID, itemSim);
				   else
					   continue;
			  }  
		  }
//		  System.out.println("*IBCF: item neighbour has been found!");
		  return itemSimMap;          //如果没有近邻就为空
	}
	 
	
		 
		 
	//采用基于项目的方法，预测某用户对某项目的评分，对于无近邻项目，取平均评分
	 public  float predictOnItem(int user,int item,Map<Integer,Float> neighbourItem) {
		  float rate,prediction;
		  int neighbour;
		  float sum=0,product=0,avgRate;
			
		  Map.Entry<Integer, Float> entry;	  
		  Iterator<Map.Entry<Integer, Float>> irt=neighbourItem.entrySet().iterator();
		  
		  avgRate=user_item.getUserAvgRate(item);  //该项目在所有评的用户中的平均评分
		  
		  while(irt.hasNext())  //若还有近邻，继续
		  { 
			  entry=(Map.Entry<Integer, Float>)irt.next();
			  neighbour=entry.getKey();
				
			  if(Math.abs((rate=user_item.getRate(user,neighbour))-99)<Math.pow(10, -5))  //获取用户对近邻项目的评分
				  continue;
				
			  product+=rate*entry.getValue();
			  sum+=entry.getValue();
		  }
		  if(sum!=0)
			  prediction=product/sum;   //预测评分值
		  else
			  prediction=avgRate;  //如果该项目没有近邻，则设置为其他用户对它的平均评分
				  			  
			return prediction;	  
	}
	 //基于项目协同过滤算法产生推荐列表
	public Map<Integer,Float> recommended (int user) {

		Map<Integer,Float> itemRec1 = new HashMap<Integer,Float>();
		Map<Integer,Float> itemRec2 = new HashMap<Integer,Float>();
		itemRec2 = user_item.getItemRate(user);
		Vector<Integer> items1 = new UserBeanCl().getTestItem();
		Iterator<Map.Entry<Integer,Float>> irt;		
		Map.Entry<Integer,Float> entry;
		
		irt=itemRec2.entrySet().iterator();
		
		while(irt.hasNext())
		{
			entry=(Map.Entry<Integer, Float>)irt.next();
			items1.remove(entry.getKey());//  获得用户未评分列表
		}
		int i = 0;
		float f = (float)0.0;
		while(!items1.isEmpty()) {
			
			f = predictOnItem(user,items1.elementAt(i),getNeighbourItem(items1.elementAt(i)));
			itemRec1.put(items1.elementAt(i), f);
			items1.remove(items1.elementAt(i));
		}
	//	user_item.printMap1(itemRec1);
	//	Top_N (itemRec1);
		return itemRec1;
	} 
	
	public void Top_N (Map<Integer,Float> itemRec) {
		
		UserBeanCl ubc = new UserBeanCl();
		Set<Entry<Integer, Float>> set = new TreeSet<Entry<Integer, Float>>(
                new Comparator<Entry<Integer, Float>>() {
   
                    public int compare(Entry<Integer, Float> o1, Entry<Integer, Float> o2) {
                        return o2.getValue().compareTo(o1.getValue());
                    }//比较器 排序
                });
        set.addAll(itemRec.entrySet());
        int i= 0;
        int im = 0;
        String s = "";
        for (Entry<Integer, Float> entry : set) {
        	i++;
        	if(i <= 10) {
        	im = entry.getKey();
        	s = ubc.getItemInfo(im);
            System.out.println(entry.getKey() + "\t" +s + "\t" + entry.getValue());
        	}
            else break;
        }

	}

	 	 
}
