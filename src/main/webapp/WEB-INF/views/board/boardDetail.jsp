<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<%@ include file="../include/_bootstrap.jsp"%>
<%@ include file="../include/_header.jsp"%>
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
	<div class="container" id="wrap" style="margin-top: 130px; min-width:1200px">
		<h2 class="fw-semibold">글 상세보기</h2><br><br><br>
		<h4 class="fw-semibold">${board.id }님의 글</h4><hr>
		<div class="mb-3 row">
   			<label for="staticTitle" class="col-sm-2 col-form-label" style="text-align: right; font-weight: bold;">제목 :</label>
    		<div class="col-sm-10">
      			<span class="form-control-plaintext" id="staticTitle">${board.title }</span><hr>
   			</div>
 		</div>
 		<div class="mb-3 row">
   			<label for="staticId" class="col-sm-2 col-form-label" style="text-align: right; font-weight: bold;">작성자 :</label>
    		<div class="col-sm-10">
    			<form method="GET" action="myPage" enctype="multipart/form-data">
    				<input type="hidden" id="id" name="id" value="${board.id }">
      				<input type="submit" readonly class="form-control-plaintext" id="staticId" value="${board.id }" style="text-align:left;">
      			</form>
      			<hr>
   			</div>
 		</div>
 		<div class="mb-8 row" style="min-height: 300px;">
   			<label for="staticContent" class="col-sm-2 col-form-label" style="text-align: right; font-weight: bold;">내용 :</label>
    		<div class="col-sm-7" style="display: block;">
      			<p class="form-control-plaintext" id="staticContent" style="width: 55rem; word-break:normal;">${board.content }</p>
   			</div>
 		</div><hr>
 		<c:if test="${board.id eq loginUser.id}">
			<form method="GET" action="modifyBoard" enctype="multipart/form-data">
				<input type="hidden" id="title" name="title" value="${board.title }" class="form-control">
				<input type="hidden" id="no" name="no" value="${board.no }" class="form-control">
				<input type="hidden" id="content" name="content" value="${board.content }" class="form-control">
				<input type="submit" value="수정" class="btn btn-dark" style="float: right; margin-right: 6px; border-radius: 20px;">
			</form>
		</c:if>
		<a href="mainBoard;" class="btn btn-dark" style="float: right; margin-right: 10px; border-radius: 20px;">이전</a>
		<div>
			<h5 class="fw-semibold" style="margin-left: 10px; margin-top: 8rem;">댓글</h5>
			<form method="POST" action="writeComment" enctype="multipart/form-data">
				<input type="hidden" id="boardNo" name="boardNo" value="${board.no }">
				<input type="hidden" id="id" name="id" value="${loginUser.id }">
				<div class="input-group mb-3">
  					<input type="text" class="form-control" id="content" name="content" placeholder="댓글 입력" required>
  					<input type="submit" class="btn btn-outline-dark" type="button" id="button-addon2" value="확인">
				</div>
			</form>
		</div>
		<br>
		<h5 class="fw-semibold" style="margin-left: 10px">댓글 목록</h5><hr>
		<table class="table">
			<thead>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th style="text-align: center;">작성 날짜</th>
					<th style="text-align: center;">수정 날짜</th>
					<th style="text-align: center;">수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${comments }" var="comment" varStatus="vs">
					<tr>
						<td class="td-content">
							<form method="GET" action="myPage" enctype="multipart/form-data">
								<input type="hidden" id="id" name="id" value="${comment.id }">
								<input type="submit" class="title-sub" value="${comment.id }" style="font-weight:500;">
							</form>
						</td>						
						<td class="td-content">${comment.content }</td>						
						<td class="td-content" style="text-align: center;">${comment.generatedDate }</td>						
						<td class="td-content" style="text-align: center;">
							${comment.modifiedDate }
							<c:if test="${comment.generatedDate ne comment.modifiedDate}">
								<span>(수정됨)</span>
							</c:if>
						</td>
						<td>
							<div class="tt-row">
								<c:if test="${comment.id eq loginUser.id || loginUser.id eq 'administrator'}">
									<form method="GET" action="modifyComment" enctype="multipart/form-data">
										<input id="boardNo" name="boardNo" value="${board.no }" class="form-control" type="hidden">
										<input id="commentNo" name="commentNo" value="${comment.commentNo }" class="form-control" type="hidden">
										<input type="submit" value="수정" class="btn btn-outline-dark" style="border-radius: 20px; margin-right: 7px;">
									</form>
									<form method="GET" action="deleteComment" enctype="multipart/form-data">
										<input id="boardNo" name="boardNo" value="${board.no }" class="form-control" type="hidden">
										<input id="commentNo" name="commentNo" value="${comment.commentNo }" class="form-control" type="hidden">
										<input type="submit" value="삭제" class="btn btn-outline-dark" style="border-radius: 20px;">
									</form>
								</c:if>
							</div>
						</td>						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file="../include/_footer.jsp"%>
</body>
</html>