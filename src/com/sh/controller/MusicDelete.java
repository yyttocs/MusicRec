package com.sh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.model.ItemBeanCl;

/**
 * Servlet implementation class MusicDelete
 */
public class MusicDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String ItemID = request.getParameter("ItemID");
		int itemID=Integer.parseInt(ItemID);
		ItemBeanCl itemBeanCl=new ItemBeanCl();
		boolean result=itemBeanCl.deleteByID(itemID);
		if(result)
		{
			request.setAttribute("success", "success");
	    	request.getRequestDispatcher("adminMusicDelete.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("error", "error");
	    	request.getRequestDispatcher("adminMusicDelete.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
