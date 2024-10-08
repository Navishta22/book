<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h4 class="text-center" style="color: #311b92">Edit Profile</h4>
					
					<c:if test="${not empty updatefail }">
					<p class="text-center text-danger">${updatefail}</p>
					<c:remove var="updatefail" scope="session"/>
					</c:if>
					
					<c:if test="${not empty update }">
					<h4 class="text-center" style="color: #311b92 ">${update}</h4>
					<c:remove var="update" scope="session"/>
					</c:if>
					
					<c:if test="${not empty fail }">
					<p class="text-center text-danger">${fail}</p>
					<c:remove var="fail" scope="session"/>
					</c:if>
					
					<form action="UpdateProfile" method="post">
							<div class="mb-3">
							<input type="hidden" name="id" value="${userobj.id}">
								<label for="exampleInputEmail1" class="form-label">Name : </label> 
								<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="name" value="${userobj.name}">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email : </label> 
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email" value="${userobj.email}">
							</div>
							
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone No : </label> 
								<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phoneno" value="${userobj.phoneno}">
							</div>
							
							
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password : </label>
								<input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password" >
									
							</div>
						
							<button type="submit" class="btn btn-primary">Update</button>
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