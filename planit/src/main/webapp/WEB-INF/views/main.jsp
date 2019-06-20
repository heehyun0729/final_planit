<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.advertise_table {
  position: relative;
  overflow: hidden;
  width: 100%;
  heigth: 100%;
  min-height: 600px;
}
.advertisement {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  height: 100%;
  bottom: 0;
}
</style>
<script>
	$(document).ready(function(){
		$('.carousel').carousel({
			pause: false,
			<c:if test="${fn:length(chanceList)!=0}">
				interval: ${chanceList.get(0)}		
			</c:if>
		});
	});	
</script>
<c:choose>
	<c:when test="${fn:length(imageList)>1}">
		<section class="banner_area">
			<div class="advertise_table d_flex align-items-center">
				<div class="container-fluid w-100 pl-0 pr-0 advertisement">
					<div class="row ml-0 mr-0 pl-0 pr-0 w-100 h-100">
						<div class="col ml-0 mr-0 pl-0 pr-0 w-100 h-100">
							<div id="carouselExampleIndicators" class="carousel slide ml-0 mr-0 pl-0 pr-0 w-100 h-100" data-ride="carousel">
								<ol class="carousel-indicators">
									<c:forEach var="i" items="${imageList }" varStatus="status">
										<c:choose>
											<c:when test="${status.first }">
												<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
											</c:when>
											<c:otherwise>
												<li data-target="#carouselExampleIndicators" data-slide-to="${status.index }"></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ol>
								<div class="carousel-inner ml-0 mr-0 pl-0 pr-0 w-100 h-100">
									<c:forEach var="vo" items="${imageList }" varStatus="status">
										<c:choose>
											<c:when test="${status.first }">
												<c:forEach var="i" items="${chanceList }" begin="0" end="0">
													<div class="carousel-item active " data-interval="${i }">
												</c:forEach>
														<a
															href="<c:url value='/adClick?adInfo_num=${vo.adInfo_num }'/>" target="_blank">
															<img src="<c:url value='/resources/adImage/${vo.adImg_saveImg }'/>" width="100%" height="600" class="" alt="광고 이미지">
														</a>
													</div>
											</c:when>
											<c:otherwise>
												<c:forEach var="i" items="${chanceList }" begin="${status.index }" end="${status.index }">
													<div class="carousel-item " data-interval="${i }">
												</c:forEach>
														<a href="<c:url value='/adClick?adInfo_num=${vo.adInfo_num }'/>" target="_blank">
														<img src="<c:url value='/resources/adImage/${vo.adImg_saveImg }'/>" width="100%" height="600" class="" alt="광고 이미지">
														</a>
													</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleIndicators"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
									role="button" data-slide="next"> <span
									class="carousel-control-next-icon" aria-hidden="true"></span> <span
									class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:when>
	<c:when test="${fn:length(imageList)==1}">
		<section class="banner_area">
			<div class="advertise_table d_flex align-items-center">
				<div class="container-fluid w-100 pl-0 pr-0 advertisement">
					<div class="row ml-0 mr-0 pl-0 pr-0 w-100 h-100">
						<div class="col ml-0 mr-0 pl-0 pr-0 w-100 h-100">
							<div id="carouselExampleIndicators" class="carousel slide ml-0 mr-0 pl-0 pr-0 w-100 h-100" data-ride="carousel">
								<div class="carousel-inner ml-0 mr-0 pl-0 pr-0 w-100 h-100">
									<div class="carousel-item active " data-interval="">
										<a
											href="<c:url value='/adClick?adInfo_num=${imageList.get(0).adInfo_num }'/>" target="_blank">
											<img src="<c:url value='/resources/adImage/${imageList.get(0).adImg_saveImg }'/>" width="100%" height="600" class="" alt="광고 이미지">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:when>
	<c:otherwise>
		<section class="banner_area">
			<div class="booking_table d_flex align-items-center">
				<div class="overlay bg-parallax" data-stellar-ratio="0.9"
					data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h6>여행지와 숙소를 소개하는 확실한 방법</h6>
						<h2><img src = "<c:url value = '/resources/images/logo3.png'/>" style = "width:250px;margin-bottom: 10px;margin-left: 15px;">에 광고를 신청해 보세요</h2>
						<p>광고를 위한 통계, 광고에 대한 상세 정보가 함께 제공됩니다.<br>광고 게재에는 최대 하루가 소요될 수 있습니다.</p>
						<a href="<c:url value='/adminAdRequestInfo'/>" class="btn theme_btn button_hover">광고 신청하기</a>
					</div>
				</div>
			</div>
		</section>
	</c:otherwise>
