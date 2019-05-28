<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">

<div id="insert_buddy">
	<form method="post" action="<c:url value='/buddyInsert' />">
		<div id="choice_date">
			여행 시작 날짜 : <input name="buddy_indate" type="text" id="startDate">
			여행 종료 날짜 : <input name="buddy_outdate" type="text" id="endDate">
		</div>
		
		<div id="choice_city">
			<table id="cityTable" style="width: 80%">
				<tr>
					<th>국가 <input type="text" name="buddy_country"></th>
					<th>도시 <input type="text" name="buddy_city"></th>
				</tr>
			</table>
		</div>
		
		<div>
			성별 : <br>
			<input type="radio" name="buddy_gender" value="M" checked="checked">
			남 <input type="radio" name="buddy_gender" value="W"> 여
		</div>
		
		<div>
			나이대 : <select name="buddy_birthYear">
				<option value="any">상관없음</option>
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
		<input type="submit" value="등록하기"><input type="button" value="취소하기">
	</form>
</div>
<script type="text/javascript">
	$(function() {
		$("#startDate").datepicker({
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			yearSuffix: "년",
			showMonthAfterYear: true,
			dateFormat: "yy년mm월dd일"
		});
		$("#endDate").datepicker({
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			yearSuffix: "년",
			showMonthAfterYear: true,
			dateFormat: "yy년mm월dd일"
		});
	});
</script>