<%@page import="com.entity.user"%>
<%@page import="com.db.GetConnection"%>
<%@page import="com.dao.BookDao_Impl"%>
<%@page import="com.entity.book_details"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style type="text/css">
.button-container {
	display: flex;
	gap: 10px;
	justify-content: center;
	flex-wrap: wrap;
	align-items: center;
}

.btn {
	width: 20%;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	padding: 0;
}
</style>
</head>
<body style="background-color: #ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>

<%
	user u = (user) session.getAttribute("userobj");
	%>

	<%
	int id = Integer.parseInt(request.getParameter("bid"));
	BookDao_Impl dao = new BookDao_Impl(GetConnection.connect());
	book_details ob = dao.getbookById(id);
	%>



	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Books/<%=ob.getPhoto()%>"
					style="height: 150px; width: 120px"><br>
				<h4 class="mt-3">
					Book Name :<span class="text-primary"><%=ob.getBookname()%></span>
				</h4>
				<h4>
					Author Name : <span class="text-primary"><%=ob.getAuthor()%></span>
				</h4>
				<h4>
					Price :<span class="text-primary"><%=ob.getPrice()%> <i
						class="fa-solid fa-indian-rupee-sign"></i></span>
				</h4>
				<h4>
					Category : <span class="text-primary"><%=ob.getCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<div class="row">
					<h2><%=ob.getBookname()%></h2>
					<%
					if ("Old".equals(ob.getCategory())) {
					%>
					<h5 class="text-primary">Contact To Seller</h5>
					<h5 class="text-primary">
						<i class="fa-regular fa-envelope"></i> Email :
						<%=ob.getEmail()%></h5>
					<%
					}
					%>
					<div class="row">
						<div class="col-md-4 text-danger text-center p-2">
							<i class="fa-solid fa-money-bill-wave fa-3x"></i>
							<p>Cash On Delivery</p>
						</div>
						<div class="col-md-4 text-danger text-center p-2">
							<i class="fa-solid fa-rotate-left fa-3x"></i>
							<p>Return Available</p>
						</div>
						<div class="col-md-4 text-danger text-center p-2">
							<i class="fa-solid fa-truck fa-3x"></i>
							<p>Free Shipping</p>
						</div>
					</div>

					<%
					if ("Old".equals(ob.getCategory())) {
					%>
					<div class="row">
						<div class="button-container">
							<a href="index.jsp" type="submit" class="btn btn-custom btn-sm"  style="width:40%; height:50px; font-size:20px">Continue Shopping
							</a>
						</div>
					<%
					}else{%>
						
					<div class="row">
						<div class="button-container">
							<a href="Cart?bid=<%=ob.getBook_id()%>&uid=<%=u.getId()%>" class="btn btn-custom btn-sm">
                            <i class="fa-solid fa-cart-shopping"></i> Cart
                        </a>
							  <a href="Buy.jsp" class="btn bt-custom btn-sm">Buy</a>
						</div>
					</div>
					<%}
					%>



</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>