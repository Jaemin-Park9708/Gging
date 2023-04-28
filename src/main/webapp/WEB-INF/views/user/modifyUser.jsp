<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
<%--절대경로를 쉽게 사용하기 위해 session에 root를 key로 컨텍스트 루트 경로를 저장해둔다. --%>
<c:set value="${pageContext.request.contextPath }" scope="session"
	var="root"></c:set>
<%-- bootstrap 관련 코드를 등록한다. --%>
<!-- CSS only -->
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
        <form method="post" action="modifyUser" enctype="multipart/form-data">
        <div class="form">
        <h2>회원정보 수정</h2><br>
            <input type="text" id="id" name="id" value="${user.id }" class="form-control" readonly/>
            <input type="password" id="password" name="password" value="${user.password }" class="form-control" required/>
            <input type="email" id="email" name="email" value="${user.email }" class="form-control" readonly/>
            <input type="text" id="name" name="name" value="${user.name }" class="form-control" required/>
            <input type="number" id="age" name="age" value="${user.age }" class="form-control" readonly/>
            <input type="file" id="img" name="file" value="${user.img }" class="form-control" accept="image/*" />
            <input type="submit" value="수정" class="btn1" style="border-radius: 10px;">
            <input type="button" onclick="location.href='myPage'" value="취소" class="btn1" style="border-radius: 10px;">
        </div>
        </form>
      </div>
    </main>
    <%@ include file="../include/_footer.jsp"%>
</body>
</html>