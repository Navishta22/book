<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>

<div class="container-fluid"
	style="height: 10px; background-color: #9575cd"></div>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<h3 style="font-family: Matura MT Script Capitals; color: #311b92;font-size: 40px">
				<i class="fa-solid fa-book-open-reader"></i> booksGalore
			</h3>
		</div>
		<div class="col-md-6">
			<form class="d-flex" action="Search.jsp">
				<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-custom" type="submit" style="width: 20%; height: 50px; font-size: 18px;">Search</button>
			</form>
		</div>
		
		<c:if test="${not empty userobj}">
		<div class="col-md-3 button-container">
		<a href="Checkout.jsp" ><i class="fa-solid fa-cart-shopping fa-2x" style="color: #311b92 "></i></a>
			<a href="login.jsp" class="btn btn-custom" style="width: 160px; height: 40px; font-size: 15px">
			<i class="fa-solid fa-user-plus"></i> ${userobj.name}</a>
				
				
			<a href="logout" class="btn bt-custom" style="width: 120px; height: 40px; font-size: 15px"> 
			<i class="fa-solid fa-right-to-bracket"></i> Log-Out</a>
		</div>
		
		</c:if>
		
		<c:if test="${empty userobj }">
		
	
		<div class="col-md-3 button-container">
		<a href="Checkout.jsp" ><i class="fa-solid fa-cart-shopping fa-2x" style="color: #311b92 "></i></a>
		
			<a href="login.jsp" class="btn btn-custom" style="width: 90px; height: 40px; font-size: 15px">
			<i class="fa-solid fa-right-to-bracket"></i> Login</a>
				
				
			<a href="Register.jsp" class="btn bt-custom" style="width: 120px; height: 40px; font-size: 15px"> 
			<i class="fa-solid fa-user-plus"></i> Register</a>
		</div>
		
		</c:if>
		

	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<a class="navbar-brand" href="#"> <i class="fa-solid fa-house p-2"
		style="color: #f4f5f6;"></i>
	</a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="index.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="all_recentbook.jsp"><i class="fa-solid fa-book-open"></i>
					Recent Books</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="all_newbook.jsp"><i class="fa-solid fa-book-open"></i> New
					Books</a></li>

			<li class="nav-item active"><a class="nav-link active"
				href="all_oldbook.jsp"><i class="fa-solid fa-book-open"></i> Old
					Books</a></li>
		</ul>
	
		<div style="display: flex; justify-content: flex-end;">
    <a href="Setting.jsp" class="btn btn-custom mr-10" type="button"
       style="width: 100px; height: 40px; font-size: 15px; margin-left: auto;"
       aria-label="Go to Settings">
       <i class="fa-solid fa-gear"></i> Settings
    </a>
</div>


		</form>

	</div>

</nav>