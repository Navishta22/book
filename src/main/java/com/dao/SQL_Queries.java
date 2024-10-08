package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.db.GetConnection;
import com.entity.user;

public class SQL_Queries implements user_impl{

	private Connection conn;
	
	public SQL_Queries(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public int Register(user ob) 
	{
		int status=0;
		
		String sql="insert into user(name,email,password,phoneno) values(?,?,?,?)";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, ob.getName());
			ps.setString(2, ob.getEmail());
			ps.setString(3, ob.getPassword());
			ps.setString(4, ob.getPhoneno());
			
			status=ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return status;
	}



	public user login(String email,String password)
	{
		user us=null;
		
		Connection conn=GetConnection.connect();
		
		String sql="select * from user where email=? and password=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				us=new user();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhoneno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setCity(rs.getString(7));
				us.setState(rs.getString(8));
				us.setPincode(rs.getString(9));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		return us;
	}

	@Override
	public boolean CheckPassword(int id,String password)
	{
		boolean f=false;
		
		String sql="select * from user where id=? and password=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				f=true;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public int updateprofile(user us) 
	{
		int status=0;
		
		String sql="update user set name=?,email=?,phoneno=? where id=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			ps.setInt(4, us.getId());
			
			status=ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public boolean CheckUser(String em) 
	{
		boolean f=true;
		
		String sql="select * from user where email=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				f=false;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return f;
	}
}
