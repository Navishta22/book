package com.dao;

import java.util.List;

import com.entity.book_details;

public interface BookDao {

	public int AddBooks(book_details ob);
	
	public List<book_details> getAllbooks();

	public book_details getbookById(int id);
	
	public int updatebook(book_details ob);
	
	public int deletebook(int id);
	
	public List<book_details> getNewBook();
	
	public List<book_details> getRecentBook();
	
	public List<book_details> getOldBook();
	
	public List<book_details> getAllRecent();
	
	public List<book_details> getAllNew();
	
	public List<book_details> getAllOld();
	
	public List<book_details> getBookbyOld(String email,String Categ);
	
	public int OldBookDelete(String email,String Categ,int id);
	
	public List<book_details> getBookbySearch(String ch);
}
