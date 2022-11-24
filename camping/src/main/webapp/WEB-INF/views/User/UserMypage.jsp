<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Welcome to Korea camping</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
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
<title>Insert title here</title>
<style>
body {
	background: #808080;
}

.table {
	width: 30%;
	position: relative;
	top: 50px;
	margin: auto;
	text-align: center;
}

.th {
	background: dark;
}

hr {
	background-color: black;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" style="color: white;">[마이페이지]</a>
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
				<li class="nav-item"><a class="nav-link"
					href="UserList?myid=${sessionScope.userid }" style="color: white;">[마이페이지]</a></li>

				<li class="nav-item"><a class="nav-link" href="logout"
					style="color: white;">[로그아웃]</a></li>

			</ul>
		</div>
	</nav>
	<hr>
	<div align="right" class="loginuser">
		<p style="color: white;">로그인 유저 :${sessionScope.username } / ID :
			${sessionScope.userid }&emsp;&emsp;</p>
	</div>
	<hr>
	<form action="UserMod" method="get">
		<div class="popup_layer" style="top: 300px; left: 10px;">
			<div class="pop_in">
				<table class="table table-striped table-dark">
					<thead class="thead-dark">
						<tr>
							<th scope="col" colspan="2">${UserList.name }님의정보</th>
						</tr>
					</thead>
					<tr align="center">
						<th scope="col">회원 등급 :</th>
						<td><p>${UserList.rating }</p></td>
					</tr>
					<tr>
						<th scope="col" class="th">이 름 :</th>
						<td><p>${UserList.name }</p></td>
					</tr>
					<tr>
						<th scope="col" class="th">아 이 디 :</th>
						<td><p>${UserList.id }</p></td>
					</tr>
					<tr>
						<th scope="col" class="th">비밀번호 :</th>
						<td><p>${UserList.pwd }</p></td>
					</tr>
					<tr>
						<th scope="col" class="th">가입일자 :</th>
						<td><p>${UserList.day }</p></td>
					</tr>
					<tr>
						<td colspan="2"><a href="UserMod?userinfor=${UserList.id }"><button
									type="button" class="btn btn-info">수정하기</button></a><input
							type="hidden" name="id" value="${UserList.id }"></td>
					</tr>

				</table>
			</div>
		</div>
	</form>

</body>
</html>