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
<!-- �Է��� ID���� Member DB�� ���� ��� -->
	<c:if test="${check==1 }">
		<table>
			<tr>
				<td>${user_id}�� �̹̻������ ���̵� �Դϴ�.</td>
			</tr>
		</table>

		<form action="confirm_Id" method="post" name="checkForm">
			<table>
				<tr>
					<td>�ٸ� ID�� ������ּ���.</td>
					<td><input type="text" name="user_id"></td>
					<td colspan="2"><input type="submit" value="ID �ߺ�Ȯ��"></td>
				</tr>
			</table>
		</form>
	</c:if>

	<!-- �Է��� ID���� Member DB�� ���� ��� -->
	<c:if test="${check==0}">
		<form action="userwrite" name="ConFirm" method="post" onsubmit="return openConfirmid()">
			<table>
				<tr>
					<td>�Է��Ͻ� ${user_id}�� ����Ͻ� �� �ִ� ID �Դϴ�.
						<input type="hidden" name="user_id" value="${user_id }">
					</td>
					
					<td>
						<input type="submit" value="Ȯ ��" onclick="window.close()">
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