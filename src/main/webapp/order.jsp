<%@page import="java.awt.print.Book"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookOrderDao_Impl"%>
<%@page import="com.db.GetConnection"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #ede7f6">

<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="AllComponent/NavBar.jsp"%>
	<div class="container">
		<h3 style="color: #311b92" class="text-center mt-2">Your Order</h3>
		<table class="table table-striped mt-5">
			<thead class="bg-custom text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				user u = (user) session.getAttribute("userobj");
				BookOrderDao_Impl dao = new BookOrderDao_Impl(GetConnection.connect());
				List<Book_Order> li = dao.getBook(u.getEmail());
				for (Book_Order ob : li) {
				%>

				<tr>
					<th scope="row"><%=ob.getOrder_id() %></th>
					<td><%=ob.getUser_name() %></td>
					<td><%=ob.getBook_name() %></td>
					<td><%=ob.getAuthor() %></td>
					<td><%=ob.getPrice()%></td>
					<td><%=ob.getPayment() %></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>


	</div>
	<div style="margin-top: 400px">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>