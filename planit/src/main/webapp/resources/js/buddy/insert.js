//insert script

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