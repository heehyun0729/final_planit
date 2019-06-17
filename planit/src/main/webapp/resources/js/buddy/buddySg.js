// 동행 추천 script

//동행요청
function apply_buddy(buddy_num){
	var result = confirm('동행을 요청하시겠습니까?');
	if(result) {
		alert("신청되었습니다.");
		window.location.href="<c:url value='/buddyApplyBuddy_pop?buddy_num="+buddy_num+"' />";
	}else{
		
	}
}