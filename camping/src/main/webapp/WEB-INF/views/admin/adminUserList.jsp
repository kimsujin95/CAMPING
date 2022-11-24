<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
body {
	background: #808080;
}

.table {
	width: 85%;
	position: relative;
	top: 40px;
	margin: auto;
}

hr {
	background-color: maroon;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" style="color: white;">[관리자페이지]</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="adminaddrsearch">캠핑장리스트<span
						class="sr-only"></span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="adminboardList">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="adminUserList">회원전체보기</a></li>
				<li class="nav-item"><a class="nav-link" href="logout"
					style="color: white;">[로그아웃]</a></li>
			</ul>
		</div>
	</nav>
	<!-- 	<h1 align="center"> -->
	<!-- 		<span class="badge badge-#808080">Welcome to Korea camping</span> -->
	<!-- 	</h1> -->
	<hr>
	<div align="right" class="loginuser">
		<p style="color: white;">로그인 유저 : ${sessionScope.username }&emsp;&emsp;</p>
	</div>
	<hr>

	<div class="popup_layer" style="top: 300px left: 10px">
		<div class="pop_in">

			<table class="table table-striped table-dark">
				<thead>
					<tr align="center">
						<th scope="col">관리자: 1 /회원: 0</th>
						<th scope="col">이름</th>
						<th scope="col">아이디</th>
						<th scope="col">비밀번호</th>
						<th scope="col">수정 및 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${UserList}" var="us" varStatus="status">
						<tr align="center">
							<td>${us.rating }</td>
							<td>${us.name }</td>
							<td>${us.id }</td>
							<td>${us.pwd }</td>
							<td><a href="adminUserMod?userinfor=${us.id}"
								style="color: white;">[수정]</a> / <a
								href="userdel?userdel=${us.id }" style="color: white;">[삭제]</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>