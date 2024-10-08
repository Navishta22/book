package com.entity;

public class Book_Order {

	private int id;
	private String order_id;
	private String user_name;
	private  String email;
	private String phoneno;
	private String fulladd;
	private String book_name;
	private String author;
	private Double price;
	private String payment;
	
	public Book_Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", order_id=" + order_id + ", user_name=" + user_name + ", email=" + email
				+ ", phoneno=" + phoneno + ", fulladd=" + fulladd + ", book_name=" + book_name + ", author=" + author
				+ ", price=" + price + ", payment=" + payment + "]";
	}

	public Book_Order(int id, String order_id, String user_name, String email, String phoneno, String fulladd,
			String book_name, String author, double price, String payment) {
		super();
		this.id = id;
		this.order_id = order_id;
		this.user_name = user_name;
		this.email = email;
		this.phoneno = phoneno;
		this.fulladd = fulladd;
		this.book_name = book_name;
		this.author = author;
		this.price = price;
		this.payment = payment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
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

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
	

}
