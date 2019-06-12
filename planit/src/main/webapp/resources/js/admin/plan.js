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
	var plan;
	var dlist;
	$.ajax({
		url: "/planit/admin/plan/planInfo",
		dataType: "json",
		data: {
			plan_num: plan_num
		},
		success: function(data) {
			plan = data;
			$.ajax({
				url: "/planit/admin/plan/planDetailInfo",
				dataType: "json",
				data: {
					plan_num: plan_num
				},
				success: function(data) {
					dlist = data;
					$("#planImg").attr('src', plan.plan_img);
					$("#planNum").html(plan.plan_num);
					$("#planWriter").html(plan.mem_id);
					$("#planTitle").html(plan.plan_title);
					if(plan.plan_public == 0){
						$("#planPublic").html("공개");
					}else if(plan.plan_public == 1){
						$("#planPublic").html("비공개");
					}
					
					var str = "<tr><th>번호</th><th>순서</th><th>도시</th><th>날짜</th><th>일정</th></tr>";
					for(var i = 0 ; i < dlist.length ; i++){
						str += 	"<tr>" +
								"<td>" + dlist[i].num + "</td>" +
								"<td>" + (Number(dlist[i].order) + 1) + "</td>" +
								"<td>" + dlist[i].city + ", " + dlist[i].country + "</td>" +
								"<td>" + dlist[i].date_in.substr(0, 10) + "~" + dlist[i].date_out.substr(0, 10) + "</td>" +
								"<td>" + dlist[i].detail + "</td>" +
								"</tr>";
					}
					$("#planDetailTbl").html(str);
					$("#planDetailModal").modal("show");
				}
			});
		}
	});
}

function deletePlan() {
	if($(".planChk:checked").length == 0){
		alert("삭제할 플래너를 선택해주세요.");
		return;
	}else{
		if(confirm("정말 삭제하시겠습니까?")){
			$("#planDelete").submit();
		}
	}
}