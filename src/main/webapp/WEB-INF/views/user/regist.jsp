<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--절대경로를 쉽게 사용하기 위해 session에 root를 key로 컨텍스트 루트 경로를 저장해둔다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<c:set value="${pageContext.request.contextPath }" scope="session"
	var="root"></c:set>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<%@ include file="../include/_bootstrap.jsp"%>
<%@ include file="../include/_header.jsp"%>
<link href="./resources/css/styles.css" rel="stylesheet" />
<style>
	h2{
		text-align: center;
	}
</style>
</head>
<body>
    <main class="container" id="wrap" style="margin-top: 130px;">
      <div class="login-page">
      	<c:if test="${email eq null }">
	      	<form method="GET" action="sendMail" enctype="multipart/form-data">
	      		<div class="form">
	      			<h2>회원 가입</h2><br>
	      			<input type="email" id="email" name="email" class="form-control" placeholder="email address" required/>
					<input type="submit" class="btn btn-outline-dark" id="button-addon2" value="인증번호 보내기">
			</form>
		</c:if>
		<c:if test="${email ne null }">
			
			<form method="POST" action="verify" enctype="multipart/form-data">
	      		<div class="form">
	      			<h2>회원 가입</h2><br>
	      			<input type="email" value="${email }" id="email", name="email" readonly>
	      			<c:if test="${verification eq null }">
		      			<input type="text" maxLength="6" id="code" name="code">
						<input type="submit" class="btn btn-outline-dark" id="button-addon2" value="인증하기">
					</c:if>
					<c:if test="${verification ne null }">
						<input type="text" readonly value="인증되었습니다." style="text-algin:center">
					</c:if>
			</form>
			
		</c:if>
        <form method="post" action="regist" enctype="multipart/form-data">
        	<input type="hidden" id="email" name="email" value="${email }">
        	<input type="hidden" id="from" name="from" value="${from }">
            <input type="text" id="id" name="id" class="form-control" placeholder="id" required/>
            <input type="password" id="password" name="password" class="form-control" placeholder="password" required/>
            <input type="text" id="name" name="name" class="form-control" placeholder="name" required/>
            <input type="number" id="age" name="age" class="form-control" placeholder="age" required/>
            <select id="gender" name="gender" class="form-select" style="margin-bottom: 1rem;" required>
            	<option value="">gender</option>
            	<option value='y'>male</option>
            	<option value='x'>female</option>
            </select>
            <input type="file" id="img" name="file" class="form-control" accept="image/*" />
            <c:if test="${verification eq 'verified' }">
            	<input type="submit" value="등록" class="btn1" style="border-radius: 10px;">
            </c:if>
            <c:if test="${verification ne 'verified' }">
            	<button class="form-control" type="submit" disabled>이메일 인증을 먼저 진행해 주세요.</button>
            </c:if>
            <input type="button" onclick="location.href='index'" value="취소" class="btn1" style="border-radius: 10px;">
        </div>
        </form>
      </div>
    </main>
    <%@ include file="../include/_footer.jsp"%>
</body>
</html>