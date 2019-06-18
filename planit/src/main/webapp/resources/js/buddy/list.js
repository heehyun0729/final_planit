//list script

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

//동행 글 추가
$("#insert_buddy").click(function(){
	if('${mem_id}'!=null && '${mem_id}'!=""){
		window.location.href=localurl+'buddyInsert';
	}else{
		alert("로그인이 필요한 서비스 입니다.");
	}
});

//리스트 전체보기
$("#list_all").click(function(){
	window.location.href=localurl+"buddyList";
});

//자동추천
$("#sg_buddy").click(function(){
	if('${mem_id}'!=null && '${mem_id}'!=""){
		if('${sgId}' != ''){
			var result = confirm('같은 일정에 같은 도시를 여행하는 사람이 있습니다. 추천받으시겠습니까?');
			if(result) { 
				var param=eval('${sgId}');
				var str="";
				for(var i=0;i<param.length;i++){
					str=str+"buddy_num="+param[i]+"&";
				}
				alert(str);
				popupOpen(str);
			}else{
				
			}
		}else{
			alert('같은 일정에 같은 도시를 여행하는 사람이 없습니다.ㅠㅠ');
		}
	}else{
		alert("로그인이 필요한 서비스 입니다.");
	}
});

//동행추천 팝업
function popupOpen(str){
	var popUrl = localurl+"buddySg?"+str;
	var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"동행추천",popOption);
}
//쪽지보내기 팝업
function msgPopup(id){
	if('${mem_id}'!=null && '${mem_id}'!=""){
		var popUrl = localurl+"msgSendPopupForm?id="+id;
		var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"쪽지보내기",popOption);
	}else{
		alert("로그인이 필요한 서비스 입니다.");
	}
}
//유효성체크
function check(){
	if($('input:checkbox[name="kw_city"]').is(":checked")){
		return true;
	}else{
		alert("여행하려는 도시를 선택해주세요.");
		return false;
	}
}
//동행요청
function apply_buddy(buddy_num){
	var result = confirm('동행을 요청하시겠습니까?');
	if(result) {
		alert("신청되었습니다.");
		window.location.href=localurl+"buddyApplyBuddy?buddy_num="+buddy_num;
	}else{
		
	}
}