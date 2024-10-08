package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderDao_Impl implements BookOrderDao{

private Connection conn;
	
	public BookOrderDao_Impl (Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean SaveOrder(List<Book_Order> b)
	{
		boolean f=false;
		
		String sql="insert into book_order(order_id,user_name,email,address,phoneno,book_name,author,price,payment) Values(?,?,?,?,?,?,?,?,?)";
		
		try {
			conn.setAutoCommit(false);
			
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(Book_Order ob: b)
			{
				ps.setString(1, ob.getOrder_id());
				ps.setString(2, ob.getUser_name());
				ps.setString(3, ob.getEmail());
				ps.setString(4, ob.getFulladd());
				ps.setString(5, ob.getPhoneno());
				ps.setString(6, ob.getBook_name());
				ps.setString(7, ob.getAuthor());
				ps.setDouble(8, ob.getPrice());
				ps.setString(9, ob.getPayment());
				
				ps.addBatch();
			}
			
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<Book_Order> getBook(String email)
	{
		List<Book_Order> li=new ArrayList<Book_Order>();
		
		Book_Order ob=null;
		
		String sql="select * from book_order where email=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, email);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new Book_Order();
				
				ob.setId(rs.getInt(1));
				ob.setOrder_id(rs.getString(2));
				ob.setUser_name(rs.getString(3));
				ob.setEmail(rs.getString(4));
				ob.setFulladd(rs.getString(5));
				ob.setPhoneno(rs.getString(6));
				ob.setBook_name(rs.getString(7));
				ob.setAuthor(rs.getString(8));
				ob.setPrice(rs.getDouble(9));
				ob.setPayment(rs.getString(10));
				
				li.add(ob);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
		return li;
	}


	@Override
	public List<Book_Order> getAllOrder() 
	{

		List<Book_Order> li=new ArrayList<Book_Order>();
		
		Book_Order ob=null;
		
		String sql="select * from book_order";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new Book_Order();
				
				ob.setId(rs.getInt(1));
				ob.setOrder_id(rs.getString(2));
				ob.setUser_name(rs.getString(3));
				ob.setEmail(rs.getString(4));
				ob.setFulladd(rs.getString(5));
				ob.setPhoneno(rs.getString(6));
				ob.setBook_name(rs.getString(7));
				ob.setAuthor(rs.getString(8));
				ob.setPrice(rs.getDouble(9));
				ob.setPayment(rs.getString(10));
				
				li.add(ob);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
		return li;
	}

	
}
