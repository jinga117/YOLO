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
				<td>${user_id} �Դϴ�.</td>
				<td>
					<input type="submit" value="Ȯ ��" onclick="window.close()">
				</td>
			</tr>
		</table>
	</c:if>

	<!-- �Է��� ID���� Member DB�� ���� ��� -->
	<c:if test="${check==0}">

		<table>
				<tr>
					<td>��ġ�ϴ� ID�� �������� �ʽ��ϴ�.</td>		
					<td>
						<input type="submit" value="Ȯ ��" onclick="window.close()">
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