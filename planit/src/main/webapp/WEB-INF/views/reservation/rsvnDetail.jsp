<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1>숙소상세보기</h1>
	<div>
		<h2>${avo.accom_name }</h2>
		<p>${avo.accom_addr} <a href = "#">지도 보기</a></p>
	</div>
	<div id = "accomImage">
		<!-- <img src = "<c:url value='/resources/uploadAccom/${avo.accommImg_saveImg }'/>">
		-->
		<img src = "<c:url value='/resources/uploadAccom/hotel.jpg'/>">
	</div>
	<div id = "accomIntro">
		<h3>숙소설명</h3>
		<div>${avo.accom_comm }</div>
	</div>
	<div id = "roomList">
		<c:forEach var = "rvo" items = "${rlist }">
			<div class = "roomDiv">
				<div>
					<h4><a href = "#">${rvo.room_type }</a></h4>
				</div>
				<div class = "roomImg roomComp">
					<!-- <img src = "<c:url value='/resources/uploadRoom/${rvo.room_images[0].roomImg_saveImg}'/>">
					 -->
					<img src = "<c:url value='/resources/uploadRoom/room1.jpg'/>">
				</div>
				<div class = "roomComm roomComp">
					<p>${rvo.room_comm }</p>
				</div>
				<div class = "roomPrice roomComp">
					<p>1인 1박 가격</p>
					<h4>${rvo.room_price }원</h4>
				</div>
				<div class = "roomBtn roomComp">
					<input type = "button" value = "예약하기">
				</div>
			</div>
			<div style = "clear:both;"></div>
		</c:forEach>
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