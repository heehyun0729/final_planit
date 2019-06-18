<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--================style Area =================-->
<style>
	.active { color: #fff !important; background-color: #337ab7 !important; border-color: #2e6da4 !important;}
	.mg_p { margin:20px 0px; }
	.page-liner{padding-bottom: 9px;margin: 20px 0 20px;border-bottom: 1px solid #eee;}
	
	.ui-datepicker{ font-size: 15px; width: 20%; }
	.ui-datepicker select.ui-datepicker-month{ width:20%; font-size: 15px; }
	.ui-datepicker select.ui-datepicker-year{ width:20%; font-size: 15px; }
</style>

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area blog_banner_two">
    <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">동행 등록</h2>
            <p>나와 함께 여행할 동행을 찾기 위해 글을 등록해 보세요!!</p>
        </div>
    </div>
</section>

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
			<input type="button" id="add_cc" value="여행지 추가하기">
			<input type="button" id="del_cc" value="여행지 삭제하기"><br>
			<p> 1 번째 국가</p><input type="text" id="buddy_country" name="buddy_country">
			<p> 1 번째 도시</p><input type="text" id="buddy_city" name="buddy_city">
			
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

<input type="hidden" id="localurl" value="<c:url value='/'/>">

<!--================ script =================-->
<script type="text/javascript">

	var cnt=1;
	var localurl=$('#localurl').val();
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
		        minDate: +1,
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
	//취소하기
	$("#cancle").click(function(){
		window.location.href=localurl+"buddyList";
	});
	
	//여행지 추가
	$("#add_cc").click(function(){
		cnt++;
		$("#add_opt").append("<p>"+cnt+"번째 국가</p><input type='text' id='buddy_country' name='buddy_country'>");
		$("#add_opt").append("<p>"+cnt+"번째 도시</p><input type='text' id='buddy_city' name='buddy_city'>");
	});
	
	//여행지 삭제
	$("#del_cc").click(function(){
		if(cnt>=2){
			cnt--;
		}
		$("#add_opt").children().last().remove();
		$("#add_opt").children().last().remove();
		$("#add_opt").children().last().remove();
		$("#add_opt").children().last().remove();
	});
</script>