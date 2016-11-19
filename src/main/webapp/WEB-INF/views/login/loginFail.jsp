<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${result ==2 }">
<script type="text/javascript">
	alert("아이디가 잘못되었습니다.");
	history.go(-1);
</script>
</c:if>

<c:if test="${result > 2 }">
<script type="text/javascript">
	alert("비밀번호가 잘못되었습니다.");
	history.go(-1);
</script>
</c:if>


<title>Insert title here</title>
</head>

<body>

</body>
</html>