<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 수정</title>
<%@ include file="../include/_bootstrap.jsp"%>
<%@ include file="../include/_header.jsp"%>
<link href="./resources/css/styles.css" rel="stylesheet" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');

</style>
</head>
<body>
	<div class="form2" id="wrap" style="margin-top: 130px;">
		<h2>글 수정</h2>
		<form method="post" action="modifyBoard" enctype="multipart/form-data">
			<input type="hidden" id="no" name="no" value="${board.no }" class="form-control">
			<input type="hidden" id="from" name="from" value="${from }">
			<table class="table table-hover">
				<tbody>
					<tr>
						<td><input type="text" id="title" name="title" class="form-control" value="${board.title }" maxlength="40" required></td>
					</tr>
					<tr>
						<td><textarea type="text" id="content" name="content" class="form-control" value="${board.content }" maxlength="1024" style="height: 400px;" required></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-outline-dark" style="border-radius: 20px; margin-right: 8px;" value="수정">
			<input type="button" class="btn btn-outline-dark" style="border-radius: 20px;" value="취소" onclick="location.href='javascript:history.back();'">
		</form>
	</div>
	<%@ include file="../include/_footer.jsp"%>
</body>
</html>