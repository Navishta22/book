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
	width: 30%;
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
	<div class="container-fluid p-3">
	<h3 class="text-center p-3"  style="color: #311b92"><i>Old Books</i></h3>
		<div class="row p-2">
				<%
			BookDao_Impl dao3 = new BookDao_Impl(GetConnection.connect());
			List<book_details> ai = dao3.getAllOld();

			for (book_details bk : ai) 
			{%>
				<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="Books/<%=bk.getPhoto() %>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=bk.getBookname()%></p>
						<p><%=bk.getAuthor() %></p>
						<p>Category :<%=bk.getCategory() %></p>
						<p>
							Price : <b><%=bk.getPrice()%></b>
						</p>
						<div class="button-container">

							<a href="viewbook.jsp?bid=<%=bk.getBook_id()%>" type="submit" class="btn btn-custom btn-sm">
								View Details</a>
							
						</div>

					</div>
				</div>
			</div>
				
			<%}
			%>
		
			</div>
		</div>
		<div style="margin-top: 300px">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>