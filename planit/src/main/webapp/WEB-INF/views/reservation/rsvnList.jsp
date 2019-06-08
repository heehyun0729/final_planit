<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<header id="re"
		style="border: 1px solid black; background:url('<c:url value="/resources/reservationImage/summer1.jpg"/>'); margin: 2px; color: pink; width:100%; height:70px; ">
		<h1>Planit 예약페이지에 어서오세요~~</h1>
		<ul>
			<li><a href="<c:url value='/'/>">planit 홈페이지</a></li>
			<li><a href="<c:url value=''/>">숙소예약후기</a></li>
			<li><a href="<c:url value='/acommQna'/>">숙소문의</a></li>
			<li><a href="<c:url value='/reservationForm'/>">숙소예약</a></li>
			<li><a href="<c:url value='/accommInsert'/>">숙소추가</a></li>
			<li><a href="<c:url value='/accommList'/>">방추가</a></li>
			<li><a href="<c:url value='/roomImageInsert'/>">방이미지추가</a></li>
		</ul>
	</header>
</div>
<br />
<div>
	<form>
	    <div id="search_accommodation">
	               숙박지 : <input type="text" id="re_accommodation">
	    </div>
		<div id="search_date">
			<img alt='체크인' style="width:20px" src='<c:url value='/resources/reservationImage/carender.jfif'/>'> <input type="text" id="re_checkin"> 
			<img alt='체크아웃' style="width:20px" src='<c:url value='/resources/reservationImage/carender.jfif'/>'> <input type="text" id="re_checkout">
		</div>

		<div>
			구성인원 : <select name="re_member">
				<option value="1">성인1명</option>
				<option value="2">성인2명</option>
				<option value="3">가족</option>
				<option value="4">단체</option>
			</select>
		</div>
		<c:if test="${people_cate==3}||${people_cate==4}">
			<div>
				성인 : <select name="re_memberCountA">
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
				</select>
			</div>
			<div>
				어린이 : <select name="re_memberCountB">
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
				</select>
			</div>
			<c:if test="${people_cate==6}">
			<div>
				나이 : <select name="re_memberCountB">
					<option value="1">1살</option>
					<option value="2">2살</option>
					<option value="3">3살</option>
					<option value="4">4살</option>
					<option value="5">5살</option>
					<option value="6">6살</option>
					<option value="7">7살</option>
					<option value="8">8살</option>
					<option value="9">9살</option>
					<option value="10">10살</option>
					<option value="11">11살</option>
					<option value="12">12살</option>
					<option value="13">13살</option>
					<option value="14">14살</option>
					<option value="15">15살</option>
					<option value="16">16살</option>
					<option value="17">17살</option>
				</select>
			</div>
			</c:if>
		</c:if>
		<br />
		<input type="submit" value="검색">
	</form>
</div>