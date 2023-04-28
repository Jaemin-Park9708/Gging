<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="searchBoard" class="row">
	<div class="col-2">
		<label>검색 기준 :</label> <select name="key" class="form-select">
			<option value="none">없음</option>
			<c:if test="${con.key eq 'id' }">
				<option value="id" selected>작성자</option>
			</c:if>
			<c:if test="${con.key ne 'id' }">
				<option value="id">작성자</option>
			</c:if>
			<c:if test="${con.key eq 'title' }">
				<option value="title" selected>제목</option>
			</c:if>
			<c:if test="${con.key ne 'title' }">
				<option value="title">제목</option>
			</c:if>
			<c:if test="${con.key eq 'content' }">
				<option value="content" selected>내용</option>
			</c:if>
			<c:if test="${con.key ne 'content' }">
				<option value="content">내용</option>
			</c:if>
		</select>
	</div>
	<div class="col-4">
		<label>검색 내용 :</label> 
		<input type="text" name="word" value="${con.word }" class="form-control" />
	</div>
	<div class="col-2">
		<label>정렬 기준 :</label> <select name="orderBy" class="form-select">
			<option value="none">없음</option>
			<c:if test="${con.orderBy eq 'id' }">
				<option value="id" selected>작성자</option>
			</c:if>
			<c:if test="${con.orderBy ne 'id' }">
				<option value="id">작성자</option>
			</c:if>
			<c:if test="${con.orderBy eq 'title' }">
				<option value="title" selected>제목</option>
			</c:if>
			<c:if test="${con.orderBy ne 'title' }">
				<option value="title">제목</option>
			</c:if>
			<c:if test="${con.orderBy eq 'generatedDate' }">
				<option value="generatedDate" selected>생성 날짜</option>
			</c:if>
			<c:if test="${con.orderBy ne 'generatedDate' }">
				<option value="generatedDate">생성 날짜</option>
			</c:if>
			<c:if test="${con.orderBy eq 'modifiedDate' }">
				<option value="modifiedDate" selected>수정 날짜</option>
			</c:if>
			<c:if test="${con.orderBy ne 'modifiedDate' }">
				<option value="modifiedDate">수정 날짜</option>
			</c:if>
		</select>
	</div>
	<div class="col-2">
		<label>정렬 방향 :</label> <select name="orderByDir" class="form-select">
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
		<input type="button" onclick="location.href='searchBoard'" class="btn btn-dark" style="border-radius: 20px; width:80px;" value="초기화">
	</div>
</form>
