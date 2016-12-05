<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->
<!-- 컨텐츠 영역 시작 -->
<div class="my_schedule_container">
   <div class="b-pop-places container">
		<!--  여행일정 리스트 시작 -->
		<c:forEach items="${list }" var="list">
			<c:if test="${list.trip_id_1 !='' || list.trip_id_1 == null}">
				<div class="my_schedule_wrap">
					<ul>
						<li class="my_schedule_list">
							<div class="my_title">${ list.trip_title} <span class="user_txt">planned by <b>${list.user_id }</b></span></div>
							<div class="my_item">
								<div class="my_tripimg"><img src="img/photo/${list.trip_id_1}.jpg">
									<span class="my_start_day">${ list.trip_start}</span>
									<span class="my_tripname">${ list.trip_nickname_1}</span>
								</div>
								<div class="my_content">
									<ul>
										<li class="my_day_nick"><span class="my_day_nick_txt">${ list.trip_nickname_1}</span><span class="arrow"><i class="fa fa-arrow-down" aria-hidden="true"></i></span></li>
										<c:if test="${list.trip_nickname_2 !=''}">
											<li class="my_day_nick"><span class="my_day_nick_txt">${ list.trip_nickname_2}</span><span class="arrow"><i class="fa fa-arrow-down" aria-hidden="true"></i></span></li>
										</c:if>
										<c:if test="${list.trip_nickname_3 !=''}">
											<li class="my_day_nick last"><span class="my_day_nick_txt">${ list.trip_nickname_3}</span></li>
										</c:if>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</c:if>
		</c:forEach>
	</div>
		<!--  여행일정 리스트 끝 -->
	</div>
	<!-- //View List Container 끝-->
	<!-- 컨텐츠 영역 끝 -->

	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->