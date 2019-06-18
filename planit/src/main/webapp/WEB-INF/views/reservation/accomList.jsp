<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax"
		style="background: url(../resources/images/room.jpg)"
		data-stellar-ratio="0.8" data-stellar-vertical-offset="0"
		data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">숙소예약</h2>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<section style = "margin: 60px 0;">
	<div class="container" style = "border:1px solid #aaa;border-radius: 5px;padding:30px 20px 30px 20px;">
		<form method="post" action="<c:url value = '/reservation/accomList'/>">
			<div class="row">
				<div class="col-lg-3">
					<div class="input-group has-feedback">
						<input type="text" id="rsvnKeyword" name="keyword" value="${keyword }" class = "form-control single-input " placeholder="도시 혹은 숙소명">
						<span class="form-control single-input form-control-feedback border-0"><i class="fas fa-map-marker-alt"></i></span>
					</div>
				</div>
				<div class="col-lg-6" style = "padding-right: 0;padding-left: 30px;">
					<div class="form-inline">
						<span class="input-group has-feedback">
							<input type="text" id="checkin" name="checkin" value="${checkin }" class = "form-control single-input" placeholder="체크인">
							<span class="form-control single-input form-control-feedback border-0"><i class="fas fa-calendar-day"></i></span>
						</span>
						<span>&nbsp;~&nbsp;</span> 
						<span class="input-group has-feedback">
							<input type="text" id="checkout" name="checkout" value="${checkout }" class = "form-control single-input" placeholder="체크아웃">
							<span class="form-control single-input form-control-feedback border-0"><i class="fas fa-calendar-day"></i></span>
						</span>
					</div>
				</div>
				<div class="col-lg-2" style = "padding-left: 0;">
					<div class="input-group">
                        <div id="mc_embed_signup">
                           <div class="input-group d-flex flex-row">
		                        <span class="input-group-btn">
		                            <button type="button" class="btn" onclick="decreaseCnt()">
		                              <span style = "color: #52C5FD"><i class="fas fa-minus"></i></span>
		                            </button>
		                        </span>
                       			<input type="number" id="rsvnCnt" min="1" name="cnt" value="${cnt }" class="form-control single-input">
                               <span class="btn sub-btn disabled">명</span>
		                        <span class="input-group-btn">
		                            <button type="button" class="btn" onclick="increaseCnt()" style = "padding-right:0;">
		                                <span style = "color: #52C5FD"><i class="fas fa-plus"></i></span>
		                            </button>
		                        </span>
                           </div>	
                        </div>
                    </div>
				</div>
				<div class="col-lg-1" style = "padding-left: 0;">
					<input type="submit" class = "genric-btn success-border circle" value="검색">
				</div>
			</div>
		</form>
	</div>
</section>
<!-- ======================================= -->
<section class="accomodation_area" style = "margin-bottom: 60px;">
    <div class="container">
        <div class="row mb_30 text-center">
        	<c:if test="${empty list }">
				<div class="col-lg-12 col-md-12 mb-30"><h5>조회된 결과가 없습니다.</h5></div>
			</c:if>
			<c:forEach var="vo" items="${list }">
				<div class="col-lg-3 col-sm-6">
	                <div class="accomodation_item text-center">
	                    <div class="hotel_img">
							<a href="<c:url value='/reservation/accomDetail?accom_num=${vo.accom_num }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>"><img src="<c:url value='/resources/uploadAccom/${vo.accommImg_saveImg }'/>" style = "height: 270px;"></a>
						</div>
	                    <h4><a href="<c:url value='/reservation/accomDetail?accom_num=${vo.accom_num }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>">${vo.accom_name }</a></h4>
	                    <p><i class="fas fa-map-marker-alt"></i> ${vo.accom_city }, ${vo.accom_country }</p>
	                    <h5>${vo.room_price }원 ~</h5>
	                    <div class = "star">
	                    	<i class = "fa fa-star"></i>
	                    	<i class = "fa fa-star"></i>
	                    	<i class = "fa fa-star"></i>
	                    	<i class = "fa fa-star"></i>
	                    	<i class = "fa fa-star"></i>
	                    </div>
	                </div>
	            </div>
			</c:forEach>
        </div>
    </div>
</section>

<nav class="blog-pagination justify-content-center d-flex">
   <ul class="pagination">
      <li class="page-item">
         <c:if test="${startPage > 1 }">
			<a class="page-link" aria-label="이전" href = "<c:url value = '/reservation/accomList?pageNum=${startPage - 1 }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>">
				<span aria-hidden="true">
	            	<span class="lnr lnr-chevron-left"></span>
	            </span>
			</a>
		</c:if>
      </li>
      <c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
		<c:choose>
			<c:when test="${i == pageNum }">
				<li class="page-item active"><a class="page-link" href = "<c:url value = '/reservation/accomList?pageNum=${i }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>">${i }</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href = "<c:url value = '/reservation/accomList?pageNum=${i }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>">${i }</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
    <li class="page-item">
        <c:if test="${endPage < pageCnt }">
			<a class="page-link" aria-label="다음" href = "<c:url value = '/reservation/accomList?pageNum=${endPage + 1 }&keyword=${keyword }&checkin=${checkin}&checkout=${checkout }&cnt=${cnt }'/>">
				<span aria-hidden="true">
                   <span class="lnr lnr-chevron-right"></span>
                </span>
			</a>
		</c:if>
     </li>
   </ul>
</nav>
<!-- ============================================= -->