<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<h1><a href="<c:url value='/'/>">홈페이지</a></h1>
	<div>
		<form method="post" action="<c:url value='/login'/>" id="formLogin">
			<label for="mem_id">ID</label><input type="text" id="mem_id" name="mem_id" value="${mem_id }"><br> 
			<label for="mem_pwd">PW</label><input type="password" id="mem_pwd" name="mem_pwd"><br>
			<div id="errMsg">${errMsg }</div>
			<input type="submit" value="로그인">
		</form>
		<a href="<c:url value='/join'/>">회원가입</a> | <a href="<c:url value='/user/idsearch'/>">아이디</a>/<a href="<c:url value='/user/pwdsearch'/>">비밀번호</a> 찾기
	</div>
</body>
</html>