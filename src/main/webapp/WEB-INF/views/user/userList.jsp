<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 목록</title>
<link href="./resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/_header.jsp"%>
	<div class="container" id="wrap" style="margin-top: 130px; min-width:1200px">
		<h2 class="fw-semibold">사용자 목록</h2><hr>
		<%@ include file="/WEB-INF/views/include/_searchUser.jsp"%><br><hr>
		<table class="table">
			<thead>
				<tr style="text-align: center;">
					<th>프로필 사진</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th >나이</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<%-- request 영역에 books로 등록된 자료를 반복문을 이용해 출력한다. --%>
				<c:forEach items="${users }" var="user" varStatus="vs">
					<tr style="text-align: center;">
						<c:if test="${user.id ne 'administrator' }">
							<c:if test="${not empty user.img}">
								<td><img id="img"src="${root }/resources/upload/${user.img }" width="100" height="100"></td>
							</c:if>
							<c:if test="${user.img eq null && user.gender eq 'x'}">
								<td><img id="img"src="${root }/resources/img/female.jfif" width="100" height="100"></td>
							</c:if>
							<c:if test="${user.img eq null && user.gender eq 'y'}">
								<td><img id="img"src="${root }/resources/img/male.jfif" width="100" height="100"></td>
							</c:if>
						</c:if>
						<c:if test="${user.id eq 'administrator' }">
							<td><img id="img"src="${root }/resources/img/cat.jfif" width="100" height="100"></td>
						</c:if>
						<td class="td-content">
							<form method="GET" action="myPage" enctype="multipart/form-data">
								<input type="hidden" id="id" name="id" value="${user.id }">
								<input type="submit" class="title-sub" value="${user.id }" style="font-weight:500;">
							</form>
						</td>
						<td class="td-content">${user.password }</td>
						<td class="td-content">${user.name }</td>
						<td class="td-content">${user.email }</td>
						<td class="td-content" style="text-align: center;">${user.age }</td>
						<td class="td-content" style="text-align: center;">
							<form method="GET" action="modifyUser" enctype="multipart/form-data">
								<input id="id" name="id" value="${user.id }" class="form-control" type="hidden">
								<input type="submit" value="수정" class="btn btn-outline-dark" style="border-radius: 20px; margin-bottom: 0.5rem;">
							</form>
							<c:if test="${user.id ne 'administrator' }">
								<form method="GET" action="deleteUser" enctype="multipart/form-data">
									<input id="id" name="id" value="${user.id }" class="form-control" type="hidden">
									<input type="submit" value="삭제" class="btn btn-outline-danger" style="border-radius: 20px;">
								</form>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form method="GET" action="regist">
			<input type="hidden" id="from" name="from" value="userList">
			<input type="submit" class="btn btn-dark" style="border-radius: 20px; float: right; margin-right: 10px;" value="추가등록" onclick="location.href='regist'">
		</form>
		
	</div>
	<%@ include file="../include/_footer.jsp"%>
</body>
</html>