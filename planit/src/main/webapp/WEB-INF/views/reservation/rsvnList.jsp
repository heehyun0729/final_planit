<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1>예약</h1>
	<div id = "rsvnMenu">
		<ul>
			<li><a href="<c:url value=''/>">숙소예약후기</a></li>
			<li><a href="<c:url value='/acommQna'/>">숙소문의</a></li>
			<li><a href="<c:url value='/reservationForm'/>">숙소예약</a></li>
			<li><a href="<c:url value='/sellerInsertListForm'/>">판매자 등록 리스트</a></li>
		</ul>
	</div>
	<div id = "accomSearch">
		<form method="post" action="<c:url value = '/reservation/list'/>">
			도시 혹은 숙소: <input type="text" id="rsvnKeyword" name = "keyword" value = "${keyword }">
			날짜: <input type="text" id="checkin" name = "checkin" value = "${checkin }"> ~ <input type="text" id="checkout" name = "checkout" value = "${checkout }">
			인원 : <input type="button" id="decrease" value = "-" onclick="decreaseCnt()">
				  <input type="number" id="rsvnCnt" min="1" name = "cnt" value = "${cnt }">
				  <input type="button" id="increase" value="+" onclick="increaseCnt()">
			<input type="submit" value="검색">
		</form>
	</div>
	<div id = "accomList">
		<c:if test="${empty list }">
			<div>조회된 결과가 없습니다.</div>
		</c:if>
		<c:forEach var="vo" items="${list }">
			<div class = "accomDiv">
				<div>
					<a href="<c:url value='/reservation/detail?accom_num=${vo.accom_num }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>"><img src="<c:url value='/resources/uploadAccom/${vo.accommImg_saveImg }'/>"></a>
				</div>
				<div>
					<p><a href="<c:url value='/reservation/detail?accom_num=${vo.accom_num }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>">${vo.accom_name }</a></p>
					<p>${vo.accom_city }, ${vo.accom_country }</p>
					<p>${vo.room_price }원 ~</p>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id = "accomPage">
		<c:if test="${startPage > 1 }">
			<a href = "<c:url value = '/reservation/list?pageNum=${startPage - 1 }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>"><span style = "color:skyblue;">[이전]</span></a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
			<c:choose>
				<c:when test="${i == pageNum }">
					<a href = "<c:url value = '/reservation/list?pageNum=${i }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>"><span style = "color:skyblue;">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href = "<c:url value = '/reservation/list?pageNum=${i }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>"><span style = "color:gray;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href = "<c:url value = '/reservation/list?pageNum=${endPage + 1 }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>"><span style = "color:skyblue;">[다음]</span></a>
		</c:if>
	</div>
</div>