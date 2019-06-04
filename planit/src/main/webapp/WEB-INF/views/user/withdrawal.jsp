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
	<h1>비밀번호 입력</h1>
	<h1>
		<a href="<c:url value='/'/>">홈페이지</a>
	</h1>
	<form method="post" action="<c:url value='/user/withdrawal'/>" id="withdrawal">
		<label for="mem_pwd">비밀번호</label><input type="password" id="mem_pwd" name="mem_pwd">
		<br>
		<input type="submit" value="비밀번호 확인">
	</form>
	<div id="errMsg">${errMsg }</div>
</body>
</html>