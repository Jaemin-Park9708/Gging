<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<%@ include file="_bootstrap.jsp"%>
<link href="./resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<footer class="footer py-4">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 text-lg-start">Copyright &copy; Gging</div>
				<div class="col-lg-4 my-3 my-lg-0">
					<a class="btn btn-black btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
					<a class="btn btn-black btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
					<a class="btn btn-black btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<div class="col-lg-4 text-lg-end">
					<a class="link-light text-decoration-none me-3" href="#!">개인정보 처리방침</a>
					<a class="link-light text-decoration-none me-3" href="#!">이용약관 </a>
					<a class="link-light text-decoration-none" href="#!">오시는 길</a>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>