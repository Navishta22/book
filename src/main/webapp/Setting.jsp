<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: #311b92;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #ede7f6">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<%@include file="AllComponent/NavBar.jsp"%>
	<div class="container">
	<h3 style="color: #311b92" class="text-center p-2"><i>Heyy ${userobj.name}</i></h3>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sellbook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div>
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>
						</div>

					</div>

				</a>
			</div>
			
			
			<div class="col-md-4">
				<a href="Oldbook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div>
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h3>Old Book</h3>
						</div>

					</div>

				</a>
			</div>
			
			
			
			<div class="col-md-4">
				<a href="EditProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div>
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>

					</div>

				</a>
			</div>
		
			
				<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div>
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track Your Order</p>
						</div>

					</div>

				</a>
			</div>
			
			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div>
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>

					</div>

				</a>
			</div>
			
			
		</div>

	</div>
	
	<div style="margin-top: 300px">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>