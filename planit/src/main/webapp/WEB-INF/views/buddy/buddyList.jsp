<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<div id="find_buddy">
	<form>
		<div id="choice_date">
			여행 시작 날짜 : <input type="text" id="startDate"> 
			여행 종료 날짜 : <input type="text" id="endDate">
		</div>
		
		<div id="choice_city">
			<table id="cityTable" style="width: 80%">
				<tr>
					<th>국가</th>
					<th>도시</th>
				</tr>
				<c:forEach var="country" items="${countryList}">
					<tr>
						<td>${country }</td>
						<c:forEach var="city" items="${cityList}">
							<c:if test="${city.key==country }">
								<c:forEach var="cityVal" items="${city.value}">
									<td><input type="checkbox" id="${cityVal }" value="${cityVal }" name="${cityVal }">${cityVal }</td>
								</c:forEach>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
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
		
		<input type="submit" value="검색">
	</form>
</div>
<div id="buddy_list">
	<div id="buddy_table">
		<table id="buddyTable" style="width: 80%">
			<tr>
				<th>여행자</th>
				<th>여행날짜</th>
				<th>성별</th>
				<th>나이</th>
				<th>여행 소개</th>
			</tr>
			<c:forEach var="buddy" items="${buddyList}">
				<tr>
					<th>${buddy.mem_id }</th>
					<th>${buddy.buddy_indate } ~ ${buddy.buddy_outdate }</th>
					<th>${buddy.buddy_gender }</th>
					<th>${buddy.buddy_birthYear }</th>
					<th>${buddy.buddy_msg }</th>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="button_div">
		<input id="insert_buddy" type="button" value="동행찾는 글 등록하기">
	</div>
</div>
<script type="text/javascript">
	$(function() {
		var startDate=null;
		$("#startDate").datepicker({
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			yearSuffix: "년",
			showMonthAfterYear: true,
			dateFormat: "yy-mm-dd",
			minDate : 0
		});
		$("#endDate").datepicker({
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			yearSuffix: "년",
			showMonthAfterYear: true,
			dateFormat: "yy-mm-dd",
			minDate : 0
		});
		
		$("#startDate").change(function(){
			startDate=$("#startDate").val();
			$("#endDate").val(startDate);
		});
		
		$("#insert_buddy").click(function(){
			window.location.href="<c:url value='/buddyInsert' />";
		});
	});
</script>