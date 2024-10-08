<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #9575cd"></div>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<h3>
				<i class="fa-solid fa-book-open-reader"></i> Ebooks
			</h3>
		</div>
		
		
		<div class="col-md-3">
			<c:if test="${not empty userobj}">
				<a  class="btn bt-custom">
				 <i class="fa-solid fa-user-tie"></i> ${userobj.name}
				</a>

				<a data-bs-toggle="modal" data-bs-target="#exampleModal"
					class="btn bt-custom"> <i class="fa-solid fa-right-to-bracket"></i>
					Log-Out
				</a>
			</c:if>

			<c:if test="${empty userobj}">
				<a href="../login.jsp" class="btn bt-custom">
				<i class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="../Register.jsp" class="btn btn-custom"><i
					class="fa-solid fa-user-plus"></i> Register</a>

			</c:if>
		</div>
	</div>
</div>

<!-- logout modal -->

<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<div class="text-center">
			<h4>Are you sure you want to log out?</h4>
				<button type="button" class="btn btn-custom" data-bs-dismiss="modal">Close</button>
				<a href="../logout" type="button" class="btn btn-custom">Log-Out</a>
			</div>	
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!--end logout  -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"
		style="color: #f4f5f6;"></i> </a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="home.jsp">Home</a></li>
		</ul>
	</div>

</nav>