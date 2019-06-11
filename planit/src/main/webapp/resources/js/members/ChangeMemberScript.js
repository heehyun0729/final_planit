/**
 * 가입,수정,삭제 시 쓰는 JavaScript
 */

$(document).ready(function() {
	var chkid=false;
	var chkpwd=false;
	var chkpwdck=false;
	var chknick=true;
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
	
	$("#idsearch").submit(function(event) {
		if($("#mem_email").val()==""){
			$("#errMsg").html("이메일을 입력해 주세요");
			event.preventDefault();
		}
	});

	$("#pwdsearch").submit(function(event) {
		if($("#mem_id").val()==""){
			$("#errMsg").html("아이디를 입력해 주세요");
			event.preventDefault();
		}else if($("#mem_email").val()==""){
			$("#errMsg").html("이메일을 입력해 주세요");
			event.preventDefault();
		}
	});
	
	$("#withdrawal").submit(function(event) {
		let count=0;
		let cftxt=['정말로 탈퇴하시겠습니까?','탈퇴를 하게 되면 저희 플랜잇에 등록하였던 정보 복구가 힘들어 집니다. 그래도 하시겠습니까?','마지막입니다. 정말로 탈퇴를 하시겠습니까?'];
		for(let i=0;i<3;i++){
			let withdrawalchk = confirm(cftxt[i]);
			if (withdrawalchk) {
				count++;
			} else {
				count=0;
				event.preventDefault();
				break;
			}
		}
	});
	$("#imgInput").change(function(event) {
		var file_kind = this.value.lastIndexOf('.');
		 var file_name = this.value.substring(file_kind+1,this.length);
		 var file_type = file_name.toLowerCase();
		 var check_file_type=['jpg','gif','png','jpeg','bmp'];
		 if(check_file_type.indexOf(file_type)==-1){
			  alert('이미지 파일만 선택할 수 있습니다.');
			  this.value=null;
		} else{
			if (this.files && this.files[0].size > (5 * 1024 * 1024)) {
		       	alert("파일 사이즈가 5mb 를 넘습니다.");
		       	this.value=null;
		    } else if(this.files && this.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#profileImg').attr('src', e.target.result);
					$("#changeImg").val("/resources/profileImg/"+$("#imgInput").val().split("\\")[$("#imgInput").val().split("\\").length-1]);
				}
				reader.readAsDataURL(this.files[0]);
			}
		}
	});
	
	$("#basicImgChange").click(function(){
		$('#profileImg').attr('src', $('#localurl').val()+"resources/profileImg/BasicPhoto.png");
		$("#changeImg").val("/resources/profileImg/BasicPhoto.png");
		$("#imgInput").val(null);
	});
	
	$("#nickchange").click(function(){
		chknick=false;
		$("#mem_nickname").prop("disabled",false);
	});
	
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
			url : $('#localurl').val()+"user/editnickcheck",
			type : "post",
			data : {'mem_nickname': $("#mem_nickname").val()},
			success : function(data) {
				if (data >1) {
					$("#nickckresult").text("현재 닉네임과 같은 것을 사용합니다");
					$("#nickckresult").attr("style", "color:black");
					$("#mem_nick").val($("#mem_nickname").val());
					chknick=true;
				} else if(data<0){
					$("#nickckresult").text("사용 가능한 닉네임 입니다.");
					$("#nickckresult").attr("style", "color:blue");
					$("#mem_nick").val($("#mem_nickname").val());
					chknick=true;
				} else {
					$("#nickckresult").text("이미 사용중인 닉네임 입니다.");
					$("#nickckresult").attr("style", "color:red");
				}
			}
		});
	});
	
	$("#profileupdateform").submit(function(event) {
		let formresult=true;
		$("#submitError").text("");
		if(!chknick) {
			$("#submitError").text("닉네임 중복검사 해주시기 바랍니다");
			formresult=false;
			$("#mem_nickname").focus();
		}
		$("#submitError").attr("style", "color:red");
		if (!formresult) {
			event.preventDefault();
		}
	});
});
