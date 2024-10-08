<%@page import="com.dao.BookDao_Impl"%>
<%@page import="com.db.GetConnection"%>
<%@page import="com.entity.book_details"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:AllBook</title>
<%@include file="AllCss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	<%@include file="NavBar.jsp"%>
	
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<h3 class="text-center"  style="color: #311b92">Hello Admin</h3>

	<c:if test="${not empty succmsg}">
		<h5 class="text-center text-success">${succmsg}</h5>
		<c:remove var="succmsg" scope="session" />
	</c:if>

	<c:if test="${not empty failmsg}">
		<h5 class="text-center text-danger">${failmsg}</h5>
		<c:remove var="failmsg" scope="session" />
	</c:if>

	<table class="table">
		<thead class="bg-custom text-white">
			<tr>
				<th scope="col">Book Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDao_Impl b = new BookDao_Impl(GetConnection.connect());
			List<book_details> li = b.getAllbooks();

			for (book_details ob : li) {
			%>
			<tr>
				<td><%=ob.getBook_id()%></td>
				<td><img src="../Books/<%=ob.getPhoto()%>"
					style="width: 70px; height: 100px;"></td>
				<td><%=ob.getBookname()%></td>
				<td><%=ob.getAuthor()%></td>
				<td><%=ob.getPrice()%></td>
				<td><%=ob.getCategory()%></td>
				<td><%=ob.getStatus()%></td>
				<td><a href="edit_book.jsp?id=<%=ob.getBook_id()%>"
					class="btn btn-custom"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
					
					 <a href="../delete?id=<%=ob.getBook_id() %>" class="btn btn-custom"><i class="fa-solid fa-trash"></i> Delete</a></td>
			</tr>

			<%
			}
			%>

		</tbody>
	</table>
	<div style="margin-top: 300px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>