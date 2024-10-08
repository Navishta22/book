
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	<%@include file="AllComponent/NavBar.jsp"%>
	<%
	user u=(user) session.getAttribute("userobj");
	%>
	<div class="container text-center mt-3">
		<i class="fa-solid fa-circle-check fa-5x" style="color: #311b92"></i>
		<h1 style="color: #311b92">${userobj.name } Thank you for your purchase!</h1>
		<h2 style="color: #311b92">Your order has been successfully Placed.</h2>
		<h5 style="color: #311b92">Within 7 Days Your Product will be Delivered.</h5>
		<a href="index.jsp" class="btn bt-custom"
			style="width: 90px; height: 40px; font-size: 20px"><b><i>Home</i></b></a>
		<h2 style="color: #311b92"><i>Enjoy your reading!</i></h2>
	</div>
</body>
</html>