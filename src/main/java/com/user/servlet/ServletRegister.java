package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SQL_Queries;
import com.db.GetConnection;
import com.entity.user;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class ServletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegister() {
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
	
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phoneno=request.getParameter("phoneno");
		String check=request.getParameter("check");
		
		HttpSession session=request.getSession();
		
		if(check!=null)
		{
			user ob=new user();
			
			ob.setName(name);
			ob.setEmail(email);
			ob.setPassword(password);
			ob.setPhoneno(phoneno);
			
			SQL_Queries sq=new SQL_Queries(GetConnection.connect());
			
			boolean f=sq.CheckUser(email);
			
			if(f)
			{
				int status=sq.Register(ob);
				
				
				if(status==1)
				{
					session.setAttribute("msg", "Registration Successfully");
					response.sendRedirect("Register.jsp");
				}
				else {
					session.setAttribute("failmsg", "Error in Reigstration!!! Try Again");
					response.sendRedirect("Register.jsp");
				}
			}
			else {
				session.setAttribute("failmsg", "User Already Exist Try another Email ID");
				response.sendRedirect("Register.jsp");
			}
		}
		else {
			session.setAttribute("failmsg", "Please firstly Agree Terms & Conditions");
			response.sendRedirect("Register.jsp");
			}
	}

}