<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 유형 선택</h1>
	<h1>
		<a href="<c:url value='/'/>">홈페이지</a>
	</h1>
	<ul>
		<li><a href="">네이버 아이디로 가입(미구현)</a></li>
		<li><a href="">카카오 아이디로 가입(미구현)</a></li>
		<li><a href="">구글 아이디로 가입(미구현)</a></li>
		<li><a href="<c:url value='/nomaljoin'/>">이메일로 회원가입(개인)</a></li>
		<li><a href="">이메일로 회원가입(판매자)(미구현)</a></li>
	</ul>
</body>
</html>