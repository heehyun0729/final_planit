<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/responsive.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/nice-select/css/nice-select.css'/>">
</head>
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
			document.location="${pageContext.request.contextPath}/admin/msgSendList?memId=${sessionScope.mem_id }&msgType=SEND&errMsg=쪽지를 보냈습니다.";
		} else {
			document.location="${pageContext.request.contextPath}/admin/msgSendList?memId=${sessionScope.mem_id }&msgType=SEND&errMsg=오류가 발생했습니다.";
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
<script>
function dm(num){
		var popUrl = "${pageContext.request.contextPath}/msg${type=='SEND'?'Send':'Receive'}Detail?msgNum="+num;
		var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"상세보기",popOption);
			
}
function ppp(){
	var popUrl = "<c:url value='/msgSendfForm'/>";
	var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"쪽지보내기",popOption);
		
}
</script>
<body>
<div class="container" style="width:500px;margin: auto">
	<div class="row mt-5">
		<div class="col d-flex justify-content-start align-items-center text-center mt-5">
<div id="myMsg">
	<div class="myPageBtns">
		<div id="errMsg" style="text-align: center;">
			<p>${param.errMsg }</p>
		</div>
		<div>
		    <a href="${pageContext.request.contextPath}/admin/msgReceiveList?memId=${mem_id }&msgType=RECEIVE" class="genric-btn info circle">받은 쪽지함</a>
			&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/admin/msgSendList?memId=${mem_id }&msgType=SEND" class="genric-btn info circle">보낸쪽지함</a>
			<br/><br/>
			<table class="table">
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
								<td onclick="dm(${vo.msgNum})"><a
									style="color: pink;" href="#"><nobr>${vo.msgContent.replace("<br/>","")}</nobr></a>
								</td>
								<td>${vo.msgWdate}</td>
								<c:if test="${type=='SEND'}">
									<td>${vo.msgCheck > 0 ? "읽음" : "안읽음"}</td>
								</c:if>
								<c:if test="${type=='SEND'}">
								<td><a href="#"	onclick="javascript:location.href='${pageContext.request.contextPath}/admin/msgDelete?msgNum=${vo.msgNum}'"><i class="fas fa-trash" style="color: #339af0;"></i></a>
								</td>
								</c:if>
								<c:if test="${type=='RECEIVE'}">
								<td><a href="#"	onclick="javascript:location.href='${pageContext.request.contextPath}/admin/msgDeletee?msgNum=${vo.msgNum}'"><i class="fas fa-trash" style="color: #339af0;"></i></a>
								</td>
								</c:if>
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
								href="${pageContext.request.contextPath }/admin/msgReceiveList?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}&memId=${mem_id}&msgType=RECEIVE">[이전]</a>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${pu.startPageNum}"
						end="${pu.endPageNum }">
						<c:choose>
							<c:when test="${pu.pageNum==i }">
								<a
									href="${pageContext.request.contextPath }/admin/msgReceiveList?pageNum=${i}&memId=${mem_id}&msgType=RECEIVE"><span
									class="thisPage">[${i }]</span></a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath }/admin/msgReceiveList?pageNum=${i}&memId=${mem_id}&msgType=RECEIVE"><span
									class="thisPage">[${i }]</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pu.endPageNum < pu.totalPageCount}">
							<a
								href="${pageContext.request.contextPath }/admin/msgReceiveList?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}&memId=${mem_id}&msgType=RECEIVE">[다음]</a>
						</c:when>
					</c:choose>
					<br/>
					<div>
		<form method="post" id="form1" class="form-inline d-flex justify-content-center" action="<c:url value='/admin/msgReceiveList?memId=${mem_id }&msgType=RECEIVE'/>">
			<select name="field" class="custom-select">
				<option value="sendMemId"
					<c:if test="${field=='sendMemId'}">selected="selected"</c:if>>보낸아이디</option>
			</select> <input type="text" name="keyword" value="${keyword }"> 
			<a href="#" onclick="$('#form1').submit();"><i class="fas fa-search" style="color: #339af0;"></i></a>
		</form>
	</div>
				</c:if>
			</div>
			<div>
				<c:if test="${type=='SEND'}">
					<c:choose>
						<c:when test="${pu.startPageNum  > 5 }">
							<a
								href="${pageContext.request.contextPath }/admin/msgSendList?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}&memId=${mem_id}&msgType=SEND">[이전]</a>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${pu.startPageNum}"
						end="${pu.endPageNum }">
						<c:choose>
							<c:when test="${pu.pageNum==i }">
								<a
									href="${pageContext.request.contextPath }/admin/msgSendList?pageNum=${i}&memId=${mem_id}&msgType=SEND"><span
									class="thisPage">[${i }]</span></a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath }/admin/msgSendList?pageNum=${i}&memId=${mem_id}&msgType=SEND"><span
									class="thisPage">[${i }]</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pu.endPageNum < pu.totalPageCount}">
							<a
								href="${pageContext.request.contextPath }/admin/msgSendList?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}&memId=${mem_id}&msgType=SEND">[다음]</a>
						</c:when>
					</c:choose>
					<br/>
					<div>
		<form method="post" id="form1" class="form-inline d-flex justify-content-center" action="<c:url value='/admin/msgSendList?memId=${mem_id }&msgType=SEND'/>">
			<select name="field" class="custom-select">
				<option value="receiveMemId"
					<c:if test="${field=='receiveMemId'}">selected="selected"</c:if>>받은아이디</option>
			</select> <input type="text" name="keyword" value="${keyword }">
			<a href="#" onclick="$('#form1').submit();"><i class="fas fa-search" style="color: #339af0;"></i></a>
		</form>
	</div>
				</c:if>
			</div>
		</div>
		<br/>
		<div id="msg_detail"></div>
		<div> 
			<br/><a href="#"	onclick="ppp()"><i class="fas fa-paper-plane" style="color: #339af0;"> 쪽지보내기</i></a><br/>
			<br/> <a href="<c:url value='/'/>">메인 페이지</a>
		</div>
	</div>
</div>
</div>
</div>
</div>
</body>
</html>