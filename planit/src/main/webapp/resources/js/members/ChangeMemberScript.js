/**
 * 가입,수정,삭제 시 쓰는 JavaScript
 */

$(document).ready(function() {
	var chkid=false;
	var chkpwd=false;
	var chkpwdck=false;
	var chknick=false;
	var chkemail=false;
	var RegexEmail = /^[a-z0-9]{1,20}$/;
	var RegexEmailDomain = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var RegexId =  /^[a-z0-9]{5,13}$/;
	var RegexPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	var RegxNickname1 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z|0-9]{3,10}$/;
	var RegxNickname2 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z|0-9]+$/;
	
	//비밀번호 유효성 체크
	$("#mem_pwd").on("propertychange change keyup paste input", function() {
		chkpwd=false;
		chkpwdck=false;
		$("#pwdckresult").text("");
		let mem_pwdval=$("#mem_pwd").val();
		let mem_pwdcheckval=$("#mem_pwdck").val();
		if(mem_pwdcheckval !== ""){
			checkPwdCk(mem_pwdval,mem_pwdcheckval);
		}
		let mem_id=$('#mem_id').val();
		if (typeof mem_id === "undefined") {
			mem_id="";
		}
		chkpwd=checkPassword($('#mem_pwd').val(),mem_id);
		if (chkpwd) {
			$("#pwdresult").text("높음");
			$("#pwdresult").attr("style", "color:blue");
		}
	});
	function checkPassword(password,id){
	    let checkNumber = password.search(/[0-9]/g);
	    let checkEnglish = password.search(/[a-z]/ig);
	    if(password.length<8){
	    	$("#pwdresult").text("낮음(비밀번호는 8자리 이상 20자리 이하여야 합니다.)");
			$("#pwdresult").attr("style", "color:red");
	        return false;
	    }
	    else if(checkNumber <0 || checkEnglish <0){
	    	$("#pwdresult").text("낮음(숫자와 영문자를 혼용하여야 합니다.)");
			$("#pwdresult").attr("style", "color:red");
	        return false;
	    }
	    else if(/(\w)\1\1\1/.test(password)){
	    	$("#pwdresult").text("낮음(같은 문자를 4번 이상 사용하실 수 없습니다.)");
			$("#pwdresult").attr("style", "color:red");
	        return false;
	    }
	    else if(password.search(id) > -1&&id!==""){
	    	$("#pwdresult").text("낮음(비밀번호에 아이디가 포함되었습니다.)");
			$("#pwdresult").attr("style", "color:red");
	        return false;
	    }
	    else if(password.length>20){
	    	$("#pwdresult").text("경고! 비밀번호가 20자리를 넘었습니다");
			$("#pwdresult").attr("style", "color:red");
	        return false;
	    }
	    else if(!RegexPwd.test(password)){
	    	$("#pwdresult").text("보통(숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.)");
			$("#pwdresult").attr("style", "color:orange");
	        return false;
	    }
	    return true;
	}
	$("#mem_pwdck").on("propertychange change keyup paste input", function() {
		chkpwdck=false;
		let mem_pwdval=$("#mem_pwd").val();
		let mem_pwdcheckval=$(this).val();
		checkPwdCk(mem_pwdval,mem_pwdcheckval);
		
	});
	function checkPwdCk(mem_pwdval,mem_pwdcheckval){
		if (mem_pwdcheckval === mem_pwdval) {
			$("#pwdckresult").text("일치");
			$("#pwdckresult").attr("style", "color:blue");
			chkpwdck=true;
		} else {
			$("#pwdckresult").text("비밀번호와 일치하지 않습니다.");
			$("#pwdckresult").attr("style", "color:red");
		}
	}
	
	//닉네임 유효성 체크
	$("#mem_nickname").on("propertychange change keyup paste input", function() {
		chknick=false;
		$("#nickcheck").prop("disabled", true);
		$("#nickckresult").text("");
		let cknick=$(this).val();
		if(RegxNickname1.test(cknick)){
			$("#nickcheck").prop("disabled", false);
		}else{
			$("#nickcheck").prop("disabled", true);
			if(!RegxNickname2.test(cknick)){
				$("#nickckresult").text("한글과 영문,숫자 이외엔 사용할 수 없습니다");
				$("#nickckresult").attr("style", "color:red");
			}
		}
	});
	$("#nickcheck").click(function() {
		$.ajax({
			url : $(location).attr('href')+"/nickcheck",
			type : "post",
			data : {'mem_nickname': $("#mem_nickname").val()},
			success : function(data) {
				if (data >0) {
					$("#nickckresult").text("이미 사용중인 닉네임 입니다.");
					$("#nickckresult").attr("style", "color:red");
				} else {
					$("#nickckresult").text("사용 가능한 닉네임 입니다.");
					$("#nickckresult").attr("style", "color:blue");
					chknick=true;
				}
			}
		});
	});
	
	$("#changePwd").submit(function(event) {
		let formresult=true;
		$("#submitError").text("");
		if(!chkpwd) {
			$("#submitError").text("비밀번호를 올바르게 입력해 주시기 바랍니다.");
			formresult=false;
			$("#mem_pwd").focus();
		}else if(!chkpwdck) {
			$("#submitError").text("비밀번호 중복체크가 올바르지 않습니다.");
			formresult=false;
			$("#mem_pwdck").focus();
		}else if($("#mem_pwd").val()==$("#before_mem_pwd").val()){
			$("#submitError").text("기존 비밀번호와 새 비밀번호가 같습니다");
			formresult=false;
			$("#mem_pwd").focus();
		}
		$("#submitError").attr("style", "color:red");
		if (!formresult) {
			event.preventDefault();
		}
	});
});