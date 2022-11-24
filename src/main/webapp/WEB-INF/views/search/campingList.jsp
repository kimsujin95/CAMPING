<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome to Korea camping</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- jquery -->
</head>
<style>
body {
	background: #808080;
}

.table {
	width: 85%;
	position: relative;
	top: 40px;
	margin: auto;
}

.pagination a {
	background: black;
	color: white;
}

hr {
	background-color: black;
}
</style>

<body>
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" style="color: white;">[캠핑장리스트]</a>
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

				<!-- 				<li class="nav-item dropdown"><a  -->
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
		<p style="color: white;">로그인 유저 :${sessionScope.username } / ID :
			${sessionScope.userid }&emsp;&emsp;</p>
	</div>
	<hr>
	<!-- 	<h1 align="center"> -->
	<!-- 		<span class="badge badge-secondary">Welcome to Korea camping</span> -->
	<!-- 	</h1> -->
	<!--  <input type="button" name="nwindow" value="검색" onclick="nwindow()">	 -->
	<!------------------------------------------------------------------------->
	<div class="popup_layer" style="top: 300px; left: 10px;">
		<div class="pop_in">
			<div style="text-align: center;">
				<a href="admincp"><button class="btn btn-info">캠핑장 등록</button></a>
				
				<br>
				<br>
				
				<form action="/cp1/campingList" id="searchForm" method="get">
				
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
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cpList}" var="vo" varStatus="status">
						<tr>
							<th scope="row">${status.count+pageVO.perPageNum *(pageVO.page -1)}</th>
							<td>${vo.name }</td>
							<td>${vo.pname }</td>
							<td>${vo.mark }</td>
							<th><a href="loginProssion" onclick="return confirm('메인페이지로 돌아갑니다.');" style="color: white;">자세히보기</a></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageVO.prev}">
				<li class="page-item"><a class="page-link"
					href="campingList?page=${pageVO.startPage-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"
				var="idx">
				<li class="page-item"><a class="page-link"
					href="campingList?page=${idx}">${idx}</a></li>
			</c:forEach>
			<c:if test="${pageVO.next}">
				<li class="page-item"><a class="page-link"
					href="campingList?page=${pageVO.endPage+1}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
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
</script>
</html>
<!-- 
create table camping(
no number(10) primary key,
name varchar2(150) not null,
latitude number,
longitude number,
pname varchar2(150) not null,
city varchar2(150) not null,
addr varchar2(250),
mark varchar2(250),
wdate timestamp default sysdate,
cnt number default 0
);

insert into camping values (
camping_seq.nextval,
'임의',123,345,'경기도','오산시','경기도  오산시','테스트',default,0);
 -->