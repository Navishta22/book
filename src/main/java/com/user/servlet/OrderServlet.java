package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookOrderDao_Impl;
import com.dao.CartDao_Impl;
import com.db.GetConnection;
import com.entity.Book_Order;
import com.entity.Cart;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phoneno=request.getParameter("phoneno");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pincode=request.getParameter("pincode");
		String payment=request.getParameter("payment");
		
		String fullAddress=address+","+city+","+state+","+pincode;
		
		HttpSession session=request.getSession();
		
		CartDao_Impl dao=new CartDao_Impl(GetConnection.connect());;
		List<Cart> b=dao.getBookByuser(id);
		
		if(b.isEmpty())
		{
			
			session.setAttribute("fail", "Add Items");
			response.sendRedirect("Checkout.jsp");	
			
		}else {
			BookOrderDao_Impl dao2=new BookOrderDao_Impl(GetConnection.connect());
			Book_Order ob=null;
			
			ArrayList<Book_Order> li=new ArrayList<Book_Order>();
			
			Random r=new Random();
			
			for(Cart c : b)
			{
				ob=new Book_Order();
				
				ob.setOrder_id("BOOK-ORD-00"+r.nextInt(1000));
				ob.setUser_name(name);
				ob.setEmail(email);
				ob.setPhoneno(phoneno);
				ob.setFulladd(fullAddress);
				ob.setBook_name(c.getBook_name());
				ob.setAuthor(c.getAuthor());
				ob.setPrice(c.getPrice());
				ob.setPayment(payment);
				
				li.add(ob);
				
			}
			
			
			if("noselect".equals(payment)) 
			{
				session.setAttribute("fail", "Please Choose Your Payment Method");
			response.sendRedirect("Checkout.jsp");	
			}else {
				
				boolean f=dao2.SaveOrder(li);
				
				if(f)
				{
					response.sendRedirect("orderplace.jsp");
				}else {
					session.setAttribute("failmsg", "Failed to Place Order Please Try Again!!!");
					response.sendRedirect("Checkout.jsp");
				}
			
			
			}
		}
	}
}
