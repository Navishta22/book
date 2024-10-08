package com.dao;

import java.util.List;

import com.entity.Cart;

public interface cartDao {

	public int addcart(Cart c);
	
	public List<Cart> getBookByuser(int userId);
	
	public int deletebook(int bid,int uid,int cid);
	
}
