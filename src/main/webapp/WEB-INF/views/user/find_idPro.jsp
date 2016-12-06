<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 입력한 값이 Member DB에 있을 경우 -->
<c:if test="${num==1 }">
		<table style="margin: auto; margin-top: 5%;">
			<tr>
				<td>Your ID : ${user_id} </td>
				</tr>
					<tr>	
					<td  align="center">
					<input type="submit" value="확 인" onclick="window.close()">
				</td>
			</tr>
		</table>
</c:if>
	<!-- 입력한 값이 Member DB에 없을 경우 -->
	<c:if test="${num==0}">

		<table style="margin: auto; margin-top: 5%;">
				<tr>
					<td>일치하는 ID가 존재하지 않습니다.</td>
					</tr>
					<tr>	
					<td  align="center">
						<input type="submit" value="확 인" onclick="window.close()">
					</td>
				</tr>
			</table>
	
	</c:if>
	
	<script type="text/javascript">
		function openConfirmid() {
			opener.document.all.value = document.all.value;
		}
	</script>
</body>
</html>