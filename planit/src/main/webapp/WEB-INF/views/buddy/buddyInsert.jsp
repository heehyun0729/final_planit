<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<div id="insert_buddy">
	<form method="post" action="<c:url value='/buddyInsert' />" onsubmit="return check()">
		<div id="choice_date">
			여행 시작 날짜 : <input name="buddy_indate" type="text" id="buddy_indate">
			여행 종료 날짜 : <input name="buddy_outdate" type="text" id="buddy_outdate">
		</div>
		
		<div id="choice_city">
			국가 : <input type="text" id="buddy_country" name="buddy_country">
			도시 : <input type="text" id="buddy_city" name="buddy_city">
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
		<input id="buddy_insert" type="submit" value="등록하기"><input type="button" value="취소하기">
	</form>
</div>
<script type="text/javascript">
	$(function() {
		$("#buddy_indate").datepicker({
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			yearSuffix: "년",
			showMonthAfterYear: true,
			dateFormat: "yy-mm-dd",
			minDate : 0
		});
		$("#buddy_outdate").datepicker({
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			yearSuffix: "년",
			showMonthAfterYear: true,
			dateFormat: "yy-mm-dd",
			minDate : 0
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
</script>