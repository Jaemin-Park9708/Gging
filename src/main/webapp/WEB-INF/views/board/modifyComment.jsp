<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댓글 수정</title>
<%@ include file="../include/_bootstrap.jsp"%>
<%@ include file="../include/_header.jsp"%>
<link href="./resources/css/styles.css" rel="stylesheet" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');

</style>
</head>
<body>
	<form method="post" id="wrap" action="modifyComment" enctype="multipart/form-data">
		<div class="form2" style="margin-top: 15rem;">
		<h2>댓글 수정</h2>
			<input type="hidden" id="boardNo" name="boardNo" value="${comment.boardNo }" class="form-control">
			<input type="hidden" id="commentNo" name="commentNo" value="${comment.commentNo }" class="form-control">
			<table class="table table-hover">
				<tbody>
					<tr>
						<td><input type="text" id="content" name="content" value="${comment.content }" class="form-control" maxlength="40"/></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-outline-dark" style="border-radius: 20px; margin-right: 8px;" value="수정">
			<input type="button" class="btn btn-outline-dark" style="border-radius: 20px;" value="취소" onclick="location.href='boardDetail?no=${comment.boardNo}'">
		</div>
	</form>
	<%@ include file="../include/_footer.jsp"%>
</body>
</html>