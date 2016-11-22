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
<!-- 입력한 값이 Member DB에 있을 경우 -->
<c:if test="${num==1 }">
		<table>
			<tr>
				<td>${password} 입니다.</td>
				<td>
					<input type="submit" value="확 인" onclick="window.close()">
				</td>
			</tr>
		</table>
</c:if>
	<!-- 입력한 값이 Member DB에 없을 경우 -->
	<c:if test="${num==0}">

		<table>
				<tr>
					<td>일치한 정보가 없습니다.</td>		
					<td>
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