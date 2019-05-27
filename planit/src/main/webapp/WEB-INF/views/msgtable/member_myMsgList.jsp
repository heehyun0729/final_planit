<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
var memChkId = "";
var xhr = null;
function checkUser() {
	var memId = document.getElementsByName("mem_id")[0];
	if(memId.value.length < 4 ){
		document.getElementById("memChk_res").innerHTML='<font color="red" id="memChk_ok">아이디는 최소 5자로 입력하세요.</font>';
		userId.value.focus();
		return false;
	}
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=checkUserResult;
	xhr.open("post","${pageContext.request.contextPath}/member/check",true);	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("memId=" + mem_id.value);
}
function checkUserResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {
			document.getElementById("memChk_res").innerHTML='<font color="gray" id="memChk_ok">사용 가능한 ID 입니다.</font>';
		} else {
			document.getElementById("memChk_res").innerHTML='<font color="red" id="memChk_fail">존재하지 않는 ID 입니다.</font>';
		}
		memChkId = document.getElementsByName("mem_id")[0].value;
	}
}
function sendMessage() {
	var memId = document.getElementsByName("mem_id")[0];
	if(memId.value.length < 4 ){
		document.getElementById("memChk_res").innerHTML='<font color="red" id="memChk_ok">아이디는 최소 5자로 입력하세요.</font>';
		memId.focus();
		return false;
	}
	var memChk = document.getElementById("memChk_ok");
	if(memChkId != mem_id.value || memChk == null || memChk.length == 0 ){
		document.getElementById("memChk_res").innerHTML='<font color="red" id="memChk_ok">아이디 확인을 해주세요.</font>';
		memId.focus();
		return false;
	}
	memChkId = mem_id.value;
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
	xhr.send("sendMemId=${mem_id}&receiveMemId=" + mem_id.value+"&content="+contHtml);
}
function sendMessageResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {			
			document.location="${pageContext.request.contextPath}/msgSendList?memId=${mem_id}&errMsg=쪽지를 보냈습니다.";
		} else {
			document.location="${pageContext.request.contextPath}/msgSendList?memId=${mem_id}&errMsg=오류가 발생했습니다.";
		}
	}
}
function detailMessage(msgNum){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=detailFormHtml;
	xhr.open("get","${pageContext.request.contextPath}/msg${type=='SEND'?'Send':'Receive'}Detail?msgNum="+msgNum,true);
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

<div id="myMsg">
	<div class="myPageBtns">
		<div id="errMsg" style="text-align: center;">
			<p>${param.errMsg }</p>
		</div>
		<div>
			<a 
				href="${pageContext.request.contextPath}/msgReceiveList?memId=${mem_id }&msgType=RECEIVE">받은쪽지함</a>
			<a 
				href="${pageContext.request.contextPath}/msgSendList?memId=${mem_id }&msgType=SEND">보낸쪽지함</a>
			<table class="myPageTable">
				<tr>
					<th>${type=="SEND" ? "받은사람" : "보낸사람"}</th>
					<th>쪽지내용</th>
					<th>작성일</th>
					<c:if test="${type=='SEND'}">
						<th>읽기여부</th>
					</c:if>
					<th>삭제</th>
				</tr>
				<c:choose>
					<c:when test="${list[0]==null && type=='SEND'}">
						<tr>
							<td colspan="5"><p style="text-align: center;">쪽지가 없습니다.</p></td>
						</tr>
					</c:when>
					<c:when test="${list[0]==null}">
						<tr>
							<td colspan="4"><p style="text-align: center;">쪽지가 없습니다.</p></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${type=="SEND" ? vo.receiveMemId : vo.sendMemId}</td>
								<td onclick="detailMessage(${vo.msgNum})"><a
									style="color: black;" href="#"><nobr>${vo.msgContent.replace("<br/>","")}</nobr></a>
								</td>
								<td>${vo.msgWdate}</td>
								<c:if test="${type=='SEND'}">
									<td>${vo.msgCheck > 0 ? "읽음" : "안읽음"}</td>
								</c:if>
								<td><input class="Btn" type="button" value="삭제"
									onclick="javascript:location.href='${pageContext.request.contextPath}/msgDelete?msgNum=${vo.msgNum}'">
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<div>
				<c:if test="${type=='RECEIVE'}">
					<c:choose>
						<c:when test="${pu.startPageNum  > 5 }">
							<a
								href="${pageContext.request.contextPath }/msgReceiveList?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}">[이전]</a>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${pu.startPageNum}"
						end="${pu.endPageNum }">
						<c:choose>
							<c:when test="${pu.pageNum==i }">
								<a
									href="${pageContext.request.contextPath }/msgReceiveList?pageNum=${i}&memId=${mem_id}"><span
									class="thisPage">[${i }]</span></a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath }/msgReceiveList?pageNum=${i}&memId=${mem_id}"><span
									class="thisPage">[${i }]</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pu.endPageNum < pu.totalPageCount}">
							<a
								href="${pageContext.request.contextPath }/msgReceiveList?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}">[다음]</a>
						</c:when>
					</c:choose>
				</c:if>
			</div>
			<div>
				<c:if test="${type=='SEND'}">
					<c:choose>
						<c:when test="${pu.startPageNum  > 5 }">
							<a
								href="${pageContext.request.contextPath }/msgSendList?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}">[이전]</a>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${pu.startPageNum}"
						end="${pu.endPageNum }">
						<c:choose>
							<c:when test="${pu.pageNum==i }">
								<a
									href="${pageContext.request.contextPath }/msgSendList?pageNum=${i}&memId=${mem_id}"><span
									class="thisPage">[${i }]</span></a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath }/msgSendList?pageNum=${i}&memId=${mem_id}"><span
									class="thisPage">[${i }]</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pu.endPageNum < pu.totalPageCount}">
							<a
								href="${pageContext.request.contextPath }/msgSendList?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}">[다음]</a>
						</c:when>
					</c:choose>
				</c:if>
			</div>
		</div>
		<br>
		<div id="msg_detail"></div>
		<div>
			<br/> <input id="msgSendBtn" class="userMypageUpdateBtn"
				type="button" value="쪽지보내기" onclick="detailSendForm()" /><br>
			<br/> <a href="<c:url value='/'/>">메인페이지</a>
		</div>
	</div>
</div>
