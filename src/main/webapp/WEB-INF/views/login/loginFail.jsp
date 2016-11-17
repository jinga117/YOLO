<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<c:if test="${result == 2 }">
<script type="text/javascript">
      alert("ID가 맞지 않습니다.");
      history.go(-1);
   </script>
</c:if>

<c:if test="${result > 2  }">
 <script type="text/javascript">
      alert("Password가 맞지 않습니다.");
      history.go(-1);
   </script>
</c:if>
 <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>