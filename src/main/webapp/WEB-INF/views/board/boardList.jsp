<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Welcome to Korea camping</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>
body {
	background: #808080;
}

.table {
	width: 85%;
	position: relative;
	top: 10px;
	margin: auto;
	text-align: center;
}

.tbody {
	background: white;
}

.tfoot {
	background: black;
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
				<li class="nav-item"><a class="nav-link"
					href="UserList?myid=${sessionScope.userid }">[마이페이지]</a></li>

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
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">시간</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody class="tbody">
			<c:forEach items="${boardList}" var="vo" varStatus="status">
				<tr>
					<th scope="row" style="width: 4%">${status.count+pageVO.perPageNum *(pageVO.page -1)}</th>
					<td style="width: 50%"><a href="boardView?boardvalue=${vo.no }">${vo.title}</a></td>
					<td style="width: 10%">${vo.id}</td>
					<td style="width: 15%">${vo.day.substring(0,16)}</td>
					<td style="width: 6%">${vo.cnt}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot class="tfoot">
			<tr style="color: black;">
				<th colspan="5"><a href="boardpage"><button type="button" class="btn btn-info">글쓰기</button></a></th>
			</tr>
		</tfoot>
	</table>
</body>
</html>
<!-- 
create table board(
no number(5) primary key,
id varchar2(20),
title varchar2(100) not null,
memo varchar2(500) not null,
urid varchar2(20),
cnt number(10),
day timestamp default sysdate,
foreign key(urid) references cpuser(id)
);
create sequence board_seq;
 -->