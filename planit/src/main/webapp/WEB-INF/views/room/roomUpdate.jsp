<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>수정하기</h1>
<form method="post" action="roomUpdate" enctype="multipart/form-data">
	숙소번호 ${vo.accom_num }<br/>
	<input type="hidden" name="room_num" value="${vo1.room_num }">
	방타입 ${vo1.room_type }<br/>
	방가격 <input type="text" name="room_price" value="${vo1.room_price}">원<br/>
	숙소평 <textarea rows="5" cols="50" name="room_comm">${vo1.room_comm }</textarea><br/>
	방인원 <input type="text" name="room_capa" value="${vo1.room_capa}">명<br/>
	수정할파일 <input type="file" name="file1"><br/>
	<input type="submit" value="저장">
</form>









