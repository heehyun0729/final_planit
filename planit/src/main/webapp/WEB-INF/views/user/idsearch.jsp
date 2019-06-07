<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/members/ChangeMemberScript.js'/>"></script>
</head>
<body>
	<h1>아이디 찾기</h1>
	<h1>
		<a href="<c:url value='/'/>">홈페이지</a>
	</h1>
	<h1>
		<a href="<c:url value='/user/pwdsearch'/>">비밀번호 찾기</a>/<a href="<c:url value='/login'/>">로그인</a>
	</h1>
	<h2>등록하신 이메일을 입력해 주세요</h2>
	<form method="post" action="<c:url value=''/>" id="idsearch">
		<label for="mem_email">이메일</label><input type="email" id="mem_email" name="mem_email"><br>
		<input type="submit" value="아이디 찾기">
	</form>
	<div id="errMsg">${errMsg }</div>
</body>
</html>