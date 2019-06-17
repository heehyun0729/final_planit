<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>숙소리스트</h1>
	<table border="1" width="1000">
		<tr>
			<th>숙소번호</th>
			<th>판매자번호</th>
			<th>숙소이름</th>
			<th>숙소주소</th>
			<th>숙소설명</th>
			<th>국가</th>
			<th>도시</th>
			<th>이미지</th>
			<th>숙소수정</th>
			<th>숙소삭제</th>
			<th>방정보</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.accom_num }</td>
				<td>${vo.sell_num}</td>
				<td>${vo.accom_name }</td>
				<td>${vo.accom_addr }</td>
				<td>${vo.accom_comm }</td>
				<td>${vo.accom_country }</td>
				<td>${vo.accom_city }</td>
				<td><img style="width: 150px;height: 100px"src="<c:url value='/resources/uploadAccom/${vo.accommImg_saveImg }'/>"></td>	
				<td><a href="${pageContext.request.contextPath }/adminAccomUpdate?accom_num=${vo.accom_num}">숙소수정</a></td>
				<td><a href="${pageContext.request.contextPath }/admin/accomDelete?accom_num=${vo.accom_num}">숙소삭제</a></td>
				<td><a href="<c:url value='/admin/roomList?accom_num=${vo.accom_num }'/>">방정보</a></td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:choose>
			<c:when test="${pu.startPageNum  > 5 }">
				<a
					href="${pageContext.request.contextPath }/admin/accommList?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}&sell_num=${sell_num}">[이전]</a>
			</c:when>
		</c:choose>
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum==i }">
					<a
						href="${pageContext.request.contextPath }/admin/accommList?pageNum=${i}&sell_num=${sell_num}"><span
						class="thisPage">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a
						href="${pageContext.request.contextPath }/admin/accommList?pageNum=${i}&sell_num=${sell_num}"><span
						class="thisPage">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum < pu.totalPageCount}">
				<a
					href="${pageContext.request.contextPath }/admin/accommList?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}&sell_num=${sell_num}">[다음]</a>
			</c:when>
		</c:choose>
	</div>
	<div>
		<form method="post" action="<c:url value='/admin/accommList'/>">
			<select name="field">
			<option value="sell_num"
					<c:if test="${field=='sell_num'}">selected="selected"</c:if>>판매자번호</option>
				<option value="accom_country"
					<c:if test="${field=='accom_country'}">selected="selected"</c:if>>국가</option>
				<option value="accom_city"
					<c:if test="${field=='accom_city'}">selected="selected"</c:if>>도시</option>
			</select> <input type="text" name="keyword" value="${keyword }"> <input
				type="submit" value="검색">
		</form>
	</div>
	<a href="${pageContext.request.contextPath }/reservation/list/">예약페이지</a>















