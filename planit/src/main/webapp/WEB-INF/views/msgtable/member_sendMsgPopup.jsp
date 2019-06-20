<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<title>쪽지보내기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planner.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planList.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planDetail.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/jquery.qtip.css'/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/fullcalendar.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation/rsvnList.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation/rsvnDetail.css'/>">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/linericon/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/nice-select/css/nice-select.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/responsive.css'/>">

<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-ui.min.js'/>"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
<script type="text/javascript">
var memChkId = "";
function checkId() {
	var memId = document.getElementById("memId").value;
	if(memId=="" || memId.trim()==""){
		document.getElementById("memChk_res").innerHTML="";
		memId.focus();
		return;
	}
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=checkIdResult;
	xhr.open("post","${pageContext.request.contextPath}/mem/check",true);	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("memId=" + memId);
}
function checkIdResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {
			document.getElementById("memChk_res").innerHTML='<font color="gray" id="memChk_ok">가입되어있는 ID 입니다.</font>';
		} else {
			document.getElementById("memChk_res").innerHTML='<font color="red" id="memChk_fail">가입되어있지 않는 ID 입니다.</font>';
		}
		memChkId = document.getElementsByName("memId")[0].value;
	}
}
function sendMessage() {
	var memId = document.getElementById("memId").value;
	var memChk = document.getElementById("memChk_ok");
	var content = document.getElementsByName("content")[0];
	if(content.value.length == 0 ){
		document.getElementById("memChk_res").innerHTML='<font color="red" id="memChk_ok">쪽지 내용을 입력하세요.</font>';
		content.focus();
		return false;
	}
	var contHtml = content.value.replace(/\r/g,'').replace(/\n/g,'<br/>');
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=sendMessageResult;
	xhr.open("post","${pageContext.request.contextPath}/msgSendfForm",true);	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("receiveMemId=${mem_id}&sendMemId=" + memId+"&msgContent="+contHtml);
	opener.parent.location.reload();
	window.close();
}
function sendMessageResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {			
			document.location="${pageContext.request.contextPath}/msgSendList?memId=${sessionScope.mem_id }&msgType=SEND&errMsg=쪽지를 보냈습니다.";
			
		} else {
			document.location="${pageContext.request.contextPath}/msgSendList?memId=${sessionScope.mem_id }&msgType=SEND&errMsg=오류가 발생했습니다.";
		}
		
	}
}
function detailClose() {
	window.close();
}
</script>
<h1 style="padding-left: 10px; margin-top: 10px;">쪽지 보내기</h1>
<table class="table">
	<tr>
		<th >받을사람</th>
		<td>
			<input type="text" id="memId" name="memId"/><a href="#"	onclick="checkId()"> <i class="fas fa-user-check" style="color: #339af0;"></i></a><span id="memChk_res"></span>	
		</td>
	</tr>
	<tr>
		<th >쪽지내용</th>
		<td>
			<textarea rows="5" cols="70%" id="content" name="content"></textarea>
		</td>
	</tr>
</table>
<a href="#"	style="margin-left: 250px"onclick="sendMessage()"><i class="fas fa-paper-plane" style="color: #339af0;">보내기</i></a>
<a href="#"	style="margin-left: 100px" onclick="detailClose()"><i class="fas fa-times" style="color: #339af0;">취소</i></a>
</body>
</html>