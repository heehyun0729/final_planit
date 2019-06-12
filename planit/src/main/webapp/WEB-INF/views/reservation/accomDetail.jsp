<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script async defer type="text/javascript"
	src="//maps.googleapis.com/maps/api/js?key=${sessionScope.key }"></script>
<div>
	<h1>숙소상세보기</h1>
	<div>
		<h2>${avo.accom_name }</h2>
		<p>${avo.accom_addr} <a href = "javascript:showMap('${avo.accom_addr }','${avo.accom_name }')">지도 보기</a></p>
	</div>
	<!-- 지도 모달 -->
	<div id="accomMapModal" class="modal fade" role="dialog">
	  <div class="modal-dialog" role="document" style = "max-width: 100%;">
	    <div class="modal-content">
	      <div class="modal-header"> 
	        ${avo.accom_name }의 위치
	      </div>
	      <div class="modal-body">
             <div id="accomMap"></div>
            </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	  
	<div id = "accomImage">
		 <img src = "<c:url value='/resources/uploadAccom/${avo.accommImg_saveImg }'/>">
	</div>
	<div id = "accomIntro">
		<h3>숙소설명</h3>
		<div>${avo.accom_comm }</div>
	</div>
	<div id = "roomSearch">
		<form method="post" action="<c:url value = '/reservation/detail?accom_num=${avo.accom_num}'/>">
			<input type="text" id="checkin" value = "${checkin }" name = "checkin"> ~ <input type="text" id="checkout" value = "${checkout }" name = "checkout">
			인원 : <input type="button" id="decrease" value = "-" onclick="decreaseCnt()">
				  <input type="number" id="rsvnCnt" min="1" value = "${cnt }" name = "cnt">
				  <input type="button" id="increase" value="+" onclick="increaseCnt()">
			<input type="submit" value="검색">
		</form>
	</div>
	<div id = "roomList">
		<c:if test="${empty rlist }">
			<div>예약 가능한 방이 없습니다.</div>
		</c:if>
		<c:forEach var = "rvo" items = "${rlist }">
			<div class = "roomDiv">
				<div>
					<span class = "roomName"><a href = "javascript:openRoomDialog(${rvo.room_num})">${rvo.room_type }</a></span><span>(${rvo.room_capa }인실)</span>
				</div>
				<div class = "roomImg">
					<img src = "<c:url value='/resources/uploadRoom/${rvo.room_images[0].roomImg_saveImg}'/>">
				</div>
				<div class = "roomComm">
					<p>${rvo.room_comm }</p>
				</div>
				<div class = "roomBtn">
					<input type = "button" class="btn btn-primary" value = "예약하기" onclick="javascript:openRsvnDialog(${rvo.room_num})">
				</div>
				<div class = "roomPrice">
					<p>1박 가격</p>
					<h4>${rvo.room_price }원</h4>
				</div>
			</div>
			<div style = "clear:both;"></div>
		</c:forEach>
	</div>
	<!-- 방 사진 모달 -->
	<div id = "roomDialog" class="modal fade" role="dialog">
		<div class="modal-dialog" style = "max-width: 100%;">
			<div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id = "modal-title"></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div id = "roomImages">
		        </div>
		      </div>
		    </div>
	    </div>
	</div>
	<!-- 예약 모달 -->
	<div id = "rsvnDialog" class="modal fade" role="dialog">
		<div class="modal-dialog ">
			<div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">예약하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div>
					<p>${avo.accom_name }</p>
					<p><span id = "roomName"></span><span id = "roomCapa"></span></p>
				</div>
				<form method="post" action="<c:url value='/reservation/book'/>">
					<div>
						<p>날짜 및 인원 선택</p>
						<input type = "hidden" id = "hiddenCnt" value = "${cnt }">
						<input type = "hidden" name = "accom_num" value = "${avo.accom_num }">
						<input type = "hidden" id = "room_num" name = "room_num">
						<input type = "hidden" id = "stay" name = "stay">
						<input type="text" style = "width:100px;" id="rsvnCheckinDatepicker" name = "checkin" value = "${checkin }">
						 ~ <input type="text" style = "width:100px;" id="rsvnCheckoutDatepicker" name = "checkout" value = "${checkout }">
						인원: <select id = "rsvnDialogCnt" name = "cnt">
						</select>
					</div>
					<div>
						<p id = "rsvnMsg"></p>
						<div>
							<span>총</span>
							<span id = "roomPrice">0원</span>
						</div>
					</div>
					<div>
						<input type = "submit" id = "btnPay" value = "결제하기">
					</div>
				</form>
		      </div>
		    </div>
	    </div>
	</div>
	
	<div id = "accomTabs">
		<ul>
		    <li><a href="#accomReview">후기</a></li>
		    <li><a href="#accomQna">문의</a></li>
		</ul>
		<div id="accomReview">
			<p>후기</p>
		</div>
	  	<div id="accomQna">
	  		<p>문의</p>
	  	</div>
	</div>
</div>