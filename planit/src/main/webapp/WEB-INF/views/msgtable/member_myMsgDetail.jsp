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
<input class="Btn" type="button" value="답장하기" onclick="detailClose()" />
<input class="Btn" type="button" value="닫기" onclick="detailClose()" />
<script>
function detailClose() {
	window.close();
}
</script>