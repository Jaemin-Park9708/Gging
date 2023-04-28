<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 작성</title>
<%@ include file="../include/_bootstrap.jsp"%>
<%@ include file="../include/_header.jsp"%>
<link href="./resources/css/styles.css" rel="stylesheet" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');
	
	*{
		font-family: 'IBM Plex Sans KR', sans-serif;
	}

	
</style>
</head>
<body>
	<form method="post" id="wrap" action="write" enctype="multipart/form-data">
		<div class="form2" style="margin-top: 130px;">
			<h2>글 작성</h2>
			<table class="table table-hover">
				<tbody>
					<tr>
						<td><input required type="text" class="form-control" placeholder="글 제목" name="title" maxlength="40"></td>
					</tr>
					<tr>
						<td><textarea required type="text" class="form-control" placeholder="글 내용을 작성하세요" name="content" maxlength="1024" style="height: 400px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-outline-dark" style="border-radius: 20px; margin-right: 8px;" value="등록">
			<input type="button" onclick="location.href='mainBoard'" class="btn btn-outline-dark" style="border-radius: 20px;" value="취소">
		</div>
	</form>
	<%@ include file="../include/_footer.jsp"%>
</body>
</html>