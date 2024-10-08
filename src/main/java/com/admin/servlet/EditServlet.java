package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDao_Impl;
import com.db.GetConnection;
import com.entity.book_details;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/editbook")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		
		int id=Integer.parseInt(request.getParameter("id"));
		String bookname=request.getParameter("name");
		String author=request.getParameter("author");
		double price=Double.parseDouble(request.getParameter("price"));
		String status=request.getParameter("status");
		
		book_details ob=new book_details();
		
		ob.setBook_id(id);
		ob.setBookname(bookname);
		ob.setAuthor(author);
		ob.setPrice(price);
		ob.setStatus(status);
		
		BookDao_Impl b=new BookDao_Impl(GetConnection.connect());
		int status1=b.updatebook(ob);
		
		HttpSession session=request.getSession();
		
		if(status1==1)
		{
			session.setAttribute("succmsg","Updation Successfull!!!");
			response.sendRedirect("Admin/AllBook.jsp");
		}
		else {
			session.setAttribute("failmsg","Error in Updation");
			response.sendRedirect("Admin/AllBook.jsp");
		}
		
	}

}
