<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script lang="JavaScript">
   <!--
   function setCookie( name, value, expiredays ) { 
       var todayDate = new Date(); 
      todayDate.setDate( todayDate.getDate() + expiredays ); 
      document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
   } 
   
   function closeWin() { 
       if ( document.notice_form.chkbox.checked ){ 
         setCookie( "maindiv", "done" , 1 ); 
       } 
       document.all['divpop'].style.visibility = "hidden"; 
   } 
   //-->  
</script> 
<style>
.main_popup td{
	width:300px;
	color:black;
	background-color:#f3fbfa;
	text-align:center;
}
</style>
</head>
<body>  

<!-- POPUP 시작 --> 
<div id="divpop" style="position:absolute; left:500px; top:100px; z-index:9999; visibility:hidden;"> 
	<table class="main_popup"> 
	   <tr> 
	       <td> 
	            YOLO를 방문해주셔서 감사합니다.<br>
	            첫방문이신가요?<br>
	            <a href="how_to_use">이용안내 바로가기</a>
	         </td> 
	   </tr> 	
		<tr> 
			<td> 
		   		<form name="notice_form" > 
					<input type="checkbox" name="chkbox" value="checkbox">오늘 하루 이 창을 열지 않음 
					<a href="javascript:closeWin();" id="btn_close"><b>[닫기]</b></a> 
				</form>  
			</td> 
	   </tr> 
	</table> 
</div>  

<script> 
   cookiedata = document.cookie;    
   if ( cookiedata.indexOf("maindiv=done") < 0 ){      
       document.all['divpop'].style.visibility = "visible"; 
       } 
   else { 
      document.all['divpop'].style.visibility = "hidden";
      document.getelementbyid['btn_close'].style.visibility = "hidden"; 
   } 
</script>
<!-- POPUP 끝 -->

	<!--  헤더 영역 시작 -->
	<jsp:include page="inc/top.jsp" />
	<!--  헤더 영역 끝 -->
	
	<!-- 컨텐츠 영역 시작 -->
    <div class="b-main-container" id="content">
        <div class="b-promo lazy" data-src="img/main_visual_img.jpg">
			<div class="b-placeholder"></div>
            <div class="b-stars">
                <div class="stars"></div>
            </div>
            <div class="overlay"></div>
            <div class="b-promo__search container">
                <h1 class="b-promo__title">Where do you want to go?</h1>
                <form action="search_list">
                    <div class="b-promo__form">
                        <div class="b-promo__form__col1">
							<select data-placeholder="연령대를 선택하세요" class="chosen-select" tabindex="2" name="age_id">
								<option value=""></option>
                        		<option value="">선택 안함</option>
                                <option value="a01">꽃청춘</option>
                                <option value="a02">꽃중년</option>
                            </select>
						</div>
						
                        <div class="b-promo__form__col1">
                            <select data-placeholder="도시를 선택하세요" class="chosen-select" tabindex="2" name="trip_add1">
                                <option value=""></option>
                                <option value="">선택 안함</option>
                                <option value="서울특별시">서울특별시</option>
                                <option value="경기도">경기도</option>
                            </select>
                        </div>
                        
						<div class="b-promo__form__col1">
                            <input type="text" class="b-promo__form__input"  placeholder="장소 선택 ex) 경복궁"  name="trip_nickname">
                        </div>
                        <div class="b-promo__form__col2">
                            <button class="btn btn-success m--border-radius-right" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 컨텐츠 영역 끝 -->
    
    <!-- //b-main-container -->
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->