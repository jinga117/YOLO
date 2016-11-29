<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
</head>
<body>
<%-- <c:if test="${modify ==1 }">
<script type="text/javascript">
	alert("수정완료되었습니다..");
	history.go(1);
</script>
</c:if>

<c:if test="${modify ==0 }">
<script type="text/javascript">
	alert("수정실패하였습니다..");
	history.go(-1);
</script>
</c:if> --%>

<a href="user_update">계 정 설 정</a><br><p>
<a href="review_view">내가 쓴 댓글</a><br><p>
<a href="bookmark_view">북마크</a><br><p>
<a href="myplan">내 일정 보기</a><br><p>


</body>
</html>