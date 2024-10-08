<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>
	
	<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container mt-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center" style="color: #311b92">Sell Old Books</h4>
						
							<c:if test="${not empty succmsg}">
					<p class="text-center text-success">${succmsg}</p>
					<c:remove var="succmsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty failmsg}">
					<p class="text-center text-danger">${failmsg}</p>
					<c:remove var="failmsg" scope="session"/>
					</c:if>
						
						
						<form action="addOldBook" method="post" enctype="multipart/form-data">
						
						<input type="hidden" value="${userobj.email}" name="user">
						
							<div class="form-control">
								<input type="hidden" name=operation value="register"> 
								<label for="exampleInputEmail1" class="form-label">Book Name :</label>
								 <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="name">
								<br>
							</div>

							<div class="form-control">
								<label for="exampleInputEmail1" class="form-label">Author
									Name : </label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="author"> <br>
							</div>

							<div class="form-control">
								<label for="exampleInputPassword1" class="form-label">Price
									: </label> <input type="number" class="form-control"
									id="exampleInputPassword1" required="required" name="price">
								<br>
							</div>



							<div class="form-control">
								<label for="exampleInputPassword1" class="form-label">Upload
									Photo : </label> <input type="file" class="form-control"
									id="exampleInputPassword1" required="required" name="img">
							</div>
							<br>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>