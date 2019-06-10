<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 상단 navbar -->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="<c:url value='/adminHome'/>">
		<img src="<c:url value='/resources/adminImages/logo.svg'/>" width="30" height="30" class="d-inline-block align-top" alt="">
		<span class="menu-collapsed">PlanIt</span>
	</a>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="<c:url value='/adminLogout'/>">로그아웃</a></li>
			<!-- 화면이 작을 때 표시되는 값 -->
			<li class="nav-item dropdown d-sm-block d-md-none"><a class="nav-link dropdown-toggle" href="#" id="smallerscreenmenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">메뉴</a>
				<div class="dropdown-menu" aria-labelledby="smallerscreenmenu">
					<a class="dropdown-item" href="#">광고</a>
					<a class="dropdown-item" href="#">숙소/예약</a>
					<a class="dropdown-item" href="#">회원</a>
					<a class="dropdown-item" href="#">게시판</a>
					<a class="dropdown-item" href="#">달력</a>
					<a class="dropdown-item" href="#">쪽지</a>
					<a class="dropdown-item" href="#">정보</a>
				</div>
			</li>
		</ul>
	</div>
</nav>