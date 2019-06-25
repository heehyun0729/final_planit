<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script async defer type="text/javascript"
	src="//maps.googleapis.com/maps/api/js?key=${sessionScope.key }"></script>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax"
		style="background: url(../resources/images/room.jpg)"></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">숙소예약</h2>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<section class="contact_area section_gap">
	<div class="container">
		<div class="row d-flex">
			<div class="p-2">
				<h2 class="title title_color">${avo.accom_name }</h2>
			</div>
			<div class="p-2 ml-auto">
				<a
					href="<c:url value='/reservation/accomList?pageNum=${i }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>"
					class="genric-btn success-border circle">목록</a>
			</div>
		</div>
		<div class="row d-flex">
			<div class="p-2">
				<p>
					<i class="fas fa-map-marker-alt"></i> ${avo.accom_addr}
				</p>
			</div>
			<div class="p-2">
				<a
					href="javascript:showMap('${avo.accom_addr }','${avo.accom_name }')"
					class="genric-btn primary-border small radius">지도보기</a>
			</div>
			<!-- 지도 모달 -->
			<div id="accomMapModal" class="modal fade" role="dialog">
				<div class="modal-dialog" role="document" style="max-width: 100%;">
					<div class="modal-content">
						<div class="modal-header">${avo.accom_name }의위치</div>
						<div class="modal-body">
							<div id="accomMap" style="width: 600px; height: 500px;"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row d-flex" style='margin-bottom: 15px;'>
			<div class="star p-2">
				<c:choose>
             		<c:when test="${empty star || star == 0 }">
             			<i class="far fa-star"></i>
             			<i class="far fa-star"></i>
             			<i class="far fa-star"></i>
             			<i class="far fa-star"></i>
             			<i class="far fa-star"></i>
             		</c:when>
             		<c:otherwise>
             			<c:forEach begin = "0" end = "${star - 1 }">
               				<i class="fas fa-star"></i>
		               	</c:forEach>
		               	<c:forEach begin = "1" end = "${5 - star }">
		               		<i class="far fa-star"></i>
		               	</c:forEach>
             		</c:otherwise>
             	</c:choose>
			</div>
			<div class="p-2">
				<span style = "color:#52C5FD;font-size: 24px;font-weight: bold;">${star }</span><span>/10 
				(</span><span style = "color:#ff5252">${reviewCnt }</span><span>개의 후기)</span>
			</div>
		</div>
		<hr>
		<div class="row"
			style="height: 500px; margin-bottom: 30px; margin-top: 15px;">
			<div class="col-lg-4">
				<div style="overflow: auto;">
					<h4 class="sec_h4">숙소설명</h4>
					<p>${avo.accom_comm }</p>
				</div>
			</div>
			<div class="col-lg-8" style="overflow: hidden;">
				<div id="accomCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#accomCarousel" data-slide-to="0" class="active"></li>
						<c:set var="n" value="1" />
						<c:forEach var="img" items="${imgList }">
							<li data-target="#accomCarousel" data-slide-to="${n }"></li>
							<c:set var="n" value="${n + 1 }" />
						</c:forEach>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100"
								src="<c:url value='/resources/uploadAccom/${avo.accommImg_saveImg }'/>"
								style="height: 500px;">
						</div>
						<c:forEach var="img" items="${imgList }">
							<div class="carousel-item">
								<img class="d-block w-100"
									src="<c:url value='/resources/uploadRoom/${img }'/>"
									style="height: 500px;">
							</div>
						</c:forEach>
					</div>
					<a class="carousel-control-prev" href="#accomCarousel"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#accomCarousel"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<!--=================================-->
		<section style="margin: 60px 0;">
			<div class="container"
				style="border-radius: 5px; padding: 30px 20px 30px 20px; background-color: #eee;">
				<form method="post"
					action="<c:url value = '/reservation/accomDetail?accom_num=${avo.accom_num}'/>">
					<div class="row d-flex justify-content-around">
						<div class="p-2" style="padding-right: 0; padding-left: 30px;">
							<div class="form-inline">
								<span class="input-group has-feedback"> <input
									type="text" id="checkin" name="checkin" value="${checkin }"
									class="form-control single-input" placeholder="체크인"> <span
									class="form-control single-input form-control-feedback border-0"><i
										class="fas fa-calendar-day"></i></span>
								</span> <span>&nbsp;~&nbsp;</span> <span
									class="input-group has-feedback"> <input type="text"
									id="checkout" name="checkout" value="${checkout }"
									class="form-control single-input" placeholder="체크아웃"> <span
									class="form-control single-input form-control-feedback border-0"><i
										class="fas fa-calendar-day"></i></span>
								</span>
							</div>
						</div>
						<div class="p-2" style="padding-left: 0;">
							<div class="input-group">
								<div id="mc_embed_signup">
									<div class="input-group">
										<span class="input-group-btn">
											<button type="button" class="btn" onclick="decreaseCnt()">
												<span style="color: #52C5FD"><i class="fas fa-minus"></i></span>
											</button>
										</span> <input type="number" id="rsvnCnt" min="1" name="cnt"
											value="${cnt }" class="form-control single-input"
											style="width: 100px;"> <span
											class="btn sub-btn disabled">명</span> <span
											class="input-group-btn">
											<button type="button" class="btn" onclick="increaseCnt()"
												style="padding-left: 0;">
												<span style="color: #52C5FD"><i class="fas fa-plus"></i></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="p-2" style="padding-left: 0;">
							<input type="submit" class="genric-btn success-border circle"
								value="검색">
						</div>
					</div>
				</form>
			</div>
		</section>
		<!-- ======================================= -->
		<c:if test="${empty rlist }">
			<div class="row" style="margin-bottom: 60px;">
				<div class="col-lg-12 text-center">
					<h5>예약 가능한 방이 없습니다.</h5>
				</div>
			</div>
		</c:if>
		<c:forEach var="rvo" items="${rlist }">
			<div class="row" style="margin-bottom: 30px;">
				<div class="col-lg-12">
					<blockquote class="generic-blockquote" style="margin-bottom: 30px;">
						<div class="row" style="margin-bottom: 10px;">
							<div class="col-lg-12"
								onclick="javascript:openRoomDialog(${rvo.room_num})"
								style="cursor: pointer;">
								<span class="sec_h4">${rvo.room_type }</span><span> (${rvo.room_capa }인실)</span>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-8 d-flex"
								onclick="javascript:openRoomDialog(${rvo.room_num})"
								style="cursor: pointer; padding-left: 0px;">
								<div class="col-md-3 p-2" style="padding-left: 0px;">
									<img class="img-thumbnail"
										src="<c:url value='/resources/uploadRoom/${rvo.room_images[0].roomImg_saveImg}'/>"
										style="max-height: 150px; overflow: hidden;">
								</div>
								<div class="col-md-9 mt-sm-20 left-align-p p-2"
									style="overflow: auto;">
									<p>${rvo.room_comm }</p>
								</div>
							</div>
							<div class="col-lg-4 d-flex justify-content-end"
								style="padding-top: 30px;">
								<div class="col-md-7 p-2 text-center">
									<span>1박 가격</span>
									<h3 style="color: #52C5FD;">${rvo.room_price }원</h3>
								</div>
								<div class="col-md-5 p-2 text-right">
									<a class="button_hover theme_btn"
										onclick="javascript:openRsvnDialog(${rvo.room_num})"
										style="color: white; cursor: pointer; margin-top: 5px;">예약하기</a>
								</div>
							</div>
						</div>
					</blockquote>
				</div>
			</div>
		</c:forEach>
		<!-- 방 사진 모달 -->
		<div id="roomDialog" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal-title"></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="roomImages"></div>

					</div>
				</div>
			</div>
		</div>
		<!-- 예약 모달 -->
		<div id="rsvnDialog" class="modal fade" role="dialog">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">예약하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h4 class="sec_h4">${avo.accom_name }</h4>
							<p>
								<span style="font-size: 20px; color: #ff5252;" id="roomName"></span><span
									id="roomCapa"></span>
							</p>
						</div>
						<form method="post" action="<c:url value='/reservation/book'/>">
							<input type="hidden" id="hiddenCnt" value="${cnt }"> <input
								type="hidden" name="accom_num" value="${avo.accom_num }">
							<input type="hidden" id="room_num" name="room_num"> <input
								type="hidden" id="stay" name="stay">
							<h6>날짜</h6>
							<div class="form-inline d-flex" style="margin-bottom: 20px;">
								<input type="text" style="width: 120px;"
									id="rsvnCheckinDatepicker" name="checkin" value="${checkin }"
									class="form-control single-input p-2"> <span
									class="p-2">&nbsp;~&nbsp;</span> <input type="text"
									style="width: 120px;" id="rsvnCheckoutDatepicker"
									name="checkout" value="${checkout }"
									class="form-control single-input p-2">
							</div>
							<h6>인원</h6>
							<div class="row"
								style="margin-bottom: 20px; width: 150px; padding-left: 16px;">
								<select id="rsvnDialogCnt" name="cnt"
									class="form-control single-input nice-select"></select>
							</div>
							<div class="text-center"
								style="margin-bottom: 20px; padding-left: 16px;">
								<p id="rsvnMsg"></p>
								<div>
									<span>총</span> <span id="roomPrice"
										style="font-size: 20px; color: #ff5252;">0</span>원
								</div>
							</div>
							<div class="text-center">
								<input type="submit" id="btnPay"
									class="genric-btn primary circle" value="결제하기">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- =============탭============= -->
		<ul class="nav nav-tabs" id="accomTabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				id="accomReview-tab" data-toggle="tab" href="#accomReview"
				role="tab" aria-selected="true">후기</a></li>
			<li class="nav-item"><a class="nav-link" id="accomQna-tab"
				data-toggle="tab" href="#accomQna" role="tab" aria-selected="false">문의</a>
			</li>
		</ul>
		<div class="tab-content" id="accomTabContent" style="padding: 20px;">
			<div class="tab-pane fade show active" id="accomReview"
				role="tabpanel" aria-labelledby="home-tab">
				<a style="color: #339af0;" href="${pageContext.request.contextPath }/reservationReview/reservationReviewInsert?accom_num=${accom_num}">후기 글 등록</a>	
				 <c:forEach var="vo" items="${rrlist }">
					<div id="list">
					
						<div class="row d-flex" style='margin-bottom: 15px;'>
						<div class="star p-2">
						
			             		<c:choose>
			             			<c:when test="${vo.resReview_star==0}">
			             				<c:forEach begin = "1" end = "5">
					               		<i class="far fa-star"></i>
					               		
					               	</c:forEach>
			             			</c:when>
			             			<c:otherwise>
			             			<c:forEach begin = "0" end = "${vo.resReview_star - 1 }">
			             			<i class="fas fa-star"></i>
			               				
					               	</c:forEach>
					               	<c:forEach begin = "1" end = "${5 - vo.resReview_star }">
					               		<i class="far fa-star"></i>
					               		
					               	</c:forEach>
			             		</c:otherwise>
			             		</c:choose>
			             	
			             
						</div>
						<div class="p-2">
							<span style = "color:#52C5FD;font-size: 24px;font-weight: bold;">${vo.resReview_star }</span>

						</div>
					</div>
					
						<div class="mem_id">
							작성아이디:
							<p>${vo.mem_id }</p>
						</div>
						<div class="num">
							제목:
							<p>${vo.resReview_title }</p>
						</div>
						<div class="content">
							내용:
							<div>${vo.resReview_content }</div>
						</div>
						<div class="data">
							작성일:
							<p>${vo.resReview_data }</p>
						</div> 
						<a style="color: #FA58F4;"
							href="${pageContext.request.contextPath }/reservationReviewUpdate?resReview_num=${vo.resReview_num}&accom_num=${accom_num}">후기 글 수정</a> / 
						<a style="color: #FE2E64;"
							href="${pageContext.request.contextPath }/reservationReviewDelete?resReview_num=${vo.resReview_num}">후기 글 삭제</a>
						
						
					</div>
				</c:forEach> 
			</div>
			<div class="tab-pane fade" id="accomQna" role="tabpanel"
				aria-labelledby="profile-tab">
				<form method="post" action="<c:url value="/reservation/acqInsert"/>">
					<input type="hidden" name="tab" value="1">
					<div class="form">
						<input type="hidden" name="accom_num" value="${avo.accom_num }">
						<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
						<input type="text" name="accomqna_title" class="form-control"
							placeholder="제목입력"><br>
						<textarea rows="5" cols="40" name="accomqna_content"
							placeholder="내용을 입력하세요." class="form-control mb-10"></textarea>
						<br> <input type="submit" class="genric-btn danger small" value="확인">
					</div>
					<br>
				</form>
				<c:forEach var="vo" items="${list }">
					<div class="single-comment justify-content-between d-flex">
						<div class="user justify-content-between d-flex">
							<div class="thumb">
								<img src="<c:url value = '${vo.img_saveimg }'/>" class="avatar"
									style="margin-bottom: 5px; width: 50px; height: 50px;">
							</div>
							<div class="desc">
								<h5>
									<a href="<c:url value="/member/mypage/${sessionScope.mem_id}"/>">${vo.mem_id}</a>
								</h5>
								<p class="date">${vo.accomqna_date}<a href="${pageContext.request.contextPath }/accomqna/deleteAccomqna?accomqna_num=${vo.accomqna_num}">[삭제]</a></p>
								<p style="font-weight: bold">${vo.accomqna_title}</p>
								<p class="comment">${vo.accomqna_content }</p>
								
							</div>
						</div>
						<div class="reply-btn">
							<a href="" class="genric-btn success-border medium">reply</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</section>
