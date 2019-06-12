<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="myPageTable">
	<tr>
		<td>받을사람</td>
		<td>
			<input type="text" id="memId" name="memId" value="${id}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td>쪽지내용</td>
		<td>
			<textarea rows="5" cols="70%" id="content" name="content"></textarea>
		</td>
	</tr>
</table>
<input class="userMsgSendBtn" type="button" value="보내기" onclick="sendMessage()" />
<input class="userMsgCancelBtn" type="button" value="취소" onclick="detailClose()" />

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.0.min.js"></script>
<script>
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
	console.log("lll:"+memId);
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
	xhr.open("post","${pageContext.request.contextPath}/msgSendForm",true);	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("receiveMemId=${mem_id}&sendMemId=" + memId+"&msgContent="+contHtml);
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
function detailMessage(num){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=detailFormHtml;
	xhr.open("get","${pageContext.request.contextPath}/msg${type=='SEND'?'Send':'Receive'}Detail?msgNum="+num,true);
	xhr.send();
}
function detailSendForm(){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=detailFormHtml;
	xhr.open("get","${pageContext.request.contextPath}/msgSendForm",true);
	xhr.send();
}
function detailFormHtml(){
	if(xhr.readyState==4 && xhr.status==200){
		var resHtml=xhr.responseText;
		document.getElementById("msg_detail").innerHTML=resHtml;
		var msgSendBtn=document.getElementById("msgSendBtn");
		msgSendBtn.style="display:none;";
	}
}
function detailClose() {
	document.getElementById("msg_detail").innerHTML="";
	msgSendBtn.style="";
}
</script>