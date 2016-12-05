<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>여행일정 실패</title>
</head>

<body>
	<c:if test="${result==0 }">
		<script type="text/javascript">
		alert("저장된 일정이 없습니다.")
 			history.go(-1);
 
		</script>
	</c:if>
</body>

</html>