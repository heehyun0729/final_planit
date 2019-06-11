function rsvnPay() {
	var name = $("#rsvnName").val();
	var email = $("#rsvnEmail").val();
	var phone = $("#rsvnPhone").val();
	if(name == null || name == ""){
		$("#rsvnName").focus();
		$("#rsvnFormMsg").html("투숙자명을 입력해주세요.");
		return;
	}else if(email == null || email == ""){
		$("#rsvnEmail").focus();
		$("#rsvnFormMsg").html("이메일을 입력해주세요.");
		return;
	}else if(email.indexOf("@") == -1 || email.indexOf(".") == -1){
		$("#rsvnEmail").focus();
		$("#rsvnFormMsg").html("이메일 형식을 확인해주세요.");
		return;
	}else if(phone == null || phone == ""){
		$("#rsvnPhone").focus();
		$("#rsvnFormMsg").html("연락처를 입력해주세요.");
		return;
	}else if(phone.indexOf("-") != -1){
		$("#rsvnPhone").focus();
		$("#rsvnFormMsg").html("- 없이 입력해주세요.");
		return;
	}else{
		var item_name = $("#rsvnItem").val();
		var total_amount = $("#rsvnTotal").val();
		$.ajax({
			url: "/planit/reservation/pay",
			dataType: "json",
			data: {
				item_name: item_name,
				total_amount: total_amount
			},
			success: function(data) {
				$("#tid").val(data.tid);
				$("#rsvnKakaoPay").html('<iframe style="border: 0px; " src="' + data.next_redirect_pc_url + '" width="500px" height="500px"></iframe>');
				$("#rsvnPayModal").modal("show");
			}
		});
	}
}