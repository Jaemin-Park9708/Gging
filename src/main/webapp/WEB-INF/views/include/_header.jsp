<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- User를 사용하기 위해 dto 패키지를 import 한다. --%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--절대경로를 쉽게 사용하기 위해 session에 root를 key로 컨텍스트 루트 경로를 저장해둔다. --%>
<c:set value="${pageContext.request.contextPath }" scope="session" var="root"></c:set>

<%-- bootstrap 관련 코드를 등록한다. --%>
<%@ include file="_bootstrap.jsp"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');

* {
	font-family: 'IBM Plex Sans KR';
}


.navbar navbar-expand-lg navbar-dark bg-dark fixed-top{
	font-size: medium;
	padding: rem 0;
}


#nav-List {
	font-size: 1rem;
	position: relative;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: space-between;
}

button {
	height: 30px;
	width: 60px;
}
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="">
	<div class="container-fluid">
		<a class="navbar-brand" href="goHome" style="font-size: xx-large">SSAFY</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav" id="nav-List">
				<% 	String path = request.getServletPath();
					pageContext.setAttribute("path", path);
				%>
				<li class="nav-item">
					<c:if test="${path eq '/WEB-INF/views/index.jsp'}">
						<span class="nav-link active" aria-current="page">Home</span>
					</c:if>
					<c:if test="${path ne '/WEB-INF/views/index.jsp'}">
						<a class="nav-link" href="goHome">Home</a>
					</c:if>
				</li>
				<li class="nav-item">
					<c:if test="${path eq '/WEB-INF/views/board/mainBoard.jsp'}">
						<span class="nav-link active" aria-current="page">Board</span>
					</c:if>
					<c:if test="${path ne '/WEB-INF/views/board/mainBoard.jsp'}">
						<a class="nav-link" href="mainBoard">Board</a>
					</c:if>
				</li>
				<li class="nav-item">
					<c:if test="${path eq '/WEB-INF/views/board/write.jsp'}">
						<span class="nav-link active" aria-current="page">Post</span>
					</c:if>
					<c:if test="${path ne '/WEB-INF/views/board/write.jsp'}">
						<a class="nav-link" href="${root }/write">Post</a>
					</c:if>
				</li>
				<li class="nav-item">
					<c:if test="${otherUser eq null }">
						<c:if test="${path eq '/WEB-INF/views/user/myPage.jsp'}">
							<span class="nav-link active" aria-current="page">MyPage</span>
						</c:if>
						<c:if test="${path ne '/WEB-INF/views/user/myPage.jsp'}">
							<a class="nav-link" href="myPage">MyPage</a>
						</c:if>
					</c:if>
				</li>
				<c:if test="${otherUser ne null }">
					<li class="nav-item">
						<c:if test="${path eq '/WEB-INF/views/user/myPage.jsp'}">
							<a class="nav-link" href="myPage">MyPage</a>
						</c:if>
					</li>
					<li class="nav-item">
						<c:if test="${path eq '/WEB-INF/views/user/myPage.jsp'}">
							<span class="nav-link active" aria-current="page">UserPage</span>
						</c:if>
					</li>
				</c:if>
				<c:if test="${loginUser eq null }">
					<li class="nav-item">
						<a class="nav-link" href="login">Login</a>
					</li>
				</c:if>
				<c:if test="${loginUser eq null }">
					<li class="nav-item">
						<c:if test="${path eq '/WEB-INF/views/user/regist.jsp'}">
							<span class="nav-link active" aria-current="page">Sign Up</span>
						</c:if>
						<c:if test="${path ne '/WEB-INF/views/user/regist.jsp'}">
							<a class="nav-link" href="regist">Sign Up</a>
						</c:if>
					</li>
				</c:if>
				<c:if test="${loginUser ne null }">
					<li class="nav-item">
						<a class="nav-link" href="logout">Logout</a>
					</li>
				</c:if>
			</ul>
			<div style="position:absolute; right:10px;">
				<c:if test="${!empty loginUser }">
					<span class="text-light" style="font-family: 'IBM Plex Sans KR';">${loginUser.name }님 반갑습니다.</span>
				</c:if>
			</div>
		</div>
	</div>
</nav>
<%-- <%session.removeAttribute("msg"); %> --%>

<script>
	// request 영역에 msg라는 이름의 attribute가 있다면 화면에 alert으로 출력한다.
	let msg = "${msg}";
	if (msg) {
		alert(msg)
	}
</script>