<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result==0 }">
		<script type="text/javascript">
		alert("로그인후 사용가능합니다.")
 			history.go(-1);
 
		</script>
	</c:if>


<c:if test="${result==1 }">
		<script type="text/javascript">
		alert("이미 북마크된 여행지입니다.")
 			history.go(-1);
 
		</script>
	</c:if>
	
<c:if test="${result==2 }">
		<script type="text/javascript">
		alert("북마크 되었습니다.")
 			history.go(-1);
 
		</script>
	</c:if>
</body>
</html>