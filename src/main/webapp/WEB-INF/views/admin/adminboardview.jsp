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
	width: 80%;
	position: relative;
	top: 40px;
	margin: auto;
}

.t2 {
	background: white;
	color: black;
}

.memo {
	width: 80%;
	height: 300px;
	margin: auto;
	text-align: center;
	font-size: 20px;
}

.memo2 {
	width: 80%;
	margin: auto;
	text-align: center;
	font-size: 20px;
}
</style>
</head>
<body>
	<table class="table table-striped table-dark">
		<tr>
			<th scope="col" class="t2" style="width: 10%; text-align: center;"
				colspan="1"><p class="memo2">${oneData.title }</p></th>
		</tr>
		<tr>
			<th scope="col" class="t1" colspan="2" style="text-align: center;">내&emsp;&emsp;용
			</th>
		</tr>
		<tr>
			<th class="t2" colspan="2"><p class="memo">${oneData.memo }</p></th>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;"><a
				href="${pageContext.request.contextPath}/adminboardList"><button
						type="button" class="btn btn-info">뒤로가기</button></a> <a
				href="adminboardmodlist?bamod=${oneData.no}"><button
						type="button" class="btn btn-info">수정</button></a> <a
				href="adminboarddel?badel=${oneData.no}"><button type="button"
						class="btn btn-info">삭제</button></a></th>

		</tr>
	</table>
</body>
</html>