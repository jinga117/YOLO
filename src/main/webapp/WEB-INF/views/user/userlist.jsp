<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function() {

	   $('#userList_t').each(function() {
	     var $table = $(this);
	     $('th', $table).each(function(column) {
	       var $header = $(this);
	       if ($header.is('.sort')) {
	         $header.addClass('clickable').hover(function() {
	           $header.addClass('hover');
	         }, function() {
	           $header.removeClass('hover');
	         }).click(function() {
				var sortDirection = 1;
	           if ($header.is('.sorted-asc')) {
	             sortDirection = -1;
	           }
	           //정렬시작
	       		//sort()는 상당한 양의 비교를 반복적으로 수행하여 수행 성능을 많이 떨어뜨리기 때문에 Key를 이용해 수행성능 업그레이드 시키기
	           var rows = $table.find('tbody > tr').get();
	           
	           $.each(rows, function(index, row){
	        		var $cell =  $(row).children('td').eq(column);
	        		row.sortKey = $cell.find('.sort-key').text().toUpperCase() + ' ' + $cell.text().toUpperCase();
	        	});
	           
					rows.sort(function(a, b){
						if(a.sortKey < b.sortKey) return -sortDirection;
						if(a.sortKey > b.sortKey) return sortDirection;
						return 0;
					});
					$.each(rows, function(index, row){
						$table.children('tbody').append(row);
						row.sortKey = null;
					});
					
			//반대 방향으로 정렬하기 //반환되는 값을 반대로 바꾸면 됩니다.
			$table.find('th').removeClass('sorted-asc')
	             .removeClass('sorted-desc');
	           if (sortDirection == 1) {
	             $header.addClass('sorted-asc');
	           }
	           else {
	             $header.addClass('sorted-desc');
	           }
	         });
	       }
	     });
	   });
	 });
</script>
<style>
.list_wrap {
	width: 70%;
	margin: 0 auto;
	margin-bottom: 8%;
}

#userList_t {
	margin: 0 auto;
	font-size: 15px;
	width: 100%;
	text-align: center;
}

#userList_t th {
	height: 40px;
	border: 1px solid black;
	background-color: #99ccff;
	text-align: center;
}

#userList_t  td {
	height: 30px;
}

#userList_t tr, td {
	border: 1px solid grey;
	border-collapse: collapse;
	font-style: 맑은고딕;
}

h4 {
	text-align: right;
	margin: 0 15px 15px 0;
}

.clickable {
	cursor: pointer;
}

.hover {
	text-decoration: underline;
}

.ad-head {
	background-color: #5be0dd;

}

/* nav tag */
.ad-nav  {
}

.ad-nav ul li {
	display: inline; /*  세로나열을 가로나열로 변경 */
	padding: 0 10px; /* 각 메뉴 간격 */
}
</style>
</head>
   <!--.b-header__ctrl-->
<header>
<div class="ad-head">
	<nav class="ad-nav">
		<ul>
			<li><a href="/yolo" class="logo"> <img src="img/logo.png"alt="YOLO" title="YOLO"></a></li>
			<li><a href="list_age">연령별</a></li>
			<li><a href="list_theme">테마별</a></li>
			<li><a href="list_person">동행별</a></li>
		</ul>
	</nav>
	<!--//b-nav-->
</div>
<!-- //b-header -->
</header>
<body>
<!-- 컨텐츠 영역 시작 -->
	<div class="b-main-container" id="content">
		<div class="list_wrap">
			<h2 align="center">User List </h2><hr>
			<h4>회원수 : ${userCount }</h4>
				<table id="userList_t">
					<thead>
						<tr>
							<th class="sort">사용자<a>▼</a></th>
							<th>password</th>
							<th class="sort">e-mail<a>▼</a></th>
							<th class="sort">성별<a>▼</a></th>
							<th class="sort">나이	<a>▼</a></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="list">
							<tr>	
								<td>${list.user_id}</td>
								<td>${list.password}</td>
								<td>${list.email}</td>
								<td>${list.gender}</td>
								<td>${list.age}</td>
								<td><a href="/yolo/admindelete?user_id=${list.user_id}"><img src="img/delete.png""><br>삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
<!-- 컨텐츠 영역 끝 -->

</body>
</html>