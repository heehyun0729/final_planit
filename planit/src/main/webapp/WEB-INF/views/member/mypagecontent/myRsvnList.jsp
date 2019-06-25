<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section style = "margin-top:60px;">
	<div class="container">
		<div class="section_title">
        	<h2>내 예약 목록</h2>
        </div>
        <p>예약번호를 클릭하면 상세정보를 조회할 수 있습니다.</p>
	 	<div class="row" style = "margin-bottom: 30px;">
 			<table class="table text-center" style = "border-bottom: 1px solid #dee2e6;">
				<tr>
					<th>등록일</th><th>예약번호</th><th>숙소명/객실</th><th>인원</th>
					<th>체크인/체크아웃</th><th>상태</th><th>비고</th>
				</tr>
				<c:forEach var = "vo" items = "${list }">
					<tr>
						<td class = "align-middle">${vo.rsvnPay_date }</td>
						<td class = "align-middle">
							<c:choose>
								<c:when test="${vo.rsvnPay_stat == 0 }">
									<a href = "#" class = "showRsvnDetail">${vo.rsvn_num }</a>
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
						<td class = "align-middle">
							<a href = "<c:url value='/reservation/accomDetail?accom_num=${vo.accom_num }'/>" target="_blank" style = "color:#ff5252;font-size:18px;">${vo.accom_name }</a><br>
							${vo.room_type }(${vo.room_capa }인실)
						</td>
						<td class = "align-middle">${vo.rsvn_cnt }</td>
						<td class = "align-middle">${vo.rsvn_checkin } ~ ${vo.rsvn_checkout }</td>
						<c:choose>
							<c:when test="${vo.rsvnPay_stat == 0 && vo.status == 0}">
								<td class = "align-middle">결제완료</td>
								<td class = "align-middle"><input type = "button" value = "예약취소" class="genric-btn default small" onclick = "payRefund('${vo.rsvn_num}', '${vo.rsvnPay_id }')"></td>
							</c:when>
							<c:when test="${vo.rsvnPay_stat == 0 && vo.status == 1}">
								<td class = "align-middle">이용중</td>
								<td class = "align-middle">-</td>
							</c:when>
							<c:when test="${vo.rsvnPay_stat == 0 && vo.status == 2}">
								<td class = "align-middle">이용완료</td>
								<td class = "align-middle"><a href = "<c:url value='/reservationReview/reservationReviewInsert?rsvn_num=${vo.rsvn_num }&accom_num=${vo.accom_num }'/>" class="genric-btn primary small">후기작성</a></td>
							</c:when>
							<c:when test="${vo.rsvnPay_stat == 0 && vo.status == 3}">
								<td class = "align-middle">이용완료</td>
								<td class = "align-middle">후기작성완료</td>
							</c:when>
							<c:otherwise>
								<td class = "align-middle">취소완료</td>
								<td class = "align-middle">-</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<nav class="blog-pagination justify-content-center d-flex">
           <ul class="pagination">
               <li class="page-item">
               	<c:if test="${startPage > 1 }">
					<a class="page-link" aria-label="이전" href = "<c:url value = '/member/mypage/${sessionScope.mem_id }/myRsvnList?pageNum=${startPage - 1 }&field=${field }&keyword=${keyword }'/>">
						<span aria-hidden="true">
                           <span class="lnr lnr-chevron-left"></span>
                       </span>
					</a>
				</c:if>
               </li>
               <c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
					<c:choose>
						<c:when test="${i == pageNum }">
							<li class="page-item active"><a class="page-link" href = "<c:url value = '/member/mypage/${sessionScope.mem_id }/myRsvnList?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href = "<c:url value = '/member/mypage/${sessionScope.mem_id }/myRsvnList?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
               <li class="page-item">
               		<c:if test="${endPage < pageCnt }">
						<a class="page-link" aria-label="다음" href = "<c:url value = '/member/mypage/${sessionScope.mem_id }/myRsvnList?pageNum=${endPage + 1 }&field=${field }&keyword=${keyword }'/>">
							<span aria-hidden="true">
	                           <span class="lnr lnr-chevron-right"></span>
	                       </span>
						</a>
					</c:if>
               </li>
           </ul>
       </nav>
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
			      	<div class="container">
				        <h6>예약 정보</h6>
			        	<div class="row mb-30">
				        	<table class = "table text-center" id = "rsvnInfo" style = "border-bottom: 1px solid #dee2e6;">
				        		<tr>
				        			<th>예약번호</th><th>숙소명/객실</th><th>인원</th><th>체크인/체크아웃</th>
				        		</tr>
				        		<tr>
				        			<td class = "align-middle"></td><td class = "align-middle"></td>
				        			<td class = "align-middle"></td><td class = "align-middle"></td>
				        		</tr>
				        	</table>
			        	</div>
			        	<h6>투숙객 정보</h6>
			        	<div class="row mb-30">
			        		<table class = "table table-bordered" id = "customerInfo" style = "border-bottom: 1px solid #dee2e6;">
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
			        	<h6>결제 정보</h6>
			        	<div class="row mb-30">
			        		<table class = "table table-bordered" id = "payInfo" style = "border-bottom: 1px solid #dee2e6;">
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
</section>