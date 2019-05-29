<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id = "box">
	<h1>header</h1>
	<ul>
		<li><a href = "<c:url value='/'/>">홈</a></li>
		<li><a href = "<c:url value='/plan'/>">계획짜기</a></li>
		<li><a href = "<c:url value='/buddyList'/>">동행찾기</a></li>
		<li><a href = "<c:url value='/adminHome'/>">관리자페이지</a></li>
		<li><a href = "<c:url value='/qna'/>">문의게시판</a></li>
	</ul>
	<ul>
		<c:choose>
			<c:when test="${sessionScope.mem_id!=null }">
				<li><a href="<c:url value='/logout'/>">로그아웃</a></li>
				<li><a href="<c:url value="/msgReceiveList?memId=${sessionScope.mem_id }&msgType=RECEIVE"/>">쪽지</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="<c:url value='/login'/>">로그인</a></li>
				<li><a href="<c:url value='/join'/>">회원가입</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>