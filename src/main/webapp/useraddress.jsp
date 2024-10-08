<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Address Edit PAge</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h4 style="color: #311b92" class="text-center">Add Address</h4>
						<form action="RegisterServlet" method="post">
							<div class="mb-3">
							<input type="hidden" name=operation value="register">
								<label for="exampleInputEmail1" class="form-label">Address : </label> 
								<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="address">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">City : </label> 
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="city">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">State : </label>
								<input type="password" class="form-control" id="exampleInputPassword1" required="required" name="state" >
									
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Pincode: </label> 
								<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="pincode">
							</div>
							</div>
							<div>
							<button type="submit" class="btn btn-primary text-center">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 300px">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>