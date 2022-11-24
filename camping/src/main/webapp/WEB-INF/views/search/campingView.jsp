<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
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
	width: 70%;
	position: relative;
	top: 40px;
	margin: auto;
}

.t1 {
	text-align: center;
	font-size: 20px;
}

.t2 {
	text-align: center;
}

.back {
	text-align: center;
}

.comment {
	width: 72.5%;
	margin: auto;
	text-align: center;
}

.comment2 {
	margin: auto;
	text-align: left;
	font-size: 10px;
}
.container{
	margin: auto;
	text-align: left;
}
</style>
</head>
<body>
	<table class="table table-striped table-dark" border="1">
		<tr>
			<td scope="col" width="400px" rowspan="5">
			<div id="map" class="map" style="width: 100%; height: 400px;"></div></td>
			<th scope="col" class="t1">N o :</th>
			<th class="t2">${oneData.no -1 }</th>
		</tr>
		<tr>
			<th scope="col" class="t1">캠 핑 장 :</th>
			<th class="t2">${oneData.name }</th>
		</tr>
		<tr>
			<th scope="col" class="t1">상세주소 :</th>
			<th class="t2">${oneData.addr }</th>
		</tr>
		<tr>
			<th scope="col" class="t1">조 회 수 :</th>
			<th class="t2">${oneData.cnt }</th>
		</tr>
		<tr>
			<th colspan="2" class="t2"><a
				href="${pageContext.request.contextPath}/campingList" style="">돌아가기</a></th>
		</tr>
	</table>
	<br>
	<div class="comment">
		<form name="commentinput" method="post">
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="form-inline mb-2">
							<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
							<input type="text" class="form-control ml-2"
								value="${sessionScope.userid }" id="replyId" name="id"readonly>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="memo" rows="5"
								placeholder="내용을 입력해주세요"></textarea>
							<input type="hidden" name="no" value="${oneData.no }">
							<button type="button" class="btn btn-dark mt-3"
								name="commentInsertBtn">작성</button><!--함수 호출  -->
						</div>
						<div class="container">
							<div class="commentList"></div>
						</div>
					</li>
				</ul>
			</div>
		</form>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06c1d111efcd19c25655812d48de4da0"></script>
	<script type="text/javascript">
		var latitude = '${oneData.latitude}'; //위도
		var longitude = '${oneData.longitude}'; //경도
		//var addr = '${oneData.addr}';//주소
		//var name = '${oneData.name}';//이름
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		var markerPosition = new kakao.maps.LatLng(latitude, longitude);
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
	
	<script type="text/javascript">
		var no = '${oneData.no}'; //게시글번호
		$('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시
			var insertData = $('[name=commentinput]').serialize(); //form 의 내용을 전부 가져옴				
			commentInsert(insertData); //아래 함수 호출
		});
		//댓글 리스트
		function commentList(){
			var session ='${sessionScope.userid}'; //로그인유저 id 세션 변수등록
			$.ajax({
				url : '/cp1/list',
				type : 'get',
				data : {
					bno : no
				}, 
				success : function(data){
					var a = '';
					$.each(data,function(key,value){
						a +='<div>'+'<h5><img src="${pageContext.request.contextPath}/resources/image/user_image.png" width="30" height="30"> ' 
						+ value.id + '&emsp; <img src="${pageContext.request.contextPath}/resources/image/시계.jpg" width="30" height="30">' 
						+value.wdate.substring(2,16);+'</h5>'
						if(session == value.id){ //로그인한 유저와 댓글 등록한 유저 id 비교 같을시 삭제버튼 보이기
						a +='&emsp;<a onclick="commentDelete('+ value.no +')"><button type="button" class="btn btn-danger">삭제</button></a></div>';
						}
						a += '<br>'
						a += '<div>'+'<p><img src="${pageContext.request.contextPath}/resources/image/메모장.jpg"width="30"height="30">&emsp;'+value.memo +'</p></div>'; 
						a += '<hr>'
					});
					$(".commentList").html(a);
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		}
		//댓글 글 등록
		function commentInsert(insertData) {
			$.ajax({
				url : '/cp1/Commentinput',
				type : 'post',
				data : insertData,
				success : function(data) {
					if (data == 1) {
						commentList(); //댓글 작성 후 댓글 목록 reload
						$('[name=memo]').val('');
					}
				}
			});
		}
		//댓글삭제
		function commentDelete(no){
			$.ajax({
				url : '/cp1/del/'+no,
				type : 'post',
				success : function(data){
					if(data == 1){
						commentList(no);
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		}
		$(document).ready(function(){
			commentList();
		});
	</script>
	
</body>
</html>










<!-- 댓글 테이블 쿼리

create table user_comment(
no number(10) primary key,
id varchar2(20),
memo varchar2(100),
wdate timestamp default sysdate,
bno number(10),
foreign key(bno) references camping(no),
foreign key(id) references cpuser(id)
on delete cascade
);

create sequence user_comment_seq;

 -->