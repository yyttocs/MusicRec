package com.sh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.model.ItemBeanCl;
import com.sh.model.UserBeanCl;

/**
 * Servlet implementation class UserDelete
 */
public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDelete() {
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
		String UserID = request.getParameter("UserID");
		int userID=Integer.parseInt(UserID);
		UserBeanCl userBeanCl=new UserBeanCl();
		boolean result=userBeanCl.deleteByID(userID);
		if(result)
		{
			request.setAttribute("success", "success");
	    	request.getRequestDispatcher("adminUserDelete.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("error", "error");
	    	request.getRequestDispatcher("adminUserDelete.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
