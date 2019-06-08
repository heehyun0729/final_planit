<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방리스트</title>
</head>
<body>
<h1>방리스트</h1>
<table border="1">
	<tr>
		<td>번호</td>
		<td>타입</td>
		<td>가격</td>
		<td>설명</td>
		<td>이미지</td>
		<td>방삭제</td>
	</tr>
	<c:forEach var="vo" items="${list}" varStatus="status">	
	<tr>
		<td>${status.index+1}</td>
		<td>${vo.room_type}</td>
		<td>${vo.room_price}</td>
		<td>${vo.room_comm}</td>
		<td>
		<c:forEach var="img" items="${vo.room_images}">	
		<c:if test="${not empty img.roomImg_orgImg}">
			<img src="<c:url value='/resources/uploadRoom/${img.roomImg_saveImg}'/>" width="100" height="100" />
		    <a href="${pageContext.request.contextPath }/roomImageDelete?accom_num=${accom_num}&roomImg_num=${img.roomImg_num }">삭제</a>
		</c:if>
		</c:forEach>
	
		<form method="post" action="<c:url value='/roomImageInsert'/>?accom_num=${accom_num}" enctype="multipart/form-data">
		    <input type="hidden" name="room_num"value="${vo.room_num}">
			<input type="file" name="file1">
			<input type="submit" value="등록">
		</form>
		</td>
			<td><a href="${pageContext.request.contextPath }/roomDelete?accom_num=${accom_num}&room_num=${vo.room_num }">삭제</a></td>
	</tr>
	</c:forEach>
</table>
<a href="<c:url value='/roomInsert?accom_num=${param.accom_num }'/>">방추가</a>
</body>
</html>








