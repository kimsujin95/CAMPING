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
</style>
</head>
<body>
	<form action="boardinput" method="post">
		<div class="popup_layer" style="top: 300px; left: 10px;">
			<div class="pop_in">
				<table class="table table-striped table-dark">
					<thead class="thead-dark">
						<tr>
							<th scope="col" colspan="2">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="col" class="th">제목 :</th>
							<td><input type="text" name="title" style="width: 100%"></td>
						</tr>
						<tr>
							<th scope="col" class="th">내용:</th>
							<td><textarea style="width: 100%" rows="5" name="memo"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="hidden" name="id"
								value="${sessionScope.userid }"><input type="hidden"
								name="urid" value="${sessionScope.userid }">
								<button type="submit" class="btn btn-info">작성하기</button>
								&emsp;&emsp;<a href="${pageContext.request.contextPath}/adminboardList"> 
								<button type="button" class="btn btn-info">뒤로가기</button>
							</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>