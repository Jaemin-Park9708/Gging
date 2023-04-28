<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY Board</title>
<%@ include file="include/_bootstrap.jsp"%>
<%@ include file="include/_header.jsp"%>
<link href="../resources/css/styles.css" rel="stylesheet" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap')
	;

/* .row row-cols-1 row-cols-md-3 g-4{ */
	
/* } */

h4, h6, h5 {
	font-family: 'IBM Plex Sans KR', sans-serif;
	text-align: center;
}


</style>
</head>
<body>
<div class="container" id="wrap" style="padding-bottom:130px; min-width:1200px">
	<div style="padding-top: 150px; ">
		<h4>SSAFY Board에 오신 것을 환영합니다!</h4>
		<h6>일상을 공유하는 공간입니다</h6>
		<br>
	</div>
	<div class="row row-cols-1 row-cols-md-3 g-4" style="justify-content: center !important;">
		<div class="col-md-3">
			<div class="card text-center">
				<img src="resources/img/index1.png" class="card-img-top" alt="img">
				<div class="card-body">
					<hr>
					<h5 class="card-title">글 작성하러가기</h5>
					<form method="GET" action="write">
						<button class="btn-bk">Click!</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card text-center">
				<img src="resources/img/index2.jfif" class="card-img-top" alt="...">
				<div class="card-body">
					<hr>
					<h5 class="card-title">전체 글 보기</h5>
					<form method="GET" action="mainBoard">
						<button class="btn-bk">Click!</button>
					</form>
				</div>
			</div>
		</div>
		<c:if test="${loginUser ne null && loginUser.id ne 'administrator'}">
			<div class="col-md-3">
				<div class="card text-center">
					<img src="resources/img/index5.png" class="card-img-top" alt="img">
					<div class="card-body">
						<hr>
						<h5 class="card-title">마이페이지</h5>
						<form method="GET" action="myPage">
							<button class="btn-bk">Click!</button>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${loginUser eq null }">
			<div class="col-md-3">
				<div class="card text-center">
					<img src="resources/img/index4.jfif" class="card-img-top" alt="img">
					<div class="card-body">
						<hr>
						<h5 class="card-title">회원가입</h5>
						<form method="GET" action="regist">
							<button class="btn-bk">Click!</button>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${loginUser.id eq 'administrator' }">
			<div class="col-md-3">
				<div class="card text-center">
					<img src="resources/img/index3.png" class="card-img-top" alt="img">
					<div class="card-body">
						<hr>
						<h5 class="card-title">SSAFY 회원 보기</h5>
						<form method="GET" action="userList">
							<button class="btn-bk">Click!</button>
						</form>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	</div>
	<%@ include file="include/_footer.jsp"%>
</body>
</html>