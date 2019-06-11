<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1>예약</h1>
	<div>
		<div style = "display: inline-block;float: left;">
			<img style = "width: 320px; height: 240px;" src = "<c:url value='/resources/uploadAccom/${avo.accommImg_saveImg }'/>">
		</div>
		<div style = "display: inline-block;float: left;">
			<table border = "1">
				<tr>
					<th>숙소명</th>
					<td>${avo.accom_name }</td>
				</tr>
				<tr>
					<th>객실명</th>
					<td>${rvo.room_type }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${avo.accom_addr }</td>
				</tr>
				<tr>
					<th>숙박인원</th>
					<td>${cnt }명</td>
				</tr>
				<tr>
					<th>투숙기간</th>
					<td>${checkin} ~ ${checkout }, ${stay }박</td>
				</tr>
			</table>
		</div>
	</div>
	<div style = "clear:both;">
		<table border = "1">
			<tr>
				<th>1박 가격</th>
				<td>${rvo.room_price }원</td>
			</tr>
			<tr>
				<th>총 숙박비(${stay}박)</th>
				<td>${rvo.room_price } x ${stay } = ${rvo.room_price * stay}원</td>
			</tr>
		</table>
	</div>
	<div>
		<h4>투숙객 정보</h4>
		<table border = "1">
			<tr>
				<th>투숙자명</th>
				<td><input type = "text" id = "rsvnName"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type = "text" id = "rsvnEmail"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type = "text" id = "rsvnPhone" placeholder="- 없이 입력"></td>
			</tr>
		</table>
		<span id = "rsvnFormMsg" style = "color: red;"></span>
	</div>
	<div>
		<span>결제 예정 금액</span>
		<h5>${rvo.room_price * stay}원</h5>
	</div>
	<div> 
		<input type = "hidden" value = "${avo.accom_name}(${rvo.room_type}-${rvo.room_capa }인실)" id = "rsvnItem">
		<input type = "hidden" value = "${rvo.room_price * stay}" id = "rsvnTotal">
		<input type = "button" value = "취소하기" onclick="javascript:history.go(-1)">
		<input type = "button" value = "결제하기" onclick="javascript:rsvnPay()">
	</div>
	<!-- 결제 모달 -->
	<div id="rsvnPayModal" class="modal fade" role="dialog">
	  <div class="modal-dialog" role="document" style = "max-width: 100%;">
	    <div class="modal-content">
	      <div class="modal-header"> 
	        <h5>결제하기</h5>
	      </div>
	      <div class="modal-body">
             
            </div>
	    </div>
	  </div>
	</div>
</div>