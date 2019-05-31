<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<div id="insert_buddy">
	<form method="post" action="<c:url value='/buddyInsert' />" onsubmit="return check()">
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
		
	});
	function check(){
		if($("#buddy_indate").val()==""){
			alert("여행 시작날짜를 선택해주세요.");
			$("#buddy_indate").focus();
			return false;
		}else if($("#buddy_outdate").val()==""){
			alert("여행 종료날짜를 선택해주세요.");
			$("#buddy_outdate").focus();
			return false;
		}else if($("#buddy_country").val()==""){
			alert("여행하려는 국가를 입력해주세요.");
			$("#buddy_country").focus();
			return false;
		}else if($("#buddy_city").val()==""){
			alert("여행하려는 도시를 입력해주세요.");
			$("#buddy_city").focus();
			return false;
		}else{
			return true;
		}
	}
	$("#cancle").click(function(){
		window.location.href="<c:url value='/buddyList' />";
	});
	$("#add_cc").click(function(){
		$("#add_opt").append("추가 할 국가 : <input type='text' id='buddy_country' name='buddy_country'><br>");
		$("#add_opt").append("추가 할 도시 : <input type='text' id='buddy_city' name='buddy_city'><br>");
	});
</script>