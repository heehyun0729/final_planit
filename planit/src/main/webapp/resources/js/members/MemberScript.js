/**
 * 회원로그인,가입,수정,삭제 시 쓰는 JavaScript
 */

$(document).ready(function() {
	$("form").submit(function(e) {
		var action=$("#formLogin").attr("action");
		var form_data = {
			mem_id : $('#mem_id').val(),
			mem_pwd : $('#mem_pwd').val()
		};
		$.ajax({
			type: "POST",
			url: action,
			data: form_data,
			success: function(data) {
				if (data==="success") {
					$(location).attr('href', '/planit');
				}else{
					$("#errMsg").html("로그인정보가 올바르지 않습니다.");
				}
			}
		});
	});
});