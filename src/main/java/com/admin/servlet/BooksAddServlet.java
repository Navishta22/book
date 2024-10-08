package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.dao.BookDao_Impl;
import com.db.GetConnection;
import com.entity.book_details;

/**
 * Servlet implementation class BooksAddServlet
 */
@WebServlet("/AddBookServlet")
@MultipartConfig
public class BooksAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BooksAddServlet() {
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
		
		String bookname=request.getParameter("name");
		String author=request.getParameter("author");
		Double price=Double.parseDouble(request.getParameter("price"));
		String category=request.getParameter("category");
		String status=request.getParameter("status");
		Part part=request.getPart("img");
		String filename=part.getSubmittedFileName();
		String email=request.getParameter("email");
				
		book_details ob=new book_details();
		
		ob.setBookname(bookname);
		ob.setAuthor(author);
		ob.setPrice(price);
		ob.setCategory(category);
		ob.setStatus(status);
		ob.setPhoto(filename);
		ob.setEmail("admin");
		
		BookDao_Impl b=new BookDao_Impl(GetConnection.connect());
		
		int stat=b.AddBooks(ob);	
		HttpSession session=request.getSession();
		
		if(stat==1)
		{
		String path=getServletContext().getRealPath("")+"Books";
		File file=new File(path);
		
		part.write(path+File.separator + filename);							
			session.setAttribute("succmsg", "Book Added Successfully!!!");
			response.sendRedirect("Admin/AddBook.jsp");
		}
		else {
			session.setAttribute("failmsg", "Try Again Re-enter the fields!!!");
			response.sendRedirect("Admin/AddBook.jsp");
		}
		
	}

}
