<%@ include file="../include/_header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<%@ include file="../include/_bootstrap.jsp"%>
<link href="../resources/css/styles.css" rel="stylesheet" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap')
	;

</style>
</head>
<body>
<div class="container" id="wrap" style="padding-top: 130px; text-align: center;">
	<img alt="error" src="resources/img/error.png" style="height: 15rem; width: 15rem;">
	<h1>404</h1>
	<h1>에러가 발생했습니다.</h1>
	<h4>요청하신 페이지가 없습니다.</h4>
	<a href="index">메인화면으로 이동</a>
</div>

<%@ include file="../include/_footer.jsp"%>
</body>
</html>