/**
 * 마이페이지 동작 js파일
 */

$(document).ready(function() {
	$("#mypage_followbtn").click(function() {
		let hidden_id = $("#hidden_id").val();
		if (hidden_id != "") {
			$.ajax({
				url : $(location).attr('href') + "/follow",
				type : "post",
				data : {'follow_grade' : $("#hidden_fg").val()},
				success : function(data) {
					if (data >= 0) {
						$("#followedcnt").html("");
						if ($("#hidden_fg").val() > 0) {
							$("#mypage_followbtn").html("팔로우");
							$("#mypage_followbtn").attr('class','btn btn-outline-info');
							$("#followedcnt").html(data);
							$("#hidden_fg").val("0");
						} else {
							$("#mypage_followbtn").html("팔로우 됨");
							$("#mypage_followbtn").attr('class','btn btn-outline-secondary');
							$("#followedcnt").html(data);
							$("#hidden_fg").val("2");
						}
					} else {
						alert("오류로 인해 정상적인 작업을 수행하지 못하였습니다.");
					}
				}
			});
		} else {
			$(location).attr("href", $(location).attr('href') + "/login");
		}
	});
	$(".profileurl").click(function(event){
		let open=$("#open").val();
		if (open<=0) {
			event.preventDefault();
		}
	});
});