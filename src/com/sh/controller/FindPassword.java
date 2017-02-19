package com.sh.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.mail.SendMail;
import com.sh.model.UserBeanCl;

/**
 * Servlet implementation class FindPassword
 */
public class FindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPassword() {
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
		String username=request.getParameter("username");
		String email=new UserBeanCl().getEmailByName(username);
		String password=new UserBeanCl().getPasswordByName(username);
		
		System.out.println(username+" "+email+" "+password);
		if(email.length()==0)
		{
			PrintWriter out=response.getWriter();
			out.print("error");
			out.close();
		}
		else
		{
			SendMail.send(email, password);
			PrintWriter out=response.getWriter();
			out.print("1");
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
