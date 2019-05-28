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
	var RegexId =  /^[a-z0-9]{5,13}$/;
	var RegexPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	
	//id 유효성 체크
	$("#mem_id").on("propertychange change keyup paste input", function() {
		chkid=false;
		$("#idcheckresult").text("");
		let ckid=$.trim($("#mem_id").val());
		/*console.log("아이디 유효성: "+ RegexId.test(ckid));
		console.log("아이디: "+ ckid);
		console.log("아이디 길이: "+ ckid.length);
		console.log("숫자포함: "+ /[0-9]+/.test(ckid));
		console.log("문자포함: "+ /[a-z]+/.test(ckid));
		console.log(RegexId.test(ckid) && (/[0-9]+/.test(ckid) && /[a-z]+/.test(ckid)));*/
		
		if(RegexId.test(ckid) && (/[0-9]+/.test(ckid) && /[a-z]+/.test(ckid))){
			$("#idcheck").prop("disabled", false);
		}else{
			$("#idcheck").prop("disabled", true);
		}
	});
	$("#idcheck").click(function() {
		$.ajax({
			url : $(location).attr('href')+"/idcheck",
			type : "post",
			data : {'mem_id': $("#mem_id").val()},
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
	
	//비밀번호 유효성 체크
	$("#mem_pwd").on("propertychange change keyup paste input", function() {
		$()
	});
	
	//닉네임 유효성 체크
	
	//이메일 유효성 체크
	$("#mem_email1").on("propertychange change keyup paste input", function() {
		chkid=false;
	});
	$("#mem_email2").on("propertychange change keyup paste input", function() {
		chkid=false;
	});
	$('#mem_email_select').change(function(){
		chkemail=false;
		$("#mem_email_select option:selected").each(function () {
			if($(this).val()== '1'){
				$("#mem_email2").val(''); 
				$("#mem_email2").attr("disabled",false);
			}else{
				$("#mem_email2").val($(this).text());
				$("#mem_email2").attr("disabled",true); 
			}

		});
	});
	
	$("#emailcheck").click(function() {
		let mem_email=$("#mem_email1").val()+"@"+$("#mem_email2").val();
		console.log($("#mem_email1").val());
		console.log($("#mem_email2").val());
		console.log(mem_email);
		$.ajax({
			url : $(location).attr('href')+"/emailcheck",
			type : "post",
			data :{'mem_email': mem_email},
			success : function(data) {
				if (data >0) {
					$("#emailcheckresult").text("등록되어 있는 이메일 입니다.");
					$("#emailcheckresult").attr("style", "color:red");
				} else {
					$("#emailcheckresult").text("등록이 안되어 있는 이메일 입니다.");
					$("#emailcheckresult").attr("style", "color:blue");
					$("#mem_email").val(mem_email);
					chkemail=true;
				}
			}
		});
	});
});