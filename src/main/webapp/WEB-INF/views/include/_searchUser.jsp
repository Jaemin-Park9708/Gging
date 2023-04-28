<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="searchUser" class="row">
	<div class="col-2">
		<label>검색 기준 :</label>
		<select name="key" class="form-select">
			<option value="none">없음</option>
			<c:if test="${con.key eq 'id' }">
				<option value="id" selected>아이디</option>
			</c:if>
			<c:if test="${con.key ne 'id' }">
				<option value="id">아이디</option>
			</c:if>
			<c:if test="${con.key eq 'name' }">
				<option value="name" selected>이름</option>
			</c:if>
			<c:if test="${con.key ne 'name' }">
				<option value="name">이름</option>
			</c:if>
			<c:if test="${con.key eq 'email' }">
				<option value="email" selected>이메일</option>
			</c:if>
			<c:if test="${con.key ne 'email' }">
				<option value="email">이메일</option>
			</c:if>
			<c:if test="${con.key eq 'age' }">
				<option value="age" selected>나이</option>
			</c:if>
			<c:if test="${con.key ne 'email' }">
				<option value="age">나이</option>
			</c:if>
		</select>
	</div>
	<div class="col-4">
		<label>검색 내용 :</label> <input type="text" name="word" class="form-control">
	</div>
	<div class="col-2">
		<label>정렬 기준 :</label>
		<select name="orderBy" class="form-select">
			<option value="none">없음</option>
			<c:if test="${con.orderBy eq 'id' }">
				<option value="id" selected>아이디</option>
			</c:if>
			<c:if test="${con.orderBy ne 'id' }">
				<option value="id">아이디</option>
			</c:if>
			<c:if test="${con.orderBy eq 'name' }">
				<option value="name" selected>이름</option>
			</c:if>
			<c:if test="${con.orderBy ne 'name' }">
				<option value="name">이름</option>
			</c:if>
			<c:if test="${con.orderBy eq 'age' }">
				<option value="age" selected>나이</option>
			</c:if>
			<c:if test="${con.orderBy ne 'age' }">
				<option value="age">나이</option>
			</c:if>
		</select>
	</div>
	<div class="col-2">
		<label>정렬 방향 :</label>
		<select name="orderByDir" class="form-select">
			<c:if test="${con.orderByDir eq 'asc' }">
				<option value="asc" selected>오름차순</option>
			</c:if>
			<c:if test="${con.orderByDir ne 'asc' }">
				<option value="asc">오름차순</option>	
			</c:if>
			<c:if test="${con.orderByDir eq 'desc' }">
				<option value="desc" selected>내림차순</option>
			</c:if>
			<c:if test="${con.orderByDir ne 'desc' }">
				<option value="desc">내림차순</option>
			</c:if>
		</select>
	</div>
	<div class="col-2" style="margin-top: 24px">
		<input type="submit" value="검색" class="btn btn-dark" style="border-radius: 20px; width:80px;">
		<input type="button" onclick="location.href='searchUser'" class="btn btn-dark" style="border-radius: 20px; width:80px;" value="초기화">
	</div>
</form>
