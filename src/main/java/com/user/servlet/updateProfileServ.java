package com.user.servlet;

import java.io.IOException;
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
 * Servlet implementation class updateProfileServ
 */
@WebServlet("/UpdateProfile")
public class updateProfileServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateProfileServ() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneno = request.getParameter("phoneno");

		user us = new user();
		us.setId(id);
		us.setName(name);
		us.setEmail(email);
		us.setPhoneno(phoneno);

		SQL_Queries dao = new SQL_Queries(GetConnection.connect());
		boolean f = dao.CheckPassword(id, password);

		HttpSession session=request.getSession();
		
		if (f) {
			int status = dao.updateprofile(us);

			if (status == 1) 
			{
				session.setAttribute("update", "Profile Updated Successfully");
				response.sendRedirect("EditProfile.jsp");
			} 
			else
			{
				session.setAttribute("updatefail", "Unable to update your profile please try Again.");
				response.sendRedirect("EditProfile.jsp");
			}
		} else
		{
			session.setAttribute("fail", "Password is incorrect");
			response.sendRedirect("EditProfile.jsp");
		}
	}

}
