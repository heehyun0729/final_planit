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
	<h1>비밀번호 수정</h1>
	<h1>
		<a href="<c:url value='/'/>">홈페이지</a>
	</h1>
	<form method="post" action="<c:url value='/user/pwdchange'/>" id="changePwd">
		<input type="hidden" name="forgot" value="${forgot }">
		<input type="hidden" name="mem_id" value="${mem_id }">
		<c:if test="${!forgot }">
			<label for="before_mem_pwd">현재 비밀번호</label><input type="password" id="before_mem_pwd" name="before_mem_pwd">
			<br>
		</c:if>
		<label for="mem_pwd">*새 비밀번호(10~20 사이의 특수문자를 포함한 영문(대소문자 구분)과 숫자 조합)</label> <input type="password" id="mem_pwd" name="mem_pwd"><span id="pwdresult"></span>
		<br>
		<label for="mem_pwdck">*새 비밀번호 확인</label> <input type="password" id="mem_pwdck" name="mem_pwdck" onpaste="return false;"><span id="pwdckresult"></span>
		<br>
		<input type="submit" value="비밀번호 변경">
	</form>
	<div id="submitError">${errMsg }</div>
</body>
</html>