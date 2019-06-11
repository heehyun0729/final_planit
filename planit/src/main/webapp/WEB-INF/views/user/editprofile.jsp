<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/members/ChangeMemberScript.js'/>"></script>
</head>
<body>
	<h1>프로필수정페이지</h1>
	<h1>
		<a href="<c:url value='/'/>">홈페이지</a>
	</h1>
	<form method="post" action="<c:url value='/user/editprofile'/>" id="profileupdateform">
		<input type="hidden" id="localurl" value="<c:url value='/'/>">
		<img id="profileImg" src="<c:url value='${map.IMG_SAVEIMG }'/>" alt="${map.MEM_NICKNAME }님의 프로필 사진">
		<br>
		<label for="imgInput">사진선택</label> <input type="file" id="imgInput" name="imgInput" accept="image/*">
		<button id="basicImgChange" type="button">기본이미지로 변경</button>
		<input type="hidden" id="chnangeImg" name="changeImg" value="${map.IMG_SAVEIMG }">
		<br>
		<label for="profile_open">프로필 공개범위</label>
		<select id="profile_open" name="profile_open">
			<option value="4" <c:if test="map.PROFILE_OPEN">selected="selected"</c:if>>전체공개</option>
			<option value="3" <c:if test="map.PROFILE_OPEN">selected="selected"</c:if>>친구에게만 공개</option>
			<option value="2" <c:if test="map.PROFILE_OPEN">selected="selected"</c:if>>친한 친구에게만 공개</option>
			<option value="1" <c:if test="map.PROFILE_OPEN">selected="selected"</c:if>>비공개</option>
		</select>
		<br>
		<button type="button" id="nickchange">닉네임 변경</button>
		<label for="mem_nickname">닉네임(3~10자리 한글,영문,숫자)</label> <input type="text" id="mem_nickname" name="mem_nickname" value="${map.MEM_NICKNAME }" readonly="readonly"><input type="button" id="nickcheck" name="nickcheck" value="중복검사" disabled="disabled"><span id="nickckresult"></span>
		<input type="hidden" value="${map.MEM_NICKNAME }">
		<br>
		<label for="profile_comm">인사말</label><textarea rows="10" cols="50" id="profile_comm" onKeyUp="javascript:fnChkByte(this,'950')">${map.PROFILE_COMM }</textarea>
		<span id="byteInfo">0</span>/950bytes 
		<br><input type="submit" value="수정">
	</form>
	<div id="submitError"></div>
</body>
<script type="text/javascript">
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
</html>