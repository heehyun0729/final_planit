<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<h1>예약 목록</h1>
	<table border = "1">
		<tr>
			<th>예약번호<br>(결제일)</th><th>숙소명<br>(객실)</th><th>체크인<br>~ 체크아웃</th><th>인원수</th>
			<th>투숙객명</th><th>이메일</th><th>연락처</th><th>결제금액</th><th>상태</th>
		</tr>
		<c:forEach var = "vo" items = "${list }">
			<tr>
				<td>
					${vo.rsvn_num }<br>
					(${vo.rsvnPay_date })
				</td>
				<td>
					${vo.accom_name }<br>
					(${vo.room_type } - ${vo.room_capa }인실)
				</td>
				<td>
					${vo.rsvn_checkin }<br>
					~ ${vo.rsvn_checkout }
				</td>
				<td>${vo.rsvn_cnt }명</td>
				<td>${vo.rsvn_name }</td>
				<td>${vo.rsvn_email }</td>
				<td>${vo.rsvn_phone }</td>
				<td>${vo.rsvnPay_total }원</td>
				<td>
					<c:choose>
						<c:when test="${vo.rsvnPay_stat == 0}">
							예약 완료
						</c:when>
						<c:otherwise>
							예약 취소
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${startPage > 1 }">
			<a href = "<c:url value = '/seller/reservation/list?mem_id=${sessionScope.mem_id }&pageNum=${startPage - 1 }'/>"><span style = "color:skyblue;">[이전]</span></a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
			<c:choose>
				<c:when test="${i == pageNum }">
					<a href = "<c:url value = '/seller/reservation/list?mem_id=${sessionScope.mem_id }&pageNum=${i }'/>"><span style = "color:skyblue;">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href = "<c:url value = '/seller/reservation/list?mem_id=${sessionScope.mem_id }&pageNum=${i }'/>"><span style = "color:gray;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href = "<c:url value = '/seller/reservation/list?mem_id=${sessionScope.mem_id }&pageNum=${endPage + 1 }'/>"><span style = "color:skyblue;">[다음]</span></a>
		</c:if>
	</div>
</div>