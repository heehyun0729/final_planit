<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="myPageTable">
	<tr>
		<th>${type=="SEND" ? "받은사람" : "보낸사람"}</th>
		<th>보낸시간</th>
		<th>쪽지내용</th>
	</tr>
	<tr>
		<td>${type=="SEND" ? vo.receiveUserId : vo.sendUserId}</td>
		<td>${vo.msgWdate}</td>
		<td width="300">${vo.msgContent}</td>
	</tr>
</table>
<br />
<input class="Btn" type="button" value="닫기" onclick="detailClose()" />
