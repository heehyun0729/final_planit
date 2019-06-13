$(function() {
	$(".showRsvnDetail").click(function(e) {
		e.preventDefault();
		var rsvn_num = $(this).html();
		var tds = $(this).parent().siblings();
		var info = [];	// 0: 결제일, 1: 숙소정보, 2: 인원, 3: 체크인/아웃, 4: 상태
		tds.each(function(i, element) {
			info[info.length] = $(element).html();
		});
		$.ajax({
			url: "/planit/member/mypage/reservation/detail",
			dataType: "json",
			data: {rsvn_num: rsvn_num},
			success: function(data) {
				var rtds = $("#rsvnInfo td");
				rtds.eq(0).html(rsvn_num);
				rtds.eq(1).html(info[1]);
				rtds.eq(2).html(info[2]);
				rtds.eq(3).html(info[3]);
				var ctds = $("#customerInfo td");
				ctds.eq(0).html(data.name);
				ctds.eq(1).html(data.email);
				ctds.eq(2).html(data.phone);
				var ptds = $("#payInfo td");
				ptds.eq(0).html(data.total + "원");
				ptds.eq(1).html(info[0]);
				ptds.eq(2).html(info[4]);
				$("#rsvnDetailModal").modal("show");
			}
		});
	});
});