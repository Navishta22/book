package com.entity;

public class Cart {

	private int cid;
	private int bid;;
	private int userId;
	private String book_name;
	private String author;
	private Double price;
	private Double total_price;
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}
	public Cart(int cid, int bid, int userId, String book_name, String author, Double price, Double total_price) {
		super();
		this.cid = cid;
		this.bid = bid;
		this.userId = userId;
		this.book_name = book_name;
		this.author = author;
		this.price = price;
		this.total_price = total_price;
	}
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
