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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		SQL_Queries sq=new SQL_Queries(GetConnection.connect());
		
		HttpSession session=request.getSession();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		if("admin@gmail.com".equals(email) && "admin".equals(password))
		{
			user us=new user();
			us.setName("Admin");
			session.setAttribute("userobj", us);
			response.sendRedirect("Admin/home.jsp");
		}else {
			
			user us=sq.login(email, password);
			if(us!=null)
			{
				session.setAttribute("userobj", us);
				response.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute("failmsg", "Invalid Details!!! Enter Right Email & Password");
				response.sendRedirect("login.jsp");
			}
		}
	}

}
