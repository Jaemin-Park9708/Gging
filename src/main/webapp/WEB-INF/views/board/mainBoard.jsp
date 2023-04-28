<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 글 목록</title>
<link href="./resources/css/styles.css" rel="stylesheet" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');

* {
	font-family: 'IBM Plex Sans KR';
}

</style>
</head>
<body>
	<div class="container" id="wrap" style="padding-top: 130px; padding-bottom: 130px; min-width:1200px">
	<%@ include file="/WEB-INF/views/include/_header.jsp"%>
		<h2 class="fw-semibold">전체 글 목록</h2>
		<br><br>
		<%@ include file="/WEB-INF/views/include/_searchBoard.jsp"%>
		<hr>
		<table class="table">
			<thead>
				<tr>
					<th class="fs-6">작성자</th>
					<th class="fs-6" style="min-width:300px">제목</th>
					<th class="fs-6" style="text-align: center;">작성 시각</th>
					<th class="fs-6" style="text-align: center;">가장 최근 수정한 시각</th>
					<th style="text-align: center;">게시글 삭제</th>
				</tr>
			</thead>
			<tbody>
				<!-- 공지사항 먼저 출력 -->
				<c:forEach items="${notice }" var="n" varStatus="vs">
					<tr class="table-secondary">
						<td class="td-content">
							<span>관리자</span>
						</td>
						<td class="td-content">
							<form method="GET" action="boardDetail" enctype="multipart/form-data">
								<input id="no" name="no" value="${n.no }" class="form-control" type="hidden">
								<input type="submit" value="${n.title }" class="title-sub">
							</form>
						</td>
						<td class="td-content" style="text-align: center;">${n.generatedDate }</td>
						<td class="td-content" style="text-align: center;">
							<span>${n.modifiedDate }</span>
							<c:if test="${n.generatedDate ne n.modifiedDate }">
								<span>(수정됨)</span>
							</c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${loginUser.id eq 'administrator'}">
								<form method="GET" action="deleteBoard" enctype="multipart/form-data">
									<input id="no" name="no" value="${n.no }" class="form-control" type="hidden">
									<input type="submit" value="삭제" style="border-radius: 20px; color: black; heigth: 30px; width: 55px">
								</form>
							</c:if>
<%-- 							<c:if test="${loginUser.id ne b.id }"> --%>
<!-- 								<td></td> -->
<%-- 							</c:if> --%>
						</td>
					</tr>
				</c:forEach>
				
				<!-- 공지사항 외 게시글 출력 -->
				<c:forEach items="${board }" var="b" varStatus="vs">
					<tr>
						<td>
							<form method="GET" action="myPage" enctype="multipart/form-data">
								<input type="hidden" id="id" name="id" value="${b.id }">
								<input type="submit" class="title-sub" value="${b.id }" style="font-weight:500;">
							</form>
						</td>
						<td>
							<form method="GET" action="boardDetail" enctype="multipart/form-data">
								<input id="no" name="no" value="${b.no }" class="form-control" type="hidden">
								<input type="submit" value="${b.title }" class="title-sub">
							</form>
						</td>
						<td style="text-align: center;">${b.generatedDate }</td>
						<td style="text-align: center;">
						<span>${b.modifiedDate }</span>
							<c:if test="${b.generatedDate ne b.modifiedDate }">
								<span>(수정됨)</span>
							</c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${loginUser.id eq b.id || loginUser.id eq 'administrator'}">
								<form method="GET" action="deleteBoard" enctype="multipart/form-data">
									<input id="no" name="no" value="${b.no }" class="form-control" type="hidden">
									<input type="submit" value="삭제" style="border-radius: 20px; color: black; heigth: 30px; width: 55px">
								</form>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${empty board }">
			<div style="text-align:center"><h6>게시글이 없습니다.</h6></div>
			<div style="text-align:center"><h6>첫번째 게시자가 되어주세요!</h6></div>
		</c:if>
		<a class="btn btn-dark" href="${root }/write" role="button" style="border-radius: 20px; float: right;">글 작성</a>
	</div>
	<%@ include file="../include/_footer.jsp"%>
</body>
</html>