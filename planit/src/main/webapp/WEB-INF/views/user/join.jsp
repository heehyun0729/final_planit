<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Planit 회원가입</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/members/MemberScript.js'/>"></script>
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear">
		<fmt:formatDate value="${now}" pattern="yyyy" />
	</c:set>
	<h1>회원가입</h1>
	<h1><a href="<c:url value='/'/>">홈페이지</a></h1>
	<form method="post" action="<c:url value='nomaljoin'/>" id="joinForm">
		<input type="hidden" id="localurl" value="<c:url value='/'/>">
		<label for="mem_id">*아이디(5~14 사이의 소문자 영문과 숫자 조합)(변경 불가!)</label> <input type="text" id="mem_id" name="mem_id" placeholder="planit01" value="${vo.mem_id }"><input type="button" id="idcheck" name="idcheck" value="중복검사" disabled="disabled"> <span id="idcheckresult"></span>
		<br>
		<label for="mem_pwd">*비밀번호(10~20 사이의 특수문자를 포함한 영문(대소문자 구분)과 숫자 조합)</label> <input type="password" id="mem_pwd" name="mem_pwd"><span id="pwdresult"></span>
		<br>
		<label for="mem_pwdck">*비밀번호 확인</label> <input type="password" id="mem_pwdck" name="mem_pwdck" onpaste="return false;"><span id="pwdckresult"></span>
		<br>
		<label for="mem_nickname">*닉네임(3~10자리 한글,영문,숫자)</label> <input type="text" id="mem_nickname" name="mem_nickname" value="${vo.mem_nickname }"><input type="button" id="nickcheck" name="nickcheck" value="중복검사" disabled="disabled"><span id="nickckresult"></span>
		<br>
		<label for="mem_email1">*이메일(변경 불가!)</label> <input type="text" id="mem_email1" name="mem_email1"> <span>@</span> <input type="text" id="mem_email2" name="mem_email2" placeholder="example.com" disabled="disabled" value="naver.com"> 
		<select id="mem_email_select" name="mem_email_select">
			<option value="naver.com">naver.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="1">직접입력</option>
		</select> 
		<input type="hidden" id="mem_email" name="mem_email" value="">
		<input type="button" id="emailcheck" name="emailcheck" value="중복검사" disabled="disabled"> <span id="emailcheckresult"></span>
		<br>
		<label for="mem_gender">*성별(변경 불가!)</label><select id="mem_gender" name="mem_gender">
			<option value="m">남(Male)</option>
			<option value="f">녀(Female)</option>
		</select>
		<br>
		<label for="mem_birthyear">*생년(변경 불가!)</label><select id="mem_birthyear" name="mem_birthyear">
			<c:forEach var="i" begin="0" end="${sysYear-1900 }">
				<option value="${sysYear-i }">${sysYear-i }</option>
			</c:forEach>
			
		</select>
		<br>
		<label for="sellck"></label>
		<input type="submit" value="가입">
	</form>
	<div id="submitError"></div>
</body>
</html>