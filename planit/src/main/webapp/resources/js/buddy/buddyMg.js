//내 글 관리 script

var localurl=$('#localurl').val();
//글 삭제
function del_buddy(buddy_num){
	var result = confirm('해당 글을 삭제하시겠습니까?');
	if(result) { 
		alert("삭제되었습니다.");
		window.location.href=localurl+"buddyDelete?buddy_num="+buddy_num;
	}else{
		
	}
}
//동행 요청 취소
function cancle_apply(buddy_num){
	var result = confirm('동행 요청을 취소하시겠습니까?');
	if(result) { 
		alert("취소되었습니다.");
		window.location.href=localurl+"applyCancle?buddy_num="+buddy_num;
	}else{
		
	}
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