<%@page import="com.db.GetConnection"%>
<%@page import="com.dao.BookDao_Impl"%>
<%@page import="com.entity.book_details"%>
<%@page import="com.entity.user"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/lbook.jpg");
	height: 70vh;
	widhth: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f3e5f5;
}

.button-container {
	display: flex;
	gap: 10px;
	justify-content: center;
	flex-wrap: wrap;
	align-items: center;
}

.btn {
	width: 20%;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	padding: 0;
}
</style>
</head>
<body style="background-color: #ede7f6">

	<%
	user u = (user) session.getAttribute("userobj");
	%>

	<%@include file="AllComponent/NavBar.jsp"%>
	<div class="container-fluid back-img">
		<h1 class="text-center text-white fst-italic "
			style="font-family: Matura MT Script Capitals; font-size: 60px">"Your Next Great Book is Just a Click Away."
		</h1>
	</div>


	<!---Recent Book --->
	<div class="container">
		<h3 class="text-center p-3"  style="color: #311b92">Recent Books</h3>
		<div class="row p-2">

			<%
			BookDao_Impl dao2 = new BookDao_Impl(GetConnection.connect());
			List<book_details> list = dao2.getRecentBook();

			for (book_details ob : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=ob.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=ob.getBookname()%></p>
						<p><%=ob.getAuthor()%></p>
						<p>
							<%
							if (ob.getCategory().equals("Old")) {
							%>
							Category :<%=ob.getCategory()%></p>
						<div class="row text-center">
							<p>
								Price : <b><%=ob.getPrice()%> <i
									class="fa-solid fa-indian-rupee-sign"></i></b>
							</p>
							<div class="button-container">
								<a href="viewbook.jsp?bid=<%=ob.getBook_id() %>" type="submit"
									class="btn btn-custom btn-sm"  style="height:40px;width:30%;"> View Details</a>
							</div>
						</div>

						<%
						} else {
						%>
						Category :<%=ob.getCategory()%></p>
						<p>
							Price : <b><%=ob.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></b>
						</p>
						<div class="row">
						
						<%
							if (u == null) {
							%>
							<div class="button-container p-2">
								<a href="login.jsp" type="submit" class="btn btn-custom btn-sm">
									<i class="fa-solid fa-cart-shopping"></i> Cart
								</a>
							</div>
							<%
							} else {
							%>
							<div class="button-container p-2">
								<a href="Cart?bid=<%=ob.getBook_id()%>&&uid=<%=u.getId()%>"
									type="submit" class="btn btn-custom btn-sm"> <i
									class="fa-solid fa-cart-shopping"></i> Cart
								</a>
							</div>
							<%
							}
							%>
						
						
							<div class="button-container">
								 <a href="viewbook.jsp?bid=<%=ob.getBook_id()%>" type="submit"
									class="btn btn-custom btn-sm"  style="height:40px;width:30%;"> View Details</a> 
									<a href="Buy.jsp" type="submit" class="btn bt-custom btn-sm">Buy</a>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center offset-md-6 p-2"
			style="height: 50px; width: 30%">
			<a href="all_recentbook.jsp" class="btn bt-custom btn-sm">View
				All</a>
		</div>
	</div>
	<!---End recent Book --->

	<!---New Book --->

	<hr>
	<div class="container">
		<h3 class="text-center p-2"  style="color: #311b92">New Books</h3>
		<div class="row p-2">

			<%
			BookDao_Impl dao = new BookDao_Impl(GetConnection.connect());
			List<book_details> li = dao.getNewBook();

			for (book_details b : li) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getCategory()%></p>
						<p>
							Price : <b><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></b>
						</p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<div class="button-container p-2">
								<a href="login.jsp" type="submit" class="btn btn-custom btn-sm">
									<i class="fa-solid fa-cart-shopping"></i> Cart
								</a>
							</div>
							<%
							} else {
							%>
							<div class="button-container p-2">
								<a href="Cart?bid=<%=b.getBook_id()%>&&uid=<%=u.getId()%>"
									type="submit" class="btn btn-custom btn-sm"> <i
									class="fa-solid fa-cart-shopping"></i> Cart
								</a>
							</div>
							<%
							}
							%>
							<div class="button-container">
								<a href="viewbook.jsp?bid=<%=b.getBook_id()%>" type="submit"
									class="btn btn-custom btn-sm"  style="height:40px;width:30%;">View Details</a> 
									<a href="Buy.jsp" type="submit" class="btn bt-custom btn-sm">Buy</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
	<div class="text-center offset-md-6 p-2"
		style="height: 50px; width: 30%">
		<a href="all_newbook.jsp" class="btn bt-custom btn-sm">View All</a>
	</div>
	</hr>
	<!---End New Book --->


	<!---Old Book --->
	<hr>
	<div class="container">
		<h3 class="text-center p-2"  style="color: #311b92">Old Books</h3>
		<div class="row">

			<%
			BookDao_Impl dao3 = new BookDao_Impl(GetConnection.connect());
			List<book_details> ai = dao3.getOldBook();

			for (book_details bk : ai) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=bk.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=bk.getBookname()%></p>
						<p><%=bk.getAuthor()%></p>
						<p>
							Category :<%=bk.getCategory()%></p>
						<p>
							Price : <b><%=bk.getPrice()%></b>
						</p>
						<div class="button-container">
							<a href="" type="submit" class="btn btn-custom btn-sm"> <i
								class="fa-solid fa-cart-shopping"></i> Cart
							</a> <a href="viewbook.jsp?bid=<%=bk.getBook_id()%>" type="submit"
								class="btn btn-custom btn-sm"  style="height:40px;width:30%;"> View Details</a> 
						</div>

					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>

		<div class="text-center offset-md-6 p-2"
			style="height: 50px; width: 30%">
			<a href="all_oldbook.jsp" class="btn bt-custom btn-sm">View All</a>
		</div>
	</div>
	<!---End Old Book --->
	<div style="margin-top: 300px">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>