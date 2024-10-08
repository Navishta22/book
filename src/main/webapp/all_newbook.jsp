<%@page import="com.db.GetConnection"%>
<%@page import="com.dao.BookDao_Impl"%>
<%@page import="com.entity.book_details"%>
<%@page import="com.entity.user"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Books</title>
<style type="text/css">
.back-img {
	background: url("img/lbook.jpg");
	height: 70vh;
	widhth: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f3e5f5;
}

.button-container {
	display: flex;
	gap: 10px;
	justify-content: center;
	flex-wrap: wrap;
	align-items: center;
}

.btn {
	width: 20%;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	padding: 0;
}
</style>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #ede7f6">
	
	<%
	user u = (user) session.getAttribute("userobj");
	%>


	<%@include file="AllComponent/NavBar.jsp"%>
	<div class="container-fluid p-3">
    <h3 class="text-center p-3" style="color: #311b92">
        <i>New Books</i>
    </h3>

    <c:if test="${not empty addcart}">
        <p class="text-center" style="font-size:50px;color: #311b92; font-family:sans-serif;">${addcart}</p>
        <c:remove var="addcart" scope="session" />
    </c:if>

    <c:if test="${not empty fail}">
        <p class="text-center text-success" style="font-size:50px; color: #311b92;">${fail}</p>
        <c:remove var="fail" scope="session" />
    </c:if>

    <div class="row">
        <%
        BookDao_Impl dao = new BookDao_Impl(GetConnection.connect());
        List<book_details> li = dao.getAllNew();
        
        for (book_details b : li) {
        %>
        <div class="col-md-3 col-sm-6 mb-4"> <!-- Adjust column size for responsiveness -->
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="Books/<%=b.getPhoto()%>"
                         style="width: 100px; height: 150px" class="img-thumblin">
                    <h5 class="card-title"><%=b.getBookname()%></h5>
                    <p class="card-text">Author: <%=b.getAuthor()%></p>
                    <p class="card-text">Category: <%=b.getCategory()%></p>
                    <p class="card-text">
                        Price: <b><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></b>
                    </p>
                    <div class="button-container">
                        <%
                        if (u == null) {
                        %>
                        <a href="login.jsp" class="btn btn-custom btn-sm">
                            <i class="fa-solid fa-cart-shopping"></i> Cart
                        </a>
                        <%
                        } else {
                        %>
                        <a href="Cart?bid=<%=b.getBook_id()%>&uid=<%=u.getId()%>" class="btn btn-custom btn-sm">
                            <i class="fa-solid fa-cart-shopping"></i> Cart
                        </a>
                        <%
                        }
                        %>
                        <a href="viewbook.jsp?bid=<%=b.getBook_id()%>"class="btn btn-custom btn-sm" style="height:40px;width:30%;">View Details</a>
                        <a href="Buy.jsp" class="btn bt-custom btn-sm">Buy</a>
                    </div>
                </div>
            </div>
        </div>
        <%
        }
        %>
    </div>
</div>

	<div style="margin-top: 300px">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>