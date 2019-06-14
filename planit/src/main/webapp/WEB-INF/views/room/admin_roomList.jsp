<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>방리스트</h1>
<table border="1">
	<tr>
		<td>번호</td>
		<td>타입</td>
		<td>가격</td>
		<td>설명</td>
		<td>이미지</td>
		<td>방인원</td>
		<td>방수정</td>
		<td>방삭제</td>
	</tr>
	<c:forEach var="vo" items="${list}" varStatus="status">	
	<tr>
		<td>${status.index+1}</td>
		<td>${vo.room_type}</td>
		<td>${vo.room_price}원</td>
		<td>${vo.room_comm}</td>
		<td>
		<c:forEach var="img" items="${vo.room_images}">	
		<c:if test="${not empty img.roomImg_orgImg}">
			<img src="<c:url value='/resources/uploadRoom/${img.roomImg_saveImg}'/>" width="100" height="100" />
		    <a href="${pageContext.request.contextPath }/admin/roomImageDelete?accom_num=${accom_num}&roomImg_num=${img.roomImg_num }">삭제</a>
		</c:if>
		</c:forEach>
	
		<form method="post" action="<c:url value='/admin/roomImageInsert'/>?accom_num=${accom_num}" enctype="multipart/form-data">
		    <input type="hidden" name="room_num"value="${vo.room_num}">
			<input type="file" name="file1">
			<input type="submit" value="등록">
		</form>
		</td>
			<td>${vo.room_capa}명</td>
		    <td><a href="${pageContext.request.contextPath }/adminRoomUpdate?accom_num=${accom_num}&room_num=${vo.room_num }">방수정</a></td>
			<td><a href="${pageContext.request.contextPath }/admin/roomDelete?accom_num=${accom_num}&room_num=${vo.room_num }">방삭제</a></td>
	</tr>
	</c:forEach>
</table>
<div>
		<c:choose>
			<c:when test="${pu.startPageNum  > 5 }">
				<a
					href="${pageContext.request.contextPath }/admin/roomList?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}&accom_num=${accom_num}">[이전]</a>
			</c:when>
		</c:choose>
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum==i }">
					<a
						href="${pageContext.request.contextPath }/admin/roomList?pageNum=${i}&accom_num=${accom_num}"><span
						class="thisPage">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a
						href="${pageContext.request.contextPath }/admin/roomList?pageNum=${i}&accom_num=${accom_num}"><span
						class="thisPage">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum < pu.totalPageCount}">
				<a
					href="${pageContext.request.contextPath }/admin/roomList?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}&accom_num=${accom_num}">[다음]</a>
			</c:when>
		</c:choose>
	</div>
	<div>
		<form method="post" action="<c:url value='/admin/roomList?accom_num=${param.accom_num}'/>">
			<select name="field">
				<option value="room_type"
					<c:if test="${field=='room_type'}">selected="selected"</c:if>>방타입</option>
			</select> <input type="text" name="keyword" value="${keyword }"> <input
				type="submit" value="검색">
		</form>
	</div>
<a href="<c:url value='/admin/roomInsert?accom_num=${param.accom_num }'/>">방추가</a>
<a href="<c:url value='/admin/accommList'/>">숙소리스트</a>








