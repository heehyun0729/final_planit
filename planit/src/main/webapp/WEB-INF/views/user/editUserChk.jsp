<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 입력</h1>
	<form method="post" action="<c:url value='/user/edituserinfochk'/>">
		<label for="mem_pwd">비밀번호</label><input type="password" id="mem_pwd" name="mem_pwd"><br>
		<input type="submit" value="비밀번호 확인">
	</form>
	<div id="errMsg">${errMsg }</div>
</body>
</html>