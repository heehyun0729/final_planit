<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax"style="background: url(../resources/images/room.jpg)"></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">숙소예약</h2>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<section class="section_gap">
	<div class="container">
	 	<h4>예약 정보</h4>
	 	<div class="row" style = "margin-bottom: 40px;">
	 		<div class = "col-lg-4" style = "overflow:hidden;">
	 			<img style = "height: 240px;" src = "<c:url value='/resources/uploadAccom/${avo.accommImg_saveImg }'/>">
	 		</div>
	 		<div class = "col-lg-8" style = "overflow:hidden;padding-left: 50px;">
	 			<table class="table" style = "border-bottom: 1px solid #dee2e6;">
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
	 	<form method="post" action="<c:url value='/reservation/insert'/>">
		 	<div class="row d-flex justify-content-around" style = "margin-bottom: 40px;">
		 		<div class = "col-lg-5 p-2">
		 			<div class = "row">
		 				<h4>예약자 정보</h4>
			 			<table class = "table" style = "border-bottom: 1px solid #dee2e6;height: 168px;">
							<tr>
								<th class = "align-middle">예약자명</th>
								<td class = "align-middle" id = "memName">${mvo.mem_nickname }</td>
							</tr>
							<tr>
								<th class = "align-middle">이메일</th>
								<td class = "align-middle" id = "memEmail">${mvo.mem_email }</td>
							</tr>
						</table>
					</div>
		 		</div>
		 		<div class = "col-lg-5 p-2">
		 			<div class = "row">
		 				<div class = "form-check-inline">
			 				<h4 style = "margin-right: 20px;">투숙객 정보</h4>
							<div class="primary-checkbox">
								<input type="checkbox" id="rsvnChk" checked="checked" onclick="javascript:setRsvnInfo()">
								<label for="rsvnChk"></label>
							</div>
							<span>&nbsp;예약자와 동일</span>
						</div>
						<table class = "table" style = "border-bottom: 1px solid #dee2e6;">
							<tr>
								<th class = "align-middle">투숙자명</th>
								<td><input type = "text" id = "rsvnName" name = "name" value = "${mvo.mem_nickname }" class = "form-control form-control-sm single-input"></td>
							</tr>
							<tr>
								<th class = "align-middle">이메일</th>
								<td><input type = "text" id = "rsvnEmail" name = "email" value = "${mvo.mem_email }" class = "form-control form-control-sm single-input"></td>
							</tr>
							<tr>
								<th class = "align-middle">연락처</th>
								<td><input type = "text" id = "rsvnPhone" name = "phone" placeholder="- 없이 입력" class = "form-control form-control-sm single-input"></td>
							</tr>
						</table>
						<span id = "rsvnFormMsg" style = "color: red;"></span>
					</div>
		 		</div>
	 		</div>
	 	
	 		<div class="row d-flex justify-content-center">
	 			<h4 class = "p-2">결제 정보</h4>
	 		</div>
		 	<div class="row d-flex justify-content-center" style = "margin-bottom: 40px;">
		 		<div class = "col-lg-4 p-2" style = "border: 2px solid #52C5FD;border-radius: 10px;">
		 			<div class = "row d-flex" style = "padding: 0 15px;">
		 				<div class = "p-2" style = "margin-top:10px;">
		 					<span style = "font-size:18px;">1박 가격</span>
		 				</div>
		 				<div class = "ml-auto p-2">
		 					<span class = "sec_h4">${rvo.room_price }원</span>
		 				</div>
		 			</div>
		 			<div class = "row d-flex" style = "padding: 0 15px;">
		 				<div class = "p-2" style = "margin-top:10px;">
		 					<span style = "font-size:18px;">총 숙박비(${stay}박)</span>
		 				</div>
		 				<div class = "ml-auto p-2">
		 					<span class = "sec_h4">${rvo.room_price } x ${stay } = <span style = "color:#ff5252">${rvo.room_price * stay}</span>원</span>
		 				</div>
		 			</div>
		 		</div>
		 	</div>
		 	<input type = "hidden" value = "${rvo.room_num}" name = "room_num">
			<input type = "hidden" value = "${checkin}" name = "checkin">
			<input type = "hidden" value = "${checkout}" name = "checkout">
			<input type = "hidden" value = "${cnt}" name = "cnt">
	        <input type = "hidden" id = "rsvn_tid" name = "tid">
			<input type = "hidden" value = "${avo.accom_name}(${rvo.room_type}-${rvo.room_capa }인실)" id = "rsvnItem">
			<input type = "hidden" value = "${rvo.room_price * stay}" id = "rsvnTotal" name = "total">
		 	<div class="row d-flex justify-content-center">
				<input type = "button" class = "p-2 genric-btn default-border circle" value = "취소" onclick="javascript:history.go(-1)">
				<a class = "p-2" href = "#" id = "payBtn" title = "결제">
					<img src = "<c:url value='/resources/adminImages/payment_icon_yellow_medium.png'/>">
				</a>
	 		</div>
		</form>
		<!-- 결제 모달 -->
		<div id="rsvnPayModal" class="modal fade" role="dialog">
		  <div class="modal-dialog" role="document" style = "max-width: 100%;">
		    <div class="modal-content">
		      <div class="modal-body">
	             <div id = "rsvnKakaoPay"></div>
	            </div>
		    </div>
		  </div>
		</div>
	</div>
</section>