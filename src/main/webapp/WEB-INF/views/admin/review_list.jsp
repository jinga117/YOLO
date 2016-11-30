<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<h4>전체 댓글 리스트</h4><hr>
	<c:forEach items="${list }" var="list">
		<b>user_id : ${list.user_id }</b><br>
		<b>review_content : ${list.review_content }</b><br>
		<b>review_time : ${list.review_time }</b><br>
		<a href ="reviewDelete?review_no=${list.review_no }">삭제</a><hr>
	</c:forEach>
	
<!-- 푸터영역 시작 -->
<div class="footer">
	<jsp:include page="../inc/bottom.jsp" />
</div>
<!-- 푸터영역 끝 -->
	