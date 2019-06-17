<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="insert_buddy">
	<form method="post" action="<c:url value='/buddyInsert' />" onsubmit="return check()">
		<div id="id">
			<input name="mem_id" type="text" value="${mem_id}" readonly="readonly">
		</div>
		
		<div id="choice_date">
			여행 시작 날짜 : <input name="buddy_indate" type="text" id="buddy_indate" readonly="readonly">
			여행 종료 날짜 : <input name="buddy_outdate" type="text" id="buddy_outdate" readonly="readonly">
		</div>
		
		<div id="choice">
			국가 : <br><input type="text" id="buddy_country" name="buddy_country"><br>
			도시 : <br><input type="text" id="buddy_city" name="buddy_city">
			<input type="button" id="add_cc" value="여행지 추가하기">
			<div id="add_opt">
			
			</div>
		</div>
		
		<div>
			성별 :
			<input type="radio" name="buddy_gender" value="X" checked="checked"> 상관없음
			<input type="radio" name="buddy_gender" value="M"> 남 
			<input type="radio" name="buddy_gender" value="W"> 여
			
		</div>
		
		<div>
			나이대 : <select name="buddy_birthYear">
				<option value="0">상관없음</option>
				<option value="20">20대</option>
				<option value="30">30대</option>
				<option value="40">40대</option>
				<option value="50">50대</option>
				<option value="60">60대 이상</option>
			</select>
		</div>
		
		<div id="buddy_msg">
			<p>내 여행 소개</p>
			<textarea id="buddy_msg" name="buddy_msg" rows="10" cols="40"></textarea>	
		</div>
		<input id="buddy_insert" type="submit" value="등록하기"><input type="button" id="cancle" value="취소하기">
	</form>
</div>

<!--================ script =================-->
<script type="text/javascript" src="<c:url value='/resources/js/buddy/insert.js'/>"></script>