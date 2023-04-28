<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link href="./resources/css/styles.css" rel="stylesheet" />
<style>
.review {
	margin-top: 8rem;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/_header.jsp"%>
	<div class="container" id="wrap"
		style="padding-top: 130px; padding-bottom: 130px; min-width:1200px">
		<c:if test="${otherUser eq null }">
			<h2 class="fw-semibold" style="margin-bottom: 4rem">마이 페이지</h2>
		</c:if>
		<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
		<%
			String registDate = null;
		if (request.getAttribute("otherUser") == null) {
			registDate = ((User) request.getAttribute("user")).getRegistDate();
		} else {
			registDate = ((User) request.getAttribute("otherUser")).getRegistDate();
		}
		Date now = new Date();
		SimpleDateFormat nowFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		Date a = nowFormat.parse(registDate);
		long diffSec = (now.getTime() - a.getTime()) / 1000;
		long diffDays = diffSec / (24 * 60 * 60);
		pageContext.setAttribute("diffDays", diffDays);
		%>

		<br>
		<div class="">
			<c:if test="${otherUser eq null }">
				<h4 class="fw-semibold">나의 정보</h4>
			</c:if>
			<c:if test="${otherUser ne null }">
				<h4 class="fw-semibold">${otherUser.name }님의 정보</h4>
			</c:if>
			<c:if test="${otherUser eq null }">
				<p style="text-align: right;">${user.name }님과 함께한지 벌써 ${diffDays }일</p>
				<hr>
			</c:if>
			<c:if test="${otherUser ne null }">
				<p style="text-align: right;">${otherUser.name }님과 함께한지 벌써
					${diffDays }일</p>
				<hr>
			</c:if>
		</div>
		<table class="table" style="text-align: center;">
			<thead>
				<tr>
					<th>프로필 사진</th>
					<th>아이디</th>
					<c:if test="${otherUser eq null }">
						<th>비밀번호</th>
					</c:if>
					<th>이름</th>
					<th>이메일</th>
					<th>나이</th>
					<c:if test="${otherUser eq null }">
						<th>수정/탈퇴</th>
					</c:if>
					<c:if test="${otherUser ne null }">
						<th>친구추가/제거</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:if test="${user.id ne 'administrator' }">
						<c:if test="${otherUser eq null }"> 
							<c:if test="${not empty user.img}">
								<td><img id="img"
									src="${root }/resources/upload/${user.img }" width="100"
									height="100"></td>
							</c:if>
							<c:if test="${user.img eq null && user.gender eq 'x'}">
								<td><img id="img" src="${root }/resources/img/female.jfif"
									width="100" height="100"></td>
							</c:if>
							<c:if test="${user.img eq null && user.gender eq 'y'}">
								<td><img id="img" src="${root }/resources/img/male.jfif"
									width="100" height="100"></td>
							</c:if>
						</c:if>
						<c:if test="${otherUser ne null }"> 
							<c:if test="${not empty otherUser.img}">
								<td><img id="img"
									src="${root }/resources/upload/${otherUser.img }" width="100"
									height="100"></td>
							</c:if>
							<c:if test="${otherUser.img eq null && otherUser.gender eq 'x'}">
								<td><img id="img" src="${root }/resources/img/female.jfif"
									width="100" height="100"></td>
							</c:if>
							<c:if test="${otherUser.img eq null && otherUser.gender eq 'y'}">
								<td><img id="img" src="${root }/resources/img/male.jfif"
									width="100" height="100"></td>
							</c:if>
						</c:if>
					</c:if>
					<c:if test="${user.id eq 'administrator' }">
						<td><img id="img" src="${root }/resources/img/cat.jfif"
							width="100" height="100"></td>
					</c:if>
					<!-- 아이디 -->
					<c:if test="${otherUser eq null }">
						<td class="td-content">${user.id }</td>
					</c:if>
					<c:if test="${otherUser ne nll }">
						<td class="td-content">${otherUser.id }</td>
					</c:if>
					<c:if test="${otherUser eq null }">
						<td class="td-content">${user.password }</td>
					</c:if>
					<!-- 이름 -->
					<c:if test="${otherUser eq null }">
						<td class="td-content">${user.name }</td>
					</c:if>
					<c:if test="${otherUser ne nll }">
						<td class="td-content">${otherUser.name }</td>
					</c:if>
					<!-- 이메일 -->
					<c:if test="${otherUser eq null }">
						<td class="td-content">${user.email }</td>
					</c:if>
					<c:if test="${otherUser ne nll }">
						<td class="td-content">${otherUser.email }</td>
					</c:if>
					<!-- 나이 -->
					<c:if test="${otherUser eq null }">
						<td class="td-content">${user.age }</td>
					</c:if>
					<c:if test="${otherUser ne null }">
						<td class="td-content">${otherUser.age }</td>
					</c:if>
					<!-- 맨 왼쪽 버튼 -->
					<c:if test="${otherUser eq null }">
						<td class="td-content">
							<form method="GET" action="modifyUser"
								enctype="multipart/form-data">
								<input id="id" name="id" value="${user.id }"
									class="form-control" type="hidden"> <input
									type="submit" value="수정" class="btn btn-outline-dark"
									style="border-radius: 20px; margin-bottom: 0.5rem">
							</form> <c:if test="${user.id ne 'administrator' }">
								<form method="GET" action="deleteUser"
									enctype="multipart/form-data">
									<input id="id" name="id" value="${user.id }"
										class="form-control" type="hidden"> <input id="from"
										name="from" value="myPage" class="form-control" type="hidden">
									<input type="submit" value="탈퇴" class="btn btn-outline-danger"
										style="border-radius: 20px;">
								</form>
							</c:if>
						</td>
					</c:if>
					<c:if test="${otherUser ne null }">
						<c:if test="${friendOrNot eq 'yes' }">
							<td class="td-content">
								<form method="GET" action="deleteFriend"
									enctype="multipart/form-data">
									<input id="from" name="from" value="myPage"
										class="form-control" type="hidden"> <input id="idA"
										name="idA" value="${loginUser.id }" class="form-control"
										type="hidden"> <input id="idB" name="idB"
										value="${otherUser.id }" class="form-control" type="hidden">
									<input type="hidden" id="from" name="from" value="mine">
									<input type="submit" value="친구 끊기" class="btn btn-outline-dark"
										style="border-radius: 20px;">
								</form>
							</td>
						</c:if>
						<c:if test="${friendOrNot ne 'yes' }">
							<td class="td-content">
								<form method="GET" action="addFriend"
									enctype="multipart/form-data">
									<input id="from" name="from" value="myPage"
										class="form-control" type="hidden"> <input id="idA"
										name="idA" value="${loginUser.id }" class="form-control"
										type="hidden"> <input id="idB" name="idB"
										value="${otherUser.id }" class="form-control" type="hidden">
									<input type="submit" value="친구 추가" class="btn btn-outline-dark"
										style="border-radius: 20px;">
								</form>
							</td>
						</c:if>
					</c:if>
				</tr>
			</tbody>
		</table>
		<div class="review">
		<c:if test="${otherUser eq null || loginUser.id eq 'administrator'}">
		<h4 class="fw-semibold">친구 목록</h4>
		<hr>
			<c:if test="${not empty friends }">
					<table class="table" style="text-align: center;">
						<thead>
							<tr>
								<th>프로필 사진</th>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>나이</th>
								<th>친구 관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${friends }" var="friend">
								<tr>
									<c:if test="${friend.id ne 'administrator' }">
										<c:if test="${not empty friend.img}">
											<td><img id="img"
												src="${root }/resources/upload/${friend.img }" width="100"
												height="100"></td>
										</c:if>
										<c:if test="${friend.img eq null && friend.gender eq 'x'}">
											<td><img id="img" src="${root }/resources/img/female.jfif"
												width="100" height="100"></td>
										</c:if>
										<c:if test="${friend.img eq null && friend.gender eq 'y'}">
											<td><img id="img" src="${root }/resources/img/male.jfif"
												width="100" height="100"></td>
										</c:if>
									</c:if>
									<c:if test="${friend.id eq 'administrator' }">
										<td><img id="img" src="${root }/resources/img/cat.jfif"
											width="100" height="100"></td>
									</c:if>
									<td>
										<form method="GET" action="myPage" enctype="multipart/form-data">
											<input type="hidden" id="id" name="id" value="${friend.id }">
											<input type="submit" value="${friend.id }" class="id-sub">
										</form>
									</td>
									<td>${friend.name }</td>
									<td>${friend.email }</td>
									<td>${friend.age }</td>
									<td>
										<form method="GET" action="deleteFriend"
											enctype="multipart/form-data">
											<input id="from" name="from" value="myPage"
												class="form-control" type="hidden"> <input id="idA"
												name="idA" value="${loginUser.id }" class="form-control"
												type="hidden"> <input id="idB" name="idB"
												value="${friend.id }" class="form-control" type="hidden">
											<input type="submit" value="친구 끊기" class="btn btn-outline-dark"
												style="border-radius: 20px;">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</c:if>
			<c:if test="${empty friends }">
				<span>친구 목록이 비었습니다. 당신 혹시... 왕따...?</span>
			</c:if>
		</c:if>
		</div>
		<div class="review">
			<c:if test="${otherUser eq null }">
				<h4 class="fw-semibold">내가 쓴 게시물</h4>
				<hr>
			</c:if>
			<c:if test="${otherUser ne null }">
				<h4 class="fw-semibold">${otherUser.name }님이 쓴 게시물</h4>
				<hr>
			</c:if>
			<c:if test="${not empty boards }">
				<table class="table">
					<thead>
						<tr>
							<th>제목</th>
							<th style="text-align: center;">작성 날짜</th>
							<th style="text-align: center;">수정 날짜</th>
							<c:if test="${otherUser eq null }">
								<th style="text-align: center;">수정/삭제</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boards }" var="board" varStatus="vs">
							<tr>
								<td class="td-content">
									<form method="GET" action="boardDetail"
										enctype="multipart/form-data">
										<input id="no" name="no" value="${board.no }"
											class="form-control" type="hidden"> <input
											type="submit" value="${board.title }" class="title-sub"
											style="">
									</form>
								</td>
								<td class="td-content" style="text-align: center;">${board.generatedDate }</td>
								<td class="td-content" style="text-align: center;">
									${board.modifiedDate } <c:if
										test="${board.generatedDate ne board.modifiedDate}">
										<span>(수정됨)</span>
									</c:if>
								</td>
								<c:if test="${otherUser eq null }">
									<td class="td-row">
										<form method="GET" action="modifyBoard"
											enctype="multipart/form-data">
											<input id="from" name="from" value="myPage"
												class="form-control" type="hidden"> <input id="no"
												name="no" value="${board.no }" class="form-control"
												type="hidden"> <input type="submit" value="수정"
												class="btn btn-outline-dark"
												style="border-radius: 20px; margin-right: 7px;">
										</form>
										<form method="GET" action="deleteBoard"
											enctype="multipart/form-data">
											<input id="from" name="from" value="myPage"
												class="form-control" type="hidden"> <input id="no"
												name="no" value="${board.no }" class="form-control"
												type="hidden"> <input type="submit" value="삭제"
												class="btn btn-outline-dark" style="border-radius: 20px;">
										</form>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${empty boards }">
				<c:if test="${otherUser eq null }">
					<span>내가 쓴 글이 없습니다.</span>
				</c:if>
				<c:if test="${otherUser ne null }">
					<span>${otherUser.name } 님이 쓴 글이 없습니다.</span>
				</c:if>
			</c:if>
		</div>
		<div class="review">
			<c:if test="${otherUser eq null }">
				<h4 class="fw-semibold">내가 쓴 댓글</h4>
				<hr>
			</c:if>
			<c:if test="${otherUser ne null }">
				<h4 class="fw-semibold">${otherUser.name }님이 쓴 댓글</h4>
				<hr>
			</c:if>
			<c:if test="${not empty comments }">
				<table class="table">
					<thead>
						<tr>
							<th>내용</th>
							<th style="text-align: center;">작성 날짜</th>
							<th style="text-align: center;">수정 날짜</th>
							<c:if test="${otherUser eq null }">
								<th style="text-align: center;">수정/삭제</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${comments }" var="comment" varStatus="vs">
							<tr>
								<td class="td-content">
									<form method="GET" action="boardDetail"
										enctype="multipart/form-data">
										<input id="no" name="no" value="${comment.boardNo }"
											class="form-control" type="hidden"> <input
											type="submit" value="${comment.content }" class="title-sub">
									</form>
								</td>
								<td class="td-content" style="text-align: center;">${comment.generatedDate }</td>
								<td class="td-content" style="text-align: center;">
									${comment.modifiedDate } 
									<c:if test="${comment.generatedDate ne comment.modifiedDate}">
										<span>(수정됨)</span>
									</c:if>
								</td>
								<c:if test="${otherUser eq null }">
									<td>
										<div class="tt-row">
											<form method="GET" action="modifyComment"
												enctype="multipart/form-data">
												<input id="boardNo" name="boardNo" value="${comment.boardNo }"
													class="form-control" type="hidden"> <input id="from"
													name="from" value="myPage" class="form-control" type="hidden">
												<input id="commentNo" name="commentNo"
													value="${comment.commentNo }" class="form-control"
													type="hidden"> <input type="submit" value="수정"
													class="btn btn-outline-dark"
													style="border-radius: 20px; margin-right: 7px;">
											</form>
											<form method="GET" action="deleteComment"
												enctype="multipart/form-data">
												<input id="boardNo" name="boardNo" value="${comment.boardNo }"
													class="form-control" type="hidden"> <input id="from"
													name="from" value="myPage" class="form-control" type="hidden">
												<input id="commentNo" name="commentNo"
													value="${comment.commentNo }" class="form-control"
													type="hidden"> <input type="submit" value="삭제"
													class="btn btn-outline-dark" style="border-radius: 20px;">
											</form>
										</div>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
		<c:if test="${empty comments }">
			<c:if test="${otherUser eq null }">
				<span>내가 쓴 댓글이 없습니다.</span>
			</c:if>
			<c:if test="${otherUser ne null }">
				<span>${otherUser.name } 님이 쓴 댓글이 없습니다.</span>
			</c:if>
		</c:if>
	</div>
	<%@ include file="../include/_footer.jsp"%>
</body>
</html>