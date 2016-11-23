<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${num == 1 }">
<script type="text/javascript">
	alert("ID가 중복되었습니다.");
	history.go(-1);
</script>
</c:if>
<c:if test="${num != 1 }">
<script type="text/javascript">
	alert("Yolo 회원가입을 해주셔서 감사합니다.");
</script>
<meta http-equiv="Refresh" content="0; url=/yolo">
</c:if>
		
<title>Insert title here</title>
</head>

<body>

</body>
</html>