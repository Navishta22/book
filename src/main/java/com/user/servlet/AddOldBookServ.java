package com.user.servlet;

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
 * Servlet implementation class AddOldBookServ
 */
@WebServlet("/addOldBook")
@MultipartConfig
public class AddOldBookServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOldBookServ() {
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
		String category="Old";
		String status="Active";
		Part part=request.getPart("img");
		String filename=part.getSubmittedFileName();
		String useremail=request.getParameter("user");
				
		book_details ob=new book_details();
		
		ob.setBookname(bookname);
		ob.setAuthor(author);
		ob.setPrice(price);
		ob.setCategory(category);
		ob.setStatus(status);
		ob.setPhoto(filename);
		ob.setEmail(useremail);
		
		BookDao_Impl b=new BookDao_Impl(GetConnection.connect());
		
		int stat=b.AddBooks(ob);	
		HttpSession session=request.getSession();
		
		if(stat==1)
		{
		String path=getServletContext().getRealPath("")+"Books";
		File file=new File(path);
		
		part.write(path+File.separator + filename);							
			session.setAttribute("succmsg", "Book Selled Successfully!!!");
			response.sendRedirect("sellbook.jsp");
		}
		else {
			session.setAttribute("failmsg", "Try Again Re-enter the fields!!!");
			response.sendRedirect("sellbook.jsp");
		}
		
	}
	}


