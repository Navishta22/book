package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDao_Impl;
import com.dao.CartDao_Impl;
import com.db.GetConnection;
import com.entity.Cart;
import com.entity.book_details;

/**
 * Servlet implementation class CartServ
 */
@WebServlet("/Cart")
public class CartServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid=Integer.parseInt(request.getParameter("bid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		
		BookDao_Impl dao=new BookDao_Impl(GetConnection.connect());
		book_details b=dao.getbookById(bid);
		
		Cart c=new Cart();
		c.setBid(bid);
		c.setUserId(uid);
		c.setBook_name(b.getBookname());
		c.setAuthor(b.getAuthor());
		c.setPrice(b.getPrice());
		c.setTotal_price(b.getPrice());
		
		CartDao_Impl dao2=new CartDao_Impl(GetConnection.connect());
		int status=dao2.addcart(c);
		
		HttpSession session=request.getSession();
		
		
		if(status==1)
		{
			session.setAttribute("addcart", "Added to Cart");
			response.sendRedirect("all_newbook.jsp");
		}
		else {
			session.setAttribute("fail", "Unable to Add to Cart");
			response.sendRedirect("all_newbook.jsp");
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
