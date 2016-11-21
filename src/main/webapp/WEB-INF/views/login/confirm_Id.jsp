<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 입력한 ID값이 Member DB에 있을 경우 -->
	<c:if test="${check==1 }">
		<table>
			<tr>
				<td>${user_id}는 이미사용중인 아이디 입니다.</td>
			</tr>
		</table>

		<form action="confirm_Id" method="post" name="checkForm">
			<table>
				<tr>
					<td>다른 ID를 사용해주세요.</td>
					<td><input type="text" name="user_id"></td>
					<td colspan="2"><input type="submit" value="ID 중복확인"></td>
				</tr>
			</table>
		</form>
	</c:if>

	<!-- 입력한 ID값이 Member DB에 없을 경우 -->
	<c:if test="${check==0}">
		<form action="userwrite" name="ConFirm" method="post" onsubmit="return openConfirmid()">
			<table>
				<tr>
					<td>입력하신 ${user_id}는 사용하실 수 있는 ID 입니다.
						<input type="hidden" name="user_id" value="${user_id }">
					</td>
					
					<td>
						<input type="submit" value="확 인" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	
	<script type="text/javascript">
		function openConfirmid() {
			opener.document.all.user_id.value = document.all.user_id.value;
		}
	</script>
</body>
</html>