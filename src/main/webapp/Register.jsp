<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ink-Credible : Register</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color:#ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center"  style="color: #311b92">Register Here!!!</h3>
					
					<c:if test="${not empty msg}">
					<p class="text-center text-success" style="color: #311b92 ">${msg}</p>
					<c:remove var="msg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty failmsg }">
					<p class="text-center text-danger" >${failmsg}</p>
					<c:remove var="failmsg" scope="session"/>
					</c:if>
					
					
						<form action="RegisterServlet" method="post">
							<div class="mb-3">
							<input type="hidden" name=operation value="register">
								<label for="exampleInputEmail1" class="form-label">Name : </label> 
								<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="name">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email : </label> 
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password : </label>
								<input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password" >
									
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone No : </label> 
								<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phoneno">
							</div>
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" id="exampleCheck1" name="check"> 
								<label class="form-check-label" for="exampleCheck1">Agree Terms Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="AllComponent/footer.jsp" %>
</body>
</html>