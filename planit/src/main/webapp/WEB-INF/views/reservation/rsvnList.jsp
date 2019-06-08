<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1>예약</h1>
	<div id = "rsvnMenu">
		<ul>
			<li><a href="<c:url value=''/>">숙소예약후기</a></li>
			<li><a href="<c:url value='/acommQna'/>">숙소문의</a></li>
			<li><a href="<c:url value='/reservationForm'/>">숙소예약</a></li>
			<li><a href="<c:url value='/accommInsert'/>">숙소추가</a></li>
			<li><a href="<c:url value='/accommList'/>">방추가</a></li>
			<li><a href="<c:url value='/roomImageInsert'/>">방이미지추가</a></li>
		</ul>
	</div>
</div>
<div id = "rsvnSearch">
	<form>
		도시 혹은 숙소: <input type="text" id="rsvnKeyword">
		날짜: <input type="text" id="checkin"> ~ <input type="text" id="checkout">
		인원 : <select name="rsvnCnt">
			<option value="1">1명</option>
			<option value="2">2명</option>
			<option value="3">3명</option>
			<option value="4">4명</option>
			<option value="5">5명</option>
			<option value="6">6명</option>
			<option value="7">7명</option>
			<option value="8">8명</option>
			<option value="9">9명</option>
			<option value="10">10명</option>
			<option value="11">11명</option>
			<option value="12">12명</option>
			<option value="13">13명</option>
			<option value="14">14명</option>
			<option value="15">15명</option>
			<option value="16">16명</option>
			<option value="17">17명</option>
			<option value="18">18명</option>
			<option value="19">19명</option>
			<option value="20">20명</option>
		</select>
		<input type="submit" value="검색">
	</form>
</div>