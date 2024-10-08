<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.user"%>
<%@page import="com.db.GetConnection"%>
<%@page import="com.dao.CartDao_Impl"%>
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
</head>
</head>
<body style="background-color: #ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<c:if test="${not empty succmsg }">
		<div class="alert alert-success" role="alert">${succmsg }</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>


	<c:if test="${not empty fail }">
		<div class="alert alert-danger text-center" role="alert">${fail}</div>
		<c:remove var="fail" scope="session" />
	</c:if>
	
	<c:if test="${not empty failmsg }">
		<div class="alert alert-danger text-center" role="alert">${failmsg}</div>
		<c:remove var="failmsg" scope="session" />
	</c:if>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center" style="color: #311b92">Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								user u = (user) session.getAttribute("userobj");

								CartDao_Impl dao = new CartDao_Impl(GetConnection.connect());
								List<Cart> c = dao.getBookByuser(u.getId());
								double total_price = 0;
								for (Cart ca : c) {
									total_price = ca.getTotal_price();
								%>
								<tr>
									<th scope="row"><%=ca.getBook_name()%></th>
									<td><%=ca.getAuthor()%></td>
									<td><%=ca.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=ca.getBid()%>&&uid=<%=ca.getUserId()%>&&cid=<%=ca.getCid() %>"
										class="btn btn-custom">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td><b>Total Price :</b></td>
									<td></td>
									<td></td>
									<td><b><%=total_price%></b>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center" style="color: #311b92">Order Details</h3>
						<form action="order" method="post"> 
						
						<input type="hidden" value="${userobj.id }" name="id">
						
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputName">Name</label> <input type="text"
										class="form-control" id="inputName" name="name" value="${userobj.name }" required="required">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail">Email</label> <input type="email"
										class="form-control" id="inputEmail" name="email" value="${userobj.email }" required="required">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPhone">Phone No</label> <input type="number"
										class="form-control" id="inputPhone" name="phoneno" value="${userobj.phoneno }" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputAddress">Address</label> <input type="text"
										class="form-control" name="address" id="inputAddress" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" name="city" id="inputCity" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputState">State</label> <input type="text" name="state"
										class="form-control" id="inputState" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPincode">Pincode</label> <input type="number"
										class="form-control" name="pincode" id="inputPincode" required="required">
								</div>
							</div>

							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control" name="payment"
									required="required">
									<option value="noselect">---Select---</option>
									<option value="COD">Cash On Delivery (COD)</option>
									<!-- Add other options as needed -->
								</select>
							</div>
							<br>
							<div class="text-center">
								<button type="submit" class="btn btn-custom">Order Now</button>
								<a href="index.jsp" class="btn bg-custom">Continue Shopping</a>
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>



	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>