/**
 * 가입,수정,삭제 시 쓰는 JavaScript
 */

$(document).ready(function() {
	var chkid=false;
	var chkpwd=false;
	var chkpwdck=false;
	var chknick=false;
	var chkemail=false;
	var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	var RegexId =  /^[a-z0-9]{5,13}/g;
	var RegexPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	$("#mem_id").on("propertychange change keyup paste input", function() {
		chkid=false;
		$("#idcheckresult").text("");
		let ckid=$.trim($("#mem_id").val());
		console.log("아이디 유효성: "+ RegexId.test(ckid));
		console.log("아이디: "+$("#mem_id").val());
		console.log("숫자포함: "+ /[0-9]+/.test(ckid));
		console.log("문자포함: "+ ckid.search(/^[a-z]$/));
		///^[0-9]$/g.test(ckid)&&/^[a-z]$/g.test(ckid)
		if(RegexId.test(ckid) && (/[0-9]+/.test(ckid) && ckid.search(/^[a-z]$/)>=0)){
			$("#idcheck").prop("disabled", false);
		}else{
			$("#idcheck").prop("disabled", true);
		}
	});
	$("#idcheck").click(function() {
		$.ajax({
			url : $(location).attr('href')+"/idcheck",
			type : "post",
			data : $("#mem_id"),
			success : function(data) {
				if (data >0) {
					$("#idcheckresult").text("이미 사용중인 아이디입니다.");
					$("#idcheckresult").attr("style", "color:red");
				} else {
					$("#idcheckresult").text("사용 가능한 아이디입니다.");
					$("#idcheckresult").attr("style", "color:blue");
					chkid=true;
				}
			}
		});
	});
	$("#mem_pwd").on("propertychange change keyup paste input", function() {
		
	});
});