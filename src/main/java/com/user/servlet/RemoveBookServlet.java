package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao_Impl;
import com.db.GetConnection;

/**
 * Servlet implementation class RemoveBookServlet
 */
@WebServlet("/remove_book")
public class RemoveBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int bid=Integer.parseInt(request.getParameter("bid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		
		CartDao_Impl dao2=new CartDao_Impl(GetConnection.connect());
		int status=dao2.deletebook(bid,uid,cid);
	
		HttpSession session=request.getSession();
		
		if(status==1)
		{
			session.setAttribute("succmsg", "Deleted From Cart");
			response.sendRedirect("Checkout.jsp");	
		}
		else {
			session.setAttribute("fail", "Failed to Delete");
			response.sendRedirect("Checkout.jsp");
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
