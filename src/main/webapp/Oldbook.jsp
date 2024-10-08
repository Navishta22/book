<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@page import="com.entity.book_details"%>
<%@page import="com.db.GetConnection"%>
<%@page import="com.dao.BookDao_Impl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Old book</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>

	<c:if test="${not empty succmsg}">
		<div class="alert-alert-success text-center " style="color: #311b92;Font-size:20px">${succmsg}</div>

		<c:remove var="succmsg" scope="session" />
	</c:if>

	<c:if test="${not empty fail }">
		<p class="text-center text-danger">${fail}</p>
		<c:remove var="fail" scope="session" />
	</c:if>


	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-custom text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				user u = (user) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDao_Impl dao = new BookDao_Impl(GetConnection.connect());
				List<book_details> ob = dao.getBookbyOld(email, "Old");

				for (book_details b : ob) {
				%>
				<tr>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getCategory()%></td>
					<td><a
						href="deleteoldbook?em=<%=email%>&&id=<%=b.getBook_id()%>"
						class="btn btn-custom">Delete</a></td>
				</tr>


				<%
				}
				%>




			</tbody>
		</table>
	</div>
</body>
</html>