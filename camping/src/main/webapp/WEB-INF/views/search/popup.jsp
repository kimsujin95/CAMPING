<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Welcome to Korea camping</title>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background: #808080;
}
</style>
</head>
<body>
	<div class="form_w">
		<ul>
			<li><strong class="title">지역</strong>
				<div class="select_box">
					<label for="s_do">도/특별시</label> <select id="getresult" name="index"
						title="도/특별시" onchange="">
						<!-- this.form.submit(this.value) -->
						<option value="">전체</option>
						<c:forEach items="${pnameAll }" var="pn">
							<input type="hidden" name="pname" value="${pn.pname}">
							<option value="${pn.pname }">
								<c:out value="${pn.pname }" /></option>
						</c:forEach>
					</select>
				</div></li>
			<li>
				<div class="select_box1">
					<label for="s_signgu">시/군/구</label> <select id="getresult_two"
						name="wesd" title="시/군/구" onchange="">
						<option value="">전체</option>
						<c:forEach items="${CityList }" var="ct">
							<option value="${ct.city }" id="zzzz">
								<c:out value="${ct.city }" />
							</option>
						</c:forEach>
					</select>
				</div>
			</li>
		</ul>
	</div>


</body>
</html>