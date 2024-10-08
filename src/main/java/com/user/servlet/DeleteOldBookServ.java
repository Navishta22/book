package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDao_Impl;
import com.db.GetConnection;

/**
 * Servlet implementation class DeleteOldBookServ
 */
@WebServlet("/deleteoldbook")
public class DeleteOldBookServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOldBookServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("em");
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		BookDao_Impl dao=new BookDao_Impl(GetConnection.connect());
		int status=dao.OldBookDelete(email, "Old",id);
		
		HttpSession session=request.getSession();
		
		if(status==1)
		{
			session.setAttribute("succmsg", "Deleted Old book Successfully");
			response.sendRedirect("Oldbook.jsp");
		}
		else {
			session.setAttribute("fail", "Fail to Delete");
			response.sendRedirect("Oldbook.jsp");
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
