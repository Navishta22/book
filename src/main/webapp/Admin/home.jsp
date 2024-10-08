<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Home</title>
<%@include file="AllCss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color:black;
}

a:hover{
text-decoration: none;
color:black;
}
</style>
</head>
<body style="background-color: #ede7f6">
	<%@include file="NavBar.jsp"%>
	
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="AddBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-circle-plus fa-3x text-primary"></i>
							<h4>Add Books</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
			<a href="AllBook.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-book-open fa-3x text-danger"></i>
						<h4>All Books</h4>
						-----------------
					</div>
				</div>
				</a>
			</div>



			<div class="col-md-3">
			<a href="Order.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-box-open fa-3x text-warning"></i>
						<h4>Orders</h4>
						-----------------
					</div>
				</div>
				</a>
			</div>



			<div class="col-md-3">
				<a data-bs-toggle="modal" data-bs-target="#exampleModal">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
						<h4>Log-Out</h4>
						-----------------
					</div>
				</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- logout modal -->

<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<div class="text-center">
			<h4  style="color: #311b92">Are you sure you want to log out?</h4>
				<button type="button" class="btn btn-custom"
					data-bs-dismiss="modal">Close</button>
				<a href="../logout" type="button" class="btn btn-custom">Log-Out</a>
			</div>	
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!--end logout  -->
<div style="margin-top:290px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>