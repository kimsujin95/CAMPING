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
<title>관리자페이지</title>
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

<!-- jquery -->
</head>
<style>
body {
	background: #808080;
}

.table {
	width: 95%;
	position: relative;
	top: 40px;
	margin: auto;
}

.pagination a {
	background: black;
	color: white;
}

hr {
	background-color: maroon;
}
</style>

<body>
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
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
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="adminboardList">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="adminUserList">회원전체보기</a></li>
				<li class="nav-item"><a class="nav-link" href="logout"
					style="color: white;">[로그아웃]</a></li>
				<!-- 				<li class="nav-item dropdown"><a -->
				<!-- 					class="nav-link dropdown-toggle" href="#" -->
				<!-- 					id="navbarDropdownMenuLink" data-toggle="dropdown" -->
				<!-- 					aria-haspopup="true" aria-expanded="false"> 고객센터 </a> -->
				<!-- 					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> -->
				<!-- 						<a class="dropdown-item" href="#">Action</a> <a -->
				<!-- 							class="dropdown-item" href="#">Another action</a> <a -->
				<!-- 							class="dropdown-item" href="#">Something else here</a> -->
				<!-- 					</div></li> -->
			</ul>
		</div>
	</nav>
	<hr>
	<div align="right" class="loginuser">
		<p style="color: white;">로그인 유저 : ${sessionScope.username }&emsp;&emsp;
		</p>
	</div>
	<hr>
	<!-- 	<h1 align="center"> -->
	<!-- 		<span class="badge badge-secondary">Welcome to Korea camping</span> -->
	<!-- 	</h1> -->
	<!--  <input type="button" name="nwindow" value="검색" onclick="nwindow()">	 -->
	<!------------------------------------------------------------------------->
	<!-- 서치폼 추가 -->

	
	<div class="popup_layer" style="top: 300px; left: 10px;">
		<div class="pop_in">
			<div style="text-align: center;">
				<a href="admincp"><button class="btn btn-info">캠핑장 등록</button></a>
				
				<br>
				<br>
				
				<form action="/cp1/admincampingList" id="searchForm" method="get">
				
					<select name="choice">
						<option value="">선택</option>
						<option value="CN" <c:out value="${pageMaker.cri.type eq 'CN'? 'selected' :'' }"/>>캠핑장 이름</option>
						<option value="LO" <c:out value="${pageMaker.cri.type eq 'LO'? 'selected' :'' }"/>>지역</option>
					</select>	
					
					<input type="text" name="search" value='<c:out value="${pageMaker.cri.search}"/>' />
					
					<button class="btn-btn-default">검색</button>
				
				</form>
				
			</div>
			<table class="table table-striped table-dark">
				<thead>
					<tr align="center">
						<th scope="col">번호</th>
						<th scope="col">캠핑장 이름</th>
						<th scope="col">지역</th>
						<th scope="col">특이사항</th>
						<th scope="col">상세보기</th>
						<th scope="col">수정/삭제</th>
					</tr>
				</thead>				
				<tbody>
					<c:forEach items="${cpList}" var="vo" varStatus="status">
						<tr>
							<th scope="row">${status.count+pageVO.perPageNum *(pageVO.page -1)}</th>
							<th>${vo.name }</th>
							<th>${vo.pname }</th>
							<th>${vo.mark }</th>
							<th><a href="boardListView"
								style="color: white;" onclick="return confirm('메인페이지로 돌아갑니다. \n 페이지 번호=${vo.no}');" >[자세히보기]</a></th>
							<th><a href="cpModlist?cpinfor=${vo.no }"
								style="color: white;">[수정]</a>/<a
								href="admincpdel?cpdel=${vo.no}" style="color: white;">[삭제]</a></th>
						</tr>
					</c:forEach>
				</tbody>
				<!--	<input  type="button" value="자세히보기" onclick="ViewWindow()">  -->
			</table>
		</div>
	</div>
	<br><br>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageVO.prev}">
				<li class="page-item"><a class="page-link"
					href="campingList?page=${pageVO.startPage-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"
				var="idx">
				<li class="page-item"><a class="page-link"
					href="admincampingList?page=${idx}">${idx}</a></li>
			</c:forEach>
			<c:if test="${pageVO.next}">
				<li class="page-item"><a class="page-link"
					href="admincampingList?page=${pageVO.endPage+1}">Next</a></li>
			</c:if>
		</ul>
	</nav>
	<script>

		// 		function ViewWindow() {
		// 			window.open("/cp1/cpView", "_blank",
		// 					"toolbar=ues, menubar=yes, width=700, height=500").focus();
		// 		}
		
		$(document)
				.ready(
						function() {
							var result = '<c:out value="${result}"/>';
							checkModal(result);
							
							history.replaceState({}, null, null);
							
							var searchForm = $("#searchForm");
							$("#searchForm button").on(
									"click",
									function(e) {
										
										if (!searchForm.find("option:selected")
												.val()) {
											alert("검색종류를 선택하세요");
											return false;
										}		
										
										if (!searchForm.find(
												"input[name='keyword']").val()) {
											alert("키워드를 선택하세요");
											return false;
										}		
										
										e.preventDefault();
										
										searchForm.submit;
									});
					
						});		
		
		/* function click() {
			if(!confirm("메인페이지로 돌아갑니다.")) {
				location.href = "/cp1/boardListView"
				return true;
			} else {
				return false;
			} */
		
	</script>
</body>
</html>