</c:choose>
<!--================Banner Area =================-->

<!--================ Facilities Area  =================-->
<section class="facilities_area section_gap">
    <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background="">  
    </div>
    <div class="container">
        <div class="section_title text-center">
            <h2 class="title_color"><img src = "<c:url value = '/resources/images/logo1.png'/>" style = "width:250px;margin-bottom: 20px;"></h2>
            <p>플랜잇과 함께하면 여행이 더 즐거워집니다.</p>
        </div>
        <div class="row mb_30 text-center">
            <div class="col-lg-3">
            	<div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-map"></i>계획짜기</h4>
                    <p>여행 루트를 미리 짜고<br>여행을 떠나보세요!</p>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-users"></i>동행찾기</h4>
                    <p>여행의 추억을 공유할<br>동행을 찾아보세요!</p>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-home"></i>숙소예약</h4>
                    <p>전세계 숙소를<br>최저가로 만나보세요!</p>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-bubble"></i>커뮤니티</h4>
                    <p>다른 여행자들과<br>이야기를 나눠보세요!</p>
                </div>
            </div>
        </div>
    </div>
</section>
<div class = "container"> <hr></div>
<!--================ Facilities Area  =================-->

<!--================ Accomodation Area  =================-->
<section class="accomodation_area section_gap">
    <div class="container">
        <div class="section_title text-center">
            <h2 class="title_color">전세계 인기 숙소</h2>
        </div>
        <div class="row mb_30 text-center">
        	<c:forEach var="avo" items="${alist }">
			<div class="col-lg-3 col-sm-6">
                <div class="accomodation_item text-center">
                    <div class="hotel_img">
						<a href="<c:url value='/reservation/accomDetail?accom_num=${avo.accom_num }'/>"><img src="<c:url value='/resources/uploadAccom/${avo.accommImg_saveImg }'/>" style = "height: 270px;"></a>
					</div>
                    <h4><a class = "sec_h4" href="<c:url value='/reservation/accomDetail?accom_num=${vo.accom_num }'/>">${avo.accom_name }</a></h4>
                    <p><i class="fas fa-map-marker-alt"></i> ${avo.accom_city }, ${avo.accom_country }</p>
                    <h5>${avo.room_price }원 ~</h5>
                    <div class = "star" style = "">
                    	<c:choose>
                    		<c:when test="${empty avo.star || avo.star == 0 }">
                    			<i class="far fa-star"></i>
                    			<i class="far fa-star"></i>
                    			<i class="far fa-star"></i>
                    			<i class="far fa-star"></i>
                    			<i class="far fa-star"></i>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach begin = "0" end = "${avo.star - 1 }">
		                    		<i class="fas fa-star"></i>
		                    	</c:forEach>
		                    	<c:forEach begin = "1" end = "${5 - avo.star }">
		                    		<i class="far fa-star"></i>
		                    	</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    	<span style = "color: #777;">&nbsp;(${avo.reviewCnt })</span>
                    </div>
                </div>
            </div>
			<c:set var = "n" value = "${n + 1 }"/>
		</c:forEach>
        </div>
    </div>
</section>
 <div class = "container" style = "margin-bottom: 90px;"></div>
 
<!--================ Accomodation Area  =================-->
<!-- <div class = "container"> <hr></div>
 <section class="latest_blog_area section_gap">
    <div class="container">
        <div class="section_title text-center">
            <h2 class="title_color">추천 많은 여행 후기</h2>
        </div>
        <div class="row mb_30 text-center">
            <div class="col-lg-4 col-md-6">
                <div class="single-recent-blog-post">
                    <div class="thumb">
                        <img class="img-fluid" src= "<c:url value='/resources/royal/image/blog/blog-1.jpg'/>" alt="post">
                    </div>
                    <div class="details">
                        <h4><a href="#" class="sec_h4">후기제목</a></h4>
                        <p>글쓴이</p>
                        <h6 class="date title_color">31st January,2018</h6>
                    </div>	
                </div>
            </div>
        </div>
    </div>
</section>
 -->