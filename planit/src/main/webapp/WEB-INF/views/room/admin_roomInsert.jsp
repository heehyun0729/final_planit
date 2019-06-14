<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>방정보등록</h1>

<form method="post" action="<c:url value='/admin/roomInsert'/>" enctype="multipart/form-data">
    <input type="hidden" name="accom_num"value="${param.accom_num}"><br/>
	방타입 <input type="text" name="room_type"><br/>
	가격 <input type="text" name="room_price">원<br/>
	방설명 <textarea rows="5" cols="50" name="room_comm"></textarea><br/>
	방인원 <input type="text" name="room_capa">명<br/>
	방이미지 <input type="file" name="file1"><br/>
	<input type="submit" value="등록">
</form>








