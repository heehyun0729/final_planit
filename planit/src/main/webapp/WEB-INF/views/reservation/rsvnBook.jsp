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
	 	<h4 class = "sec_h4">예약 정보</h4>
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
	 	<div class="row">
	 		<div class = "col-lg-12">
	 			<table class="table" style = "width:80%;margin-left:10%;margin-right: 10%;border-bottom: 1px solid #dee2e6;">
					<tr>
						<td style = "font-size:20px;" class="align-middle">1박 가격</td>
						<td class = "sec_h4 text-right">${rvo.room_price }원</td>
					</tr>
					<tr>
						<td style = "font-size:20px;" class="align-middle">총 숙박비(${stay}박)</td>
						<td class = "sec_h4 text-right">${rvo.room_price } x ${stay } = <span style = "color:#ff5252">${rvo.room_price * stay}</span>원</td>
					</tr>
				</table>
	 		</div>
	 	</div>
	 	<div class="row">
	 		<div class = "col-lg-5">
	 			<div class = "row">
	 				<h4 class = "sec_h4">예약자 정보</h4>
		 			<table class = "table" style = "border-bottom: 1px solid #dee2e6;">
						<tr>
							<th>예약자명</th>
							<td id = "memName">${mvo.mem_nickname }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td id = "memEmail">${mvo.mem_email }</td>
						</tr>
					</table>
				</div>
	 		</div>
	 	</div>
	</div>
</section>