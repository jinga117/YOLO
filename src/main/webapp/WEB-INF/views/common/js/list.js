$(document).ready(function(){

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