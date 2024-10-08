<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ink-Credible : Login</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body  style="background-color:#ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center"  style="color: #311b92">Log-In</h3>
					
					
					<c:if test="${not empty failmsg }">
					<p class="text-center text-danger">${failmsg}</p>
					<c:remove var="failmsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty succmsg }">
					<h4 class="text-center" style="color: #311b92 ">${succmsg}</h4>
					<c:remove var="succmsg" scope="session"/>
					</c:if>
					
					
						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email :</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
								
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password :</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
						
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Login</button><br>
							<a href="Register.jsp">Create Account</a>
							</div>
							
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<%@include file="AllComponent/footer.jsp" %>
</body>
</html>