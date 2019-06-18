<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			interval: 3000
		});
		console.log(${fn:length(imageList)});
		console.log(${imageList[0]});
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
						<h2>PlantIt에 광고를 신청해 보세요</h2>
						<p>광고를 위한 통계, 광고에 대한 상세 정보가 함께 제공됩니다.<br>광고 게재에는 최대 하루가 소요될 수 있습니다.</p>
						<a href="<c:url value='/adminAdRequestInfo'/>" class="btn theme_btn button_hover">광고 신청하기</a>
					</div>
				</div>
			</div>
		</section>
	</c:otherwise>
</c:choose>