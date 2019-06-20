/**
 * 가입,수정,삭제 시 쓰는 JavaScript
 */

$(document).ready(function() {
	var chkid=false;
	var chkpwd=false;
	var chkpwdck=false;
	var chknick=false;
	var chkemail=false;
	//var RegexEmail = /^[a-zA-Z0-9]{1,20}$/;
	//var RegexEmailDomain = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var RegexEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var RegexId =  /^[a-z0-9]{5,13}$/;
	var RegexPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	var RegxNickname1 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z|0-9]{3,10}$/;
	var RegxNickname2 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z|0-9]+$/;
	var localurl=$('#localurl').val();
	
	//id 유효성 체크
	$("#mem_id").on("propertychange change keyup paste input", function() {
		chkid=false;
		chkpwd=false;
		$("#idcheckresult").text("");
		let ckid=$.trim($("#mem_id").val());
		
		if (ckid!=null||ckid!='') {
			if(RegexId.test(ckid) && (/[0-9]+/.test(ckid) && /[a-z]+/.test(ckid))){
				$("#idcheck").prop("disabled", false);
			}else{
				$("#idcheck").prop("disabled", true);
			}
		} else{
			$("#idcheckresult").text("");
			$("#idcheck").prop("disabled", true);
		}
		
	});
	$("#idcheck").click(function() {
		$.ajax({
			url : localurl+"user/idcheck",
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
		if(localurl !== undefined){
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
		}
	});
	function checkPassword(password,id){
	    let checkNumber = password.search(/[0-9]/g);
	    let checkEnglish = password.search(/[a-z]/ig);
	    if(password.length==0){
	    	$("#pwdresult").text("");
	        return false;
	    }else if(password.length<8){
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
		if(mem_pwdcheckval.length==0){
			$("#pwdckresult").text("");
			chkpwdck=false;
		}else if (mem_pwdcheckval === mem_pwdval) {
			$("#pwdckresult").text("일치");
			$("#pwdckresult").attr("style", "color:blue");
			chkpwdck=true;
		} else {
			$("#pwdckresult").text("비밀번호와 일치하지 않습니다.");
			$("#pwdckresult").attr("style", "color:red");
			chkpwdck=false;
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
			url : localurl+"user/nickcheck",
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
	
	//이메일 유효성 체크
	$("#mem_email").on("propertychange change keyup paste input", function() {
		chkemail=false;
		if (RegexEmail.test($("#mem_email").val())) {
			$("#emailcheck").prop("disabled", false);
		}else{
			$("#emailcheck").prop("disabled", true);
		}
	});
	$("#mem_email2").on("propertychange change keyup paste input", function() {
		chkemail=false;
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
		$.ajax({
			url : localurl+"user/emailcheck",
			type : "post",
			data :{'mem_email': $("#mem_email").val()},
			success : function(data) {
				if (data >0) {
					$("#emailcheckresult").text("등록되어 있는 이메일 입니다.");
					$("#emailcheckresult").attr("style", "color:red");
				} else {
					$("#emailcheckresult").text("등록이 안되어 있는 이메일 입니다.");
					$("#emailcheckresult").attr("style", "color:blue");
					chkemail=true;
				}
			}
		});
	});
	
	//최종 입력 확인
	$("#joinForm").submit(function(event) {
		let formresult=true;
		if (!chkid) {
			$(".errMsg").text("아이디 중복검사 해주시기 바랍니다.");
			formresult=false;
			$("#mem_id").focus();
		} else if(!chkpwd) {
			$(".errMsg").text("비밀번호를 올바르게 입력해 주시기 바랍니다.");
			formresult=false;
			$("#mem_pwd").focus();
		}else if(!chkpwdck) {
			$(".errMsg").text("비밀번호 중복체크가 올바르지 않습니다.");
			formresult=false;
			$("#mem_pwdck").focus();
		}else if(!chknick) {
			$(".errMsg").text("닉네임 중복검사 해주시기 바랍니다");
			formresult=false;
			$("#mem_nickname").focus();
		}else if(!chkemail) {
			$(".errMsg").text("이메일 중복검사 해주시기 바랍니다");
			formresult=false;
			$("#mem_email1").focus();
		}
		$(".errMsg").attr("style", "color:red");
		if (!formresult) {
			event.preventDefault();
		}
	});
	
	/*$(".joinhref").click(function(event){
		let picheck=$("#personal_information_terms_agree").prop("checked");
		let termscheck=$("#terms_agree").prop("checked");
		if (!picheck||!termscheck) {
			$("#plzcheckMsg").text("약관에 동의해 주십시오");
			$("#plzcheckMsg").attr("style", "color:red");
			event.preventDefault();
		}
	});*/
	
	$(".termsform").submit(function(event) {
		let chk1=$("input[type='checkbox']").length;
		let chk2=$("input[type='checkbox']:checked").length;
		if (chk1!=chk2) {
			$(".errMsg").text("약관에 동의해 주십시오");
			event.preventDefault();
			event.stopPropagation();
		}
	});
	
	$("#changePwd").submit(function(event) {
		let formresult=true;
		$(".errMsg").text("");
		if(!chkpwd) {
			$(".errMsg").text("비밀번호를 올바르게 입력해 주시기 바랍니다.");
			formresult=false;
			$("#mem_pwd").focus();
		}else if(!chkpwdck) {
			$(".errMsg").text("비밀번호 중복체크가 올바르지 않습니다.");
			formresult=false;
			$("#mem_pwdck").focus();
		}
		if (!formresult) {
			event.preventDefault();
		}
	});

	var sel_addrchk=false;
	
	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	$("#btnCloseLayer").click(function(){
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	});

	$("#searchPost").click(function(){
		sel_addrchk=false;
		new daum.Postcode({
			oncomplete : function(data) {
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sell_addr3").value = extraAddr;

				} else {
					document.getElementById("sell_addr3").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sell_postcode').value = data.zonecode;
				document.getElementById("sell_addr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sell_addr2").focus();
				sel_addrchk=true;
				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
			},
			width : '100%',
			height : '100%',
			maxSuggestItems : 5
		}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	});

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition() {
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
				+ 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
				+ 'px';
	}
	
	$(".sell_tels").on("propertychange change keyup paste input", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$("#sellJoin").submit(function(event) {
		let formresult=true;
		let agreecheck=$("#electronic_agree").prop("checked");
		$("#submitError").text("");
		if(!agreecheck){
			$("#submitError").text("전자상거래 이용약관에 동의해 주세요.");
			formresult=false;
		}else if($("#mem_pwd").val()=="") {
			$("#submitError").text("비밀번호를 입력해 주세요");
			formresult=false;
			$("#mem_pwd").focus();
		}else if($("#sell_company").val()=="") {
			$("#submitError").text("회사명을 입력해 주세요");
			formresult=false;
			$("#sell_company").focus();
		}else if(!sel_addrchk){
			$("#submitError").text("주소를 확인해 주세요");
			formresult=false;
		}else if($("#sell_tel2").val()==""){
			$("#submitError").text("전화번호를 입력해 주세요");
			formresult=false;
			$("#sell_tel2").focus();
		}else if($("#sell_tel3").val()==""){
			$("#submitError").text("전화번호를 입력해 주세요");
			formresult=false;
			$("#sell_tel3").focus();
		}
		$("#submitError").attr("style", "color:red");
		$("#sell_tel").val($("#sell_tel1").val()+$("#sell_tel2").val()+$("#sell_tel3").val());
		$("#sell_addr").val($("#sell_addr1").val()+$("#sell_addr2").val()+$("#sell_addr3").val());
		if (!formresult) {
			event.preventDefault();
		}
	});
});