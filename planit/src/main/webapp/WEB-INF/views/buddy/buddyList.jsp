<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">

<div id="find_buddy">
	<form>
		<div id="choice_city">
			<table id="cityTable" style="width: 80%">
				<tr>
					<th>국가</th>
					<th>도시</th>
				</tr>
			</table>
		</div>
		<div>
			성별 : <br>
			<input type="radio" name="gender" value="0" checked="checked">
			남 <input type="radio" name="gender" value="1"> 여
		</div>
		<div>
			나이대 : <select name="choice_age">
				<option value="any">상관없음</option>
				<option value="20">20대</option>
				<option value="30">30대</option>
				<option value="40">40대</option>
				<option value="50">50대</option>
				<option value="60">60대 이상</option>
			</select>
		</div>

		<div id="choice_date">
			여행 시작 날짜 : <input type="text" id="startDate"> 여행 종료 날짜 : <input
				type="text" id="endDate">
		</div>
		<input type="submit" value="검색">
	</form>
</div>
<div id="buddy_list">
	<div id="buddy_table">
		<table id="buddyTable" style="width: 80%">
			<tr>
				<th>여행자</th>
				<th>날짜</th>
				<th>성별</th>
				<th>나이</th>
				<th>여행 소개</th>
			</tr>
		</table>
	</div>
	<div id="button_div">
		<input id="insert_buddy" type="button" value="동행찾는 글 등록하기">
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#startDate").datepicker({
			showOn : "focus",
			dateFormat : "yy/mm/dd"
		});
		$("#endDate").datepicker({
			showOn : "focus",
			dateFormat : "yy/mm/dd"
		});
		
		$("#insert_buddy").click(function(){
			window.location.href="<c:url value='/buddyInsert' />";
		});
	});
</script>
