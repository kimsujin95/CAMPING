<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	top: 100px;
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
	<form action="UserModlist" method="post">
		<div class="popup_layer" style="top: 300px; left: 10px;">
			<div class="pop_in">
				<table class="table table-striped table-dark">
					<thead class="thead-dark">
						<tr>
							<th scope="col" colspan="2">『 ${UserList.name} 』님 수정 페이지</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="col" class="th">회원 등릅 :</th>
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
							<td><input type="text" name="pwd" value="${UserList.pwd }"></td>
						</tr>
						<tr>
							<th scope="col" class="th">가입 일자 :</th>
							<td><p>${UserList.day }</p></td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit" class="btn btn-info">수정하기</button>&emsp;&emsp;
								<a
								href="${pageContext.request.contextPath}/UserList?myid=${UserList.id }">
									<button type="button" class="btn btn-info">뒤로가기</button>
							</a><input type="hidden" name="id" value="${UserList.id }"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>
<!-- 
create table cpuser(
rating number(1) default 0,
name varchar2(20),
id varchar2(20) primary key,
pwd varchar2(20),
day timestamp default sysdate
);


 -->