<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id = "box">
	<h1>header</h1>
	<ul>
		<li><a href = "<c:url value='/'/>">홈</a></li>
		<li><a href = "<c:url value='/plan'/>">계획짜기</a></li>
		<li><a href = "<c:url value='/adminHome'/>">관리자페이지</a></li>
	</ul>
</div>