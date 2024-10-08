package com.entity;

public class book_details {

	private int book_id;
	private String bookname;
	private String author;
	private double price;
	private String category;
	private String status;
	private String photo;
	private String email;
	
	public book_details() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public book_details(int book_id, String bookname, String author, double price, String category, String status,
			String photo, String email) {
		super();
		this.book_id = book_id;
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.category = category;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}


	public int getBook_id() {
		return book_id;
	}


	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}


	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "book_details [bookid=" + book_id + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", category=" + category + ", status=" + status + ", photo=" + photo + ", email=" + email + "]";
	}
	
	
	
}
