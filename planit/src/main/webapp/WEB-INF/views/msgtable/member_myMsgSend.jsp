<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="myPageTable">
	<tr>
		<td>받을사람</td>
		<td>
			<input type="text" id="memId" name="memId" value="${param.mem_id }" /> <input class="userMsgOkBtn" type="button" value="확인" onclick="checkUser()" /><span id="memChk_res"></span>
		</td>
	</tr>
	<tr>
		<td>쪽지내용</td>
		<td>
			<textarea rows="5" cols="70%" id="textarea1" name="content"></textarea>
		</td>
	</tr>
</table>
<input class="userMsgSendBtn" type="button" value="보내기" onclick="sendMessage()" />
<input class="userMsgCancelBtn" type="button" value="취소" onclick="detailClose()" />