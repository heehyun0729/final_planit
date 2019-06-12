<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<h1>내 예약 목록</h1>
	<table border = "1">
		<tr>
			<th>등록일</th><th>예약 번호</th><th>숙소명/객실</th><th>인원</th>
			<th>체크인/체크아웃</th><th>상태</th><th>취소 및 환불</th>
		</tr>
		<c:forEach var = "vo" items = "${list }">
			<tr>
				<td>${vo.rsvnPay_date }</td>
				<td>
					<c:choose>
						<c:when test="${vo.rsvnPay_stat == 0 }">
							${vo.rsvn_num }
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<a href = "#">${vo.accom_name }</a><br>
					${vo.room_type }(${vo.room_capa }인실)
				</td>
				<td>${vo.rsvn_cnt }</td>
				<td>${vo.rsvn_checkin }<br>~ ${vo.rsvn_checkout }</td>
				<c:choose>
					<c:when test="${vo.rsvnPay_stat == 0 }">
						<td>결제완료</td>
						<td><input type = "button" value = "예약취소"></td>
					</c:when>
					<c:otherwise>
						<td>취소완료</td>
						<td>취소완료</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
</div>