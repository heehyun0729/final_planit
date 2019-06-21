<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#editprofilebtns .btn{width:150px; height: 40px; vertical-align: middle; margin-left: 5px;}
</style>
<div class="editprofile">
	<form method="post" action="<c:url value='/user/editprofile'/>" id="profileupdateform" enctype="multipart/form-data">
		<div class="userstop">
			<a href="<c:url value='/'/>"><img class="logoimg" src="<c:url value='/resources/images/logo1.png'/>"></a>
		</div>
		<input type="hidden" id="localurl" value="<c:url value='/'/>">
		<input type="hidden" id="img_num" name="img_num" value="${map.IMG_NUM }">
		<div class="mypageimg">
		<img id="profileImg" class="rounded-circle img-responsive center-block" src="<c:url value='${map.IMG_SAVEIMG }'/>" alt="${map.MEM_NICKNAME }님의 프로필 사진">
		</div>
		<div class="m-3 d-flex justify-content-center" id="editprofilebtns">
			<label class="btn btn-primary btn-file" for="imgInput">
				사진선택
				<input type="file" id="imgInput" style="display: none;" name="imgInput" accept="image/*">
			</label>
			<button class="btn btn-primary" id="basicImgChange" type="button">기본이미지로 변경</button>
		</div>
		<input type="hidden" id="changeImg" name="changeImg" value="${map.IMG_SAVEIMG }">
		<br>
		<div class="input-group mb-3 form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-door-open"></span></span>
			</div>
			<select id="profile_open" name="profile_open" class="form-control">
				<option value="4" <c:if test="${map.PROFILE_OPEN == 4 }">selected="selected"</c:if>>전체공개</option>
				<option value="3" <c:if test="${map.PROFILE_OPEN == 3 }">selected="selected"</c:if>>친구에게만 공개</option>
				<option value="2" <c:if test="${map.PROFILE_OPEN == 2 }">selected="selected"</c:if>>친한 친구에게만 공개</option>
				<option value="1" <c:if test="${map.PROFILE_OPEN == 1 }">selected="selected"</c:if>>비공개</option>
			</select>
		</div>
		<div class="input-group mb-4 form-group form-group">
			<button type="button" class="btn btn-outline-info" id="nickchange">닉네임 변경</button>
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fa fa-user-circle"></span></span>
			</div>
			<input type="text" id="mem_nickname" name="mem_nickname" value="${map.MEM_NICKNAME }" disabled="disabled" class="form-control" placeholder="닉네임(3~10자리 한글,영문,숫자)" required><input type="button" id="nickcheck" name="nickcheck" value="중복검사" disabled="disabled">
			<div id="nickckresult" class="resultMsg"></div>
		</div>
		<input type="hidden" value="${map.MEM_NICKNAME }" id="mem_nick" name="mem_nick">
		<div class="input-group form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-pen-square"></span></span>
			</div>
			<textarea rows="5" id="profile_comm" name="profile_comm" class="form-control" onKeyUp="javascript:fnChkByte(this,'950')" style="resize: none;">${map.PROFILE_COMM }</textarea>
		</div>
		<div class="mb-4 d-flex justify-content-end">
			<div class="p-2"><span id="byteInfo">0</span>/950bytes</div>
		</div>
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-lock"></span></span>
			</div>
			<input type="password" id="mem_pwd" name="mem_pwd" class="form-control" placeholder="비밀번호" required>
		</div>
		<input type="submit" class="btn btn-primary btn-block" value="수정">
		<div class="errMsg">${errMsg }</div>
	</form>
</div>
<script type="text/javascript">
	var profile_comm=document.getElementById("profile_comm");
	fnChkByte(profile_comm,'950');

	function fnChkByte(obj, maxByte) {
		var str = obj.value;
		var str_len = str.length;

		var rbyte = 0;
		var rlen = 0;
		var one_char = "";
		var str2 = "";

		for (var i = 0; i < str_len; i++) {
			one_char = str.charAt(i);
			if (escape(one_char).length > 4) {
				rbyte += 2; //한글2Byte
			} else {
				rbyte++; //영문 등 나머지 1Byte
			}

			if (rbyte <= maxByte) {
				rlen = i + 1; //return할 문자열 갯수
			}
		}

		if (rbyte > maxByte) {
			// alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
			alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
			str2 = str.substr(0, rlen); //문자열 자르기
			obj.value = str2;
			fnChkByte(obj, maxByte);
		} else {
			document.getElementById('byteInfo').innerText = rbyte;
		}
	}
</script>