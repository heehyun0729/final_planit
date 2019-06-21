<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--================style Area =================-->
<style>
	.active { color: #fff !important; background-color: #337ab7 !important; border-color: #2e6da4 !important;}
	.mg_p { margin:20px 0px; }
	.page-liner{padding-bottom: 9px;margin: 20px 0 20px;border-bottom: 1px solid #eee;}
	
	.ui-datepicker{ font-size: 20px; width: 350px; }
	.ui-datepicker select.ui-datepicker-month{ width:60px; font-size: 20px; }
	.ui-datepicker select.ui-datepicker-year{ width:80px; font-size: 20px; }
</style>

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style = "background: url(resources/images/buddy02.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">동행 등록</h2>
            <p style="color:#D8D8D8">나와 함께 여행할 동행을 찾기 위해 글을 등록해 보세요!!</p>
        </div>
    </div>
</section>

<!--================body Area =================-->
<br>
<div class="container">
	<div id="insert_buddy">
		<form method="post" action="<c:url value='/buddyInsert' />" onsubmit="return check()">
			<div class="mt-10">
				<input type="hidden" name="mem_id" value="${mem_id}">
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<h3 class="typo-list">여행 시작</h3>
		            <input type="text" class="form-control" placeholder="Input date" id="buddy_indate" name="buddy_indate">
	            </div>
	 			<div class="col-md-6">
	 				<h3 class="typo-list">여행 끝</h3>
		            <input type="text" class="form-control" placeholder="Input date" id="buddy_outdate" name="buddy_outdate">
	 			</div>
	        </div>
	        
			<div class="page-liner"></div>
			
			<div class="row">
				<div class="col-md-3">
					<div class="row">
					<div class="col-md-6"><p>1 번째</p></div>
					<div class="col-md-6"><p class="text-right">국가</p></div>
					</div>
				</div>
				<div class="col-md-3"><input type="text" id="buddy_country" name="buddy_country"></div>
				<div class="col-md-3"><p class="text-right">도시</p></div>
				<div class="col-md-3"><input type="text" id="buddy_city" name="buddy_city"></div>
			</div>
			<div id="add_opt" class="row">
			</div>
			<div class="text-right">
				<input type="button" class="genric-btn primary circle small" id="add_cc" value="여행지 추가하기">
				<input type="button" class="genric-btn primary circle small" id="del_cc" value="여행지 삭제하기">
			</div>
			
			<div class="page-liner"></div>
			
			<div>
				<label>성별</label>
			</div>
			<div class="form-group">
				<select name="buddy_gender" class="nice-select wide">
					<option value="X">상관없음</option>
					<option value="M">남자</option>
					<option value="W">여자</option>
				</select>
			</div>
			
			<br>
			<div class="page-liner"></div>
			
			<div>
				<label>연령대</label>
			</div>
			<div class="form-group">
				<select name="buddy_birthYear" class="nice-select wide">
					<option value="0">상관없음</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대</option>
					<option value="50">50대</option>
					<option value="60">60대 이상</option>
				</select>
			</div>
			
			<br>
			<div class="page-liner"></div>
			
			<div>
				<label>내 여행 소개</label>
			</div>
			<div class="facilities_item">
				<div class="mt-10">
					<textarea id="buddy_msg" name="buddy_msg" class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'" required></textarea>
				</div>
			</div>
			<div class="text-center">
				<input id="buddy_insert" class="genric-btn primary circle" type="submit" value="등록하기">
				<input type="button" class="btn btn default" id="cancle" value="취소하기">
			</div>
			
			

		</form>
	</div>
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
		}else if($("#buddy_msg").val()==""){
			alert("여행 소개를 입력해주세요.");
			$("#buddy_msg").focus();
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
		$("#add_opt").append("<div class='col-md-3'><div class='row'><div class='col-md-6'><p>"+cnt+"번째</p></div>"+
				"<div class='col-md-6'><p class='text-right'>국가</p></div></div></div>"+
				"<div class='col-md-3'><input type='text' id='buddy_country' name='buddy_country'></div>");
		$("#add_opt").append("<div class='col-md-3'><p class='text-right'>도시</p></div>"+
				"<div class='col-md-3'><input type='text' id='buddy_city' name='buddy_city'></div>");
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