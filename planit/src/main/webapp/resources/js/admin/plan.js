$(function() {
	$("#planChkAll").click(function() {
		if ($(this).prop('checked') == true) {
			$(".planChk").prop('checked', true);
		}else {
			$(".planChk").prop('checked', false);
		}
	});
	$(".planChk").click(function() {
		var chk = $(".planChk").length;
		var checked = $(".planChk:checked").length;
		if(chk == checked){
			$("#planChkAll").prop('checked', true);
		}else{
			$("#planChkAll").prop('checked', false);
		}
	});
});

function openPlanDetailModal(plan_num) {
	$("#planDetailModal").modal("show");
}