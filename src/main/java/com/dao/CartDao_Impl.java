package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.book_details;

public class CartDao_Impl implements cartDao{

	private Connection conn;
	
	public CartDao_Impl(Connection conn)
	{
		this.conn=conn;
	}
	
	@Override
	public int addcart(Cart c)
	{
		int status=0;
		
		String sql="insert into cart(bid,uid,book_name,author,price,total_price) values(?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBook_name());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotal_price());
			
			status=ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public List<Cart> getBookByuser(int userId) 
	{
		List<Cart> li=new ArrayList<Cart>();
		
		Cart ob=null;
		
		double total_price=0;
		
		String sql="select * from cart where uid=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, userId);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new Cart();
				
				ob.setCid(rs.getInt(1));
				ob.setBid(rs.getInt(2));
				ob.setUserId(rs.getInt(3));
				ob.setBook_name(rs.getString(4));
				ob.setAuthor(rs.getString(5));
				ob.setPrice(rs.getDouble(6));
				
				total_price=total_price+rs.getDouble(7);
				ob.setTotal_price(total_price);
				
				li.add(ob);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public int deletebook(int bid,int uid,int cid) 
	{
		int status=0;
		
		String sql="delete from cart where bid=? and uid=? and cid=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			status=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return status;
	}

}
