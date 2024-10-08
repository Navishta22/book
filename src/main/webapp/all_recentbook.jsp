<%@page import="com.entity.user"%>
<%@page import="com.db.GetConnection"%>
<%@page import="com.dao.BookDao_Impl"%>
<%@page import="com.entity.book_details"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Books</title>
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
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>
	<%
	user u = (user) session.getAttribute("userobj");
	%>
	
	<div class="container-fluid p-3">
	<h3 class="text-center p-3"  style="color: #311b92"><i>Recent Books</i></h3>
		<div class="row p-2">
				<%
				BookDao_Impl dao2 = new BookDao_Impl(GetConnection.connect());
				List<book_details> list = dao2.getAllRecent();

				for (book_details ob : list) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho mt-2">
						<div class="card-body text-center">
							<img alt="" src="Books/<%=ob.getPhoto()%>"
								style="width: 100px; height: 150px" class="img-thumblin">
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
									<a href="viewbook.jsp?bid=<%=ob.getBook_id()%>"class="btn btn-custom btn-sm" style="height:40px;width:30%;">View Details</a>
									
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
								<div class="button-container">
									<a href="Cart?bid=<%=ob.getBook_id()%>&uid=<%=u.getId()%>" class="btn btn-custom btn-sm">
                            <i class="fa-solid fa-cart-shopping"></i> Cart
                        </a>
									<a href="viewbook.jsp?bid=<%=ob.getBook_id()%>"class="btn btn-custom btn-sm" style="height:40px;width:30%;">View Details</a>
									 <a href="Buy.jsp" class="btn bt-custom btn-sm">Buy</a>
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
		</div>
		<div style="margin-top: 300px">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>