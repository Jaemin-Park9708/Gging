<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
        <form method="post" action="login" enctype="multipart/form-data">
        <div class="form">
        <h2 style="margin-bottom: 0.7rem">로그인</h2>
            <input type="text" id="id" name="id" class="form-control" placeholder="id" required/>
            <input type="password" id="password" name="password" class="form-control" placeholder="password" required/>
            <input type="submit" value="로그인" class="btn1" style="border-radius: 10px;">
            <input type="button" onclick="location.href='index'" value="돌아가기" class="btn1" style="border-radius: 10px;">
        </div>
        </form>
      </div>
    </main>
    <%@ include file="../include/_footer.jsp"%>
</body>
</html>