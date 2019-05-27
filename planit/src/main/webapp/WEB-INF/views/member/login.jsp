<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/members/MemberScript.js'/>"></script>
</head>
<body>
<h1>로그인</h1>
<form method="post" action="/login" id="formLogin">
	<label for="mem_id">ID</label><input type="text" id="mem_id" name="mem_id" value="${vo.getMem_id }"><br>
	<label for="mem_pwd">PW</label><input type="password" id="mem_pwd" name="mem_pwd" value="${vo.getMem_pwd }"><br>
	<div id="errMsg">${errMsg }</div>
	<input type="submit" value="로그인">
</form>
</body>
</html>