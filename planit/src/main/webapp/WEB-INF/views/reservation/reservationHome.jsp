<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 ul li{
	text-decoration: none;
	display: inline-block;
	margin-left: 10px;
}
</style>
<div >
	<header style="border: 1px solid black; background:url('<c:url value="/resources/reservationImage/summer1.jpg"/>'); margin: 2px; color: pink; width:100%; ">
		<h1>Planit 예약페이지에 어서오세요~~</h1>
	</header>
		<ul>
			<li><a href="<c:url value='/reservationForm'/>">숙소예약</a></li>
			<li><a href="<c:url value=''/>">예약후기</a></li>
			<li><a href="<c:url value='/acommQna'/>">숙소문의</a></li>
		</ul>
</div>