$(document).ready(function() {
	// view all places 클릭시 변경
	$("#viewList").hide();
	$("#view").click(function() {
		$("#hidediv").hide(500);
		$("#viewList").show();
	});
});
