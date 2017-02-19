//完成对用户身份的验证


package com.sh.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sh.model.*;

public class LoginClServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String u = request.getParameter("username");
		
		//u = new String(u.getBytes("ios-8859-1"),"gb2312");
		String p = request.getParameter("passwd");

		UserBeanCl ubc = new UserBeanCl();
		int uId = ubc.getUserID(u);
		if (ubc.checkUser(u, p)) {
			//将用户名放入session
			request.getSession().setAttribute("MyName", u);
			request.getSession().setAttribute("MyId", uId);
			
			//request.getRequestDispatcher("wel.jsp?first=1&second=1").forward(request, response);
			request.getRequestDispatcher("wel1.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
		
	}

}
