    //   	<!-- 좋아요 시작-->
	$(document).ready(function(){
    	function likeIt(obj) {
             var trip_id =$(obj).attr("value");
             $.ajax({
                   url : "like?trip_id="+trip_id,
                   type : "GET",
                   datatype: "json",
                   success : function(responseFromServer) {
                      var data = jQuery.parseJSON(responseFromServer);
                      var obj2 =$(obj).parent().parent().find('#likeCount');
                      $(obj2).text(data.likeCount);
                   },
                   error : function(jqXHR, textStatus, errorThrown) {
                      alert("오류 발생 \n"+textStatus + " : " + errorThrown);
                   }      
    		});
    	}      
    	//좋아요 끝
    	//view all places 클릭시 변경

           	$("#viewList").hide();
         	    $("#view").click(function(){
         	      $("#viewList").fadeToggle("1000");
         	    });
         	
    	   
    	   $(function() {
    		   $('#view').click( function() {
    		     if( $(this).html() == 'View all close' ) {
    		       $(this).html('View all places');
    		     }
    		     else {
    		       $(this).html('View all close');
    		     }
    		   });
    		 });
		});