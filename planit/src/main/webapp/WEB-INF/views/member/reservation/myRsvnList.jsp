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
							<a href = "#" class = "showRsvnDetail">${vo.rsvn_num }</a>
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<a href = "<c:url value='/reservation/accomDetail?accom_num=${vo.accom_num }'/>" target="_blank">${vo.accom_name }</a><br>
					${vo.room_type }(${vo.room_capa }인실)
				</td>
				<td>${vo.rsvn_cnt }</td>
				<td>${vo.rsvn_checkin } ~ ${vo.rsvn_checkout }</td>
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
	<div>
		<c:if test="${startPage > 1 }">
			<a href = "<c:url value = '/member/mypage/${sessionScope.mem_id }reservation//list?pageNum=${startPage - 1 }'/>"><span style = "color:skyblue;">[이전]</span></a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
			<c:choose>
				<c:when test="${i == pageNum }">
					<a href = "<c:url value = '/member/mypage/${sessionScope.mem_id }/reservation/list?pageNum=${i }'/>"><span style = "color:skyblue;">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href = "<c:url value = '/member/mypage/${sessionScope.mem_id }/reservation/list?pageNum=${i }'/>"><span style = "color:gray;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href = "<c:url value = '/member/mypage/${sessionScope.mem_id }/reservation/list?pageNum=${endPage + 1 }'/>"><span style = "color:skyblue;">[다음]</span></a>
		</c:if>
	</div>
	<!-- 예약 상세 모달 -->
	<div id = "rsvnDetailModal" class="modal fade" role="dialog">
			<div class="modal-dialog ">
				<div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">예약 상세보기</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <div id = "rsvnDetail">
			        	<div>
				        	<h5>예약 정보</h5>
				        	<table border = "1" id = "rsvnInfo">
				        		<tr>
				        			<th>예약번호</th><th>숙소명/객실</th><th>인원</th><th>체크인/체크아웃</th>
				        		</tr>
				        		<tr>
				        			<td></td><td></td><td></td><td></td>
				        		</tr>
				        	</table>
			        	</div>
			        	<div style = "display: inline-block;float: left;">
			        		<h5>투숙객 정보</h5>
			        		<table border = "1" id = "customerInfo">
			        			<tr>
			        				<th>이름</th>
			        				<td></td>
			        			</tr>
			        			<tr>
			        				<th>이메일</th>
			        				<td></td>
			        			</tr>
			        			<tr>
			        				<th>연락처</th>
			        				<td></td>
			        			</tr>
			        		</table>
			        	</div>
			        	<div style = "display: inline-block;float: left;">
			        		<h5>결제 정보</h5>
			        		<table border = "1" id = "payInfo">
			        			<tr>
			        				<th>결제금액</th>
			        				<td></td>
			        			</tr>
			        			<tr>
			        				<th>결제일</th>
			        				<td></td>
			        			</tr>
			        			<tr>
			        				<th>상태</th>
			        				<td></td>
			        			</tr>
			        		</table>
			        	</div>
			        </div>
			      </div>
			    </div>
		    </div>
		</div>
</div>