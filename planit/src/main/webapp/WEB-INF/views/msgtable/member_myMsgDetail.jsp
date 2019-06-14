<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="myPageTable" border=1 width:400>
	<tr>
		<th>${type=="SEND" ? "받은사람" : "보낸사람"}</th>
		<th>보낸시간</th>
		<th>쪽지내용</th>
	</tr>
	<tr>
		<td>${type=="SEND" ? vo.receiveMemId : vo.sendMemId}</td>
		<td>${vo.msgWdate}</td>
		<td>${vo.msgContent}</td>
	</tr>
</table>
<br />
<c:if test="${type=='RECEIVE'}">
<input class="Btn" type="button" value="답장하기" onclick="reSend('${vo.receiveMemId}')" />
</c:if>
<input class="Btn" type="button" value="닫기" onclick="detailClose()" />
<script>

function reSend(receiveMemId){
	var popUrl = "${pageContext.request.contextPath}/msgSendForm?id="+receiveMemId;
	var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"답장보내기",popOption);	
		opener.parent.location.reload();
		window.close();
}
function detailClose() {
	opener.parent.location.reload();
	window.close();
}

</script>