<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="find_buddy">
	<form method="post" action="<c:url value='/buddyList'/>">
		<div id="choice_date">
			여행 시작 날짜 : <input type="text" id="buddy_indate" name="kw_indate"> 
			여행 종료 날짜 : <input type="text" id="buddy_outdate" name="kw_outdate">
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
									<td><input type="checkbox" id="${cityVal }" value="${cityVal }" name="kw_city">${cityVal }</td>
								</c:forEach>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div>
			성별 :
			<input type="radio" name="kw_gender" value="X" checked="checked"> 상관없음
			<input type="radio" name="kw_gender" value="M"> 남 
			<input type="radio" name="kw_gender" value="W"> 여
			
		</div>
		
		<div>
			나이대 : <select name="kw_birthYear">
				<option value="0">상관없음</option>
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
				<th>여행할 도시</th>
			</tr>
			<c:forEach var="buddy" items="${buddyList}">
				<tr>
					<th>${buddy.mem_id }</th>
					<th>${buddy.buddy_indate } ~ ${buddy.buddy_outdate }</th>
					<th>${buddy.buddy_gender }</th>
					<th>${buddy.buddy_birthyear }</th>
					<th>${buddy.buddy_msg }</th>
					<th>${buddy.buddy_city }</th>
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
		$.datepicker.regional['calendar'] = {
				closeText: '닫기',
		        prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		        '7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        dateFormat: 'yy-mm-dd',
		        minDate: 0,
		        showMonthAfterYear: true,
		        yearSuffix: '년',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: 'c-99:c+99',
		        showButtonPanel: true
		}
		$.datepicker.setDefaults($.datepicker.regional['calendar']);
		
		$("#buddy_indate").datepicker();
		
	    $('#buddy_indate').datepicker("option", "onSelect", function ( selectedDate ) {
	    	$("#buddy_outdate").datepicker();
	    	$("#buddy_outdate").datepicker( "option", "minDate", selectedDate );
	    });
		$("#insert_buddy").click(function(){
			window.location.href="<c:url value='/buddyInsert' />";
		});
	});
</script>