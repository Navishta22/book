package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.book_details;

public class BookDao_Impl implements BookDao{

	private Connection conn;
	
	public BookDao_Impl(Connection conn) {
		super();
		this.conn = conn;
	}
	@Override
	public int AddBooks(book_details ob) 
	{
		int status=0;
		
		String sql="insert into book_details(book_name,author,price,category,status,photo,user_email)values(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, ob.getBookname());
			ps.setString(2, ob.getAuthor());
			ps.setDouble(3, ob.getPrice());
			ps.setString(4, ob.getCategory());
			ps.setString(5, ob.getStatus());
			ps.setString(6, ob.getPhoto());
			ps.setString(7, ob.getEmail());
			
			status=ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return status;
	}
	@Override
	public List<book_details> getAllbooks() 
	{
		List<book_details> li=new ArrayList<book_details>();
		
		book_details ob=null;
		
		String sql="select * from book_details";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				li.add(ob);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return li;
	}
	@Override
	public book_details getbookById(int id) 
	{
		book_details ob=new book_details();
		
		String sql="select * from book_details where book_id=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return ob;	
	}
	@Override
	public int updatebook(book_details ob)
	{
		int status=0;
		
		String sql="update book_details set book_name=?,author=?,price=?,status=? where book_id=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, ob.getBookname());
			ps.setString(2, ob.getAuthor());
			ps.setDouble(3, ob.getPrice());
			ps.setString(4, ob.getStatus());
			ps.setInt(5, ob.getBook_id());
			
			status=ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return status;
	}
	@Override
	public int deletebook(int id) 
	{
		int status=0;
		
		String sql="delete from book_details where book_id=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			status=ps.executeUpdate();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return status;
	}
	
	
	@Override
	public List<book_details> getNewBook()
	{
		List<book_details> li=new ArrayList<book_details>();
		
		book_details ob=null;
		
		String sql="select * from book_details where category=? and status=? order by book_id DESC ";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			int i = 1;
			
			while(rs.next() && i<=4)
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				li.add(ob);
				
				i++;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return li;
	}
	@Override
	public List<book_details> getRecentBook() 
	{
		List<book_details> li=new ArrayList<book_details>();
		
		book_details ob=null;
		
		String sql="select * from book_details where status=? order by book_id DESC";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			int i=1;
			
			while(rs.next() && i<=4)
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				li.add(ob);
				
				i++;	
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return li;
	}
	@Override
	public List<book_details> getOldBook() {
		
		List<book_details> li=new ArrayList<book_details>();
		
		book_details ob=null;
		
		String sql="select * from book_details where category=? and status=? order by book_id DESC ";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			int i=1;
			
			while(rs.next() && i<=4)
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				li.add(ob);
				
				i++;	
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return li;
	}
	
	@Override
	public List<book_details> getAllRecent() 
	{
		List<book_details> li=new ArrayList<book_details>();
		
		book_details ob=null;
		
		String sql="select * from book_details where status=? order by book_id DESC";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				li.add(ob);
					
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return li;
	}
	
	@Override
	public List<book_details> getAllNew() {
		
		List<book_details> li=new ArrayList<book_details>();
		
		book_details ob=null;
		
		String sql="select * from book_details where category=? and status=? order by book_id DESC ";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				li.add(ob);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return li;
	}
	@Override
	public List<book_details> getAllOld()
	{
		
		List<book_details> li=new ArrayList<book_details>();
		
		book_details ob=null;
		
		String sql="select * from book_details where category=? and status=? order by book_id DESC ";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				li.add(ob);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return li;
	}
	@Override
	public List<book_details> getBookbyOld(String email, String Categ)
	{
		List<book_details> li=new ArrayList<book_details>();
		book_details ob=null;
		
		String sql="select * from book_details where category=? and user_email=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Categ);
			ps.setString(2, email);

			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				li.add(ob);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return li;
	}
	@Override
	public int OldBookDelete(String email, String Categ,int id)
	{
		int status=0;
		
		String sql="delete from book_details where category=? and user_email=? and book_id=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, Categ);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			status=ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return status;
	}
	@Override
	public List<book_details> getBookbySearch(String ch)
	{

		List<book_details> li=new ArrayList<book_details>();
		book_details ob=null;
		
		String sql="select * from book_details where book_name like ? or author like ?  or category like ? and status=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4,"Active");
			

			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ob=new book_details();
				
				ob.setBook_id(rs.getInt(1));
				ob.setBookname(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getDouble(4));
				ob.setCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhoto(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				li.add(ob);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return li;

	}
	
	
	
}
