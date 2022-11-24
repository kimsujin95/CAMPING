<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Welcome to Korea camping</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<!--------------------------------------메인 이미지 슬라이드------------------------------------------------->

<!--------------------------------------------------------------------------------------->
<style>
body {
	background: #808080;
}

.carousel {
	width: 90%;
	margin: auto;
}

.ul {
	text-align: right;
}
}
hr{
background-color: maroon;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" style="color: white;">[메인페이지]</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="addrsearch">캠핑장리스트<span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="boardList">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="UserList?myid=${sessionScope.userid }">[마이페이지]</a></li>
				
				<li class="nav-item"><a class="nav-link" href="logout"style="color: white;">[로그아웃]</a></li>
				
			</ul>
		</div>
	</nav>
	<!-- 	<h1 align="center"> -->
	<!-- 		<span class="badge badge-#808080">Welcome to Korea camping</span> -->
	<!-- 	</h1> -->
	
		<hr>
	<div align="right" class="loginuser">
		<p style="color: white; ">로그인 유저 :${sessionScope.username } / ID : ${sessionScope.userid }&emsp;&emsp;</p>
	</div>
		<hr>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100 center-block"
					src="${pageContext.request.contextPath}/resources/image/main1.jpg"
					width="50px" height="750px" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100 center-block"
					src="${pageContext.request.contextPath}/resources/image/main2.jpg"
					width="50px" height="750px" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100 center-block"
					src="${pageContext.request.contextPath}/resources/image/main3.jpg"
					width="50px" height="750px" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<%-- 	<img width="200px" height="200px" src="${pageContext.request.contextPath}/resources/image/main3.jpg" class="rounded float-left" alt="..."> --%>
	<%-- 	<img width="200px" height="200px" src="${pageContext.request.contextPath}/resources/image/main3.jpg" class="rounded float-right" alt="..."> --%>
</body>
</html>