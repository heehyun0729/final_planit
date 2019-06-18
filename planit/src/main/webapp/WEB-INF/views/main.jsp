<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="banner_area">
	<div class="booking_table d_flex align-items-center">
		<div class="overlay bg-parallax" data-stellar-ratio="0.9"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="banner_content text-center">
				<h6>Away from monotonous life</h6>
				<h2>Relax Your Mind</h2>
				<p>
					If you are looking at blank cassettes on the web, you may be very
					confused at the<br> difference in price. You may see some for
					as low as $.17 each.
				</p>
				<a href="#" class="btn theme_btn button_hover">Get Started</a>
			</div>
		</div>
	</div>
</section>

<!--================Banner Area =================-->

<!--================ Facilities Area  =================-->
<section class="facilities_area section_gap">
    <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background="">  
    </div>
    <div class="container">
        <div class="section_title text-center">
            <img src = "<c:url value='/resources/images/logo1.png'/>" style = "width: 250px;">
            <p style = "margin-top:20px;">플랜잇과 함께하면 여행이 더 즐거워집니다.</p>
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
            <div class="col-lg-3 col-sm-6">
                <div class="accomodation_item text-center">
                    <div class="hotel_img">
                         <a href="#"><img src="<c:url value='/resources/royal/image/room1.jpg'/>" alt=""></a>
                    </div>
                    <h4><a href="#" class="sec_h4">숙소이름</a></h4>
                    <h5>00000원 ~</h5>
                    <div class = "star">
                    	<i class = "fa fa-star"></i>
                    	<i class = "fa fa-star"></i>
                    	<i class = "fa fa-star"></i>
                    	<i class = "fa fa-star"></i>
                    	<i class = "fa fa-star"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================ Accomodation Area  =================-->
<div class = "container"> <hr></div>
<!--================ Latest Blog Area  =================-->
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