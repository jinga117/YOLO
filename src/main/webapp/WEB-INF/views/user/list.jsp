<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->
<style>
	.list_wrap{
		width: 70%;
		margin: 0 auto;
		margin-bottom: 8%;
	}
	.userList_t{
		margin: 0 auto;
		 font-size: 15px;
		 width: 100%;
		 text-align: center;
	}
	.userList_t th{
		height: 40px;
		border: 1px solid black;
		background-color: #99ccff;
		text-align: center;
	}
	.userList_t  td{
		height: 30px;
	}
	.userList_t tr, td{
		border: 1px solid black;
		font-style: 맑은고딕;
	}
	h4{
		text-align: right;
		margin: 0 15px 15px 0;
	}


</style>

<!-- 컨텐츠 영역 시작 -->
	<div class="b-main-container" id="content">
		<div class="list_wrap">
			<h2 align="center">User List </h2><hr>
			<h4>회원수 : ${userCount }</h4>
				<table class="userList_t">
					<thead>
						<tr>
							<th>사용자</th>
							<th>password</th>
							<th>e-mail</th>
							<th>성별</th>
							<th>나이</th>
							<th colspan="2"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="list">
							<tr>	
								<td>${list.user_id}</td>
								<td>${list.password}</td>
								<td>${list.email}</td>
								<td>${list.gender}</td>
								<td>${list.age}</td>
								<td><a href="/yolo/user_update?user_id=${list.user_id}"><img src="/WEB-INF/views/common/img/update.png"><br>수정</a></td>
								<td><a href="/yolo/user_delete?user_id=${list.user_id}"><img src="/WEB-INF/views/common/img/delete.png""><br>삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
<!-- 컨텐츠 영역 끝 -->

<!-- 푸터영역 시작 -->
<div class="footer">
	<jsp:include page="../inc/bottom.jsp" />
</div>
<!-- 푸터영역 끝 -->