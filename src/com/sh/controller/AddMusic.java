package com.sh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.model.AdminBeanCl;
import com.sh.model.ItemBeanCl;
import com.sh.model.ItemType;

/**
 * Servlet implementation class AddMusic
 */
public class AddMusic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMusic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String ItemName = request.getParameter("ItemName");
		String ItemSong = request.getParameter("ItemSong");
		String MusicName = request.getParameter("MusicName");
		String Singer = request.getParameter("Singer");
		String Type = request.getParameter("Type");
		String[] types=Type.split("#");				
		ItemBeanCl itemBeanCl=new ItemBeanCl();
		boolean x=itemBeanCl.addMusic(ItemName, ItemSong, MusicName, Singer);
		if(x)
		{
		  int itemID=itemBeanCl.getItemID(ItemName);
		  ItemType itemType=new ItemType();
		  if(itemID!=-1)
		  {
			  
			for(int i=0;i<types.length;i++)
			{
				int type=Integer.parseInt(types[i]);
				itemType.add(itemID, type);
			}
		    request.setAttribute("success", "success");
		    request.getRequestDispatcher("adminMusic.jsp").forward(request, response);

		  }
		  else
		  {
				request.setAttribute("error", "error");
		    	request.getRequestDispatcher("adminMusic.jsp").forward(request, response);
		  }
		}
		else
		{
			request.setAttribute("error", "error");
	    	request.getRequestDispatcher("adminMusic.jsp").forward(request, response);
		}
		
       
	}

}
