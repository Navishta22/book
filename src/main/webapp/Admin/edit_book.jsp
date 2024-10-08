<%@page import="com.dao.BookDao_Impl"%>
<%@page import="com.db.GetConnection"%>
<%@page import="com.entity.book_details"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Edit AddBook</title>
<%@include file="AllCss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	<%@include file="NavBar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 style="text-align: center"  style="color: #311b92">Edit Information</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDao_Impl dao = new BookDao_Impl(GetConnection.connect());
						book_details ob = dao.getbookById(id);
						%>

						<form action="../editbook" method="post">
						<input type="hidden" name="id" value="<%=ob.getBook_id()%>">
							<div class="form-control">
								<input type="hidden" name=operation value="register"> <label
									for="exampleInputEmail1" class="form-label">Book Name :
								</label> <input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="name"
									value="<%=ob.getBookname()%>"> <br>
							</div>

							<div class="form-control">
								<label for="exampleInputEmail1" class="form-label">Author
									Name : </label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="author" value="<%=ob.getAuthor()%>">
								<br>
							</div>

							<div class="form-control">
								<label for="exampleInputPassword1" class="form-label">Price
									: </label> <input type="number" class="form-control"
									id="exampleInputPassword1" required="required" name="price"
									value="<%=ob.getPrice()%>"> <br>
							</div>


							<div class="form-control">
								<label for="inputstore">Book Status : </label> <select
									id="inputstore" name="status" class="form-control">
									<%
									if ("Active".equals(ob.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select> <br>
							</div>

							<br>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>