<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div>
		<h1>예약</h1>
		<div id = "rsvnMenu">
			<ul>
				<li><a href="<c:url value=''/>">숙소예약후기</a></li>
				<li><a href="<c:url value='/acommQna'/>">숙소문의</a></li>
				<li><a href="<c:url value='/reservationForm'/>">숙소예약</a></li>
				<li><a href="<c:url value='/sellerInsertListForm'/>">판매자 등록 리스트</a></li>
			</ul>
		</div>
	</div>
	<div id = "rsvnSearch">
		<form>
			도시 혹은 숙소: <input type="text" id="rsvnKeyword">
			날짜: <input type="text" id="checkin"> ~ <input type="text" id="checkout">
			인원 : <input type="button" id="decrease" value = "-" onclick="decreaseCnt()">
				  <input type="number" id="rsvnCnt" value="1">
				  <input type="button" id="increase" value="+" onclick="increaseCnt()">
			<input type="submit" value="검색">
		</form>
	</div>
	<div id = "accomList">
		
	</div>
</div>