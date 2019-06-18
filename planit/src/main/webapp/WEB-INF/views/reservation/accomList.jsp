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
<section class="section_gap">
	<div class="container" style = "border:1px solid #aaa;border-radius: 5px;padding:30px 20px 30px 20px;">
		<form method="post" action="<c:url value = '/reservation/accomList'/>">
			<div class="row">
				<div class="col-lg-3">
					<input type="text" id="rsvnKeyword" name="keyword" value="${keyword }" class = "form-control single-input" placeholder="도시 혹은 숙소명">
				</div>
				<div class="col-lg-6" style = "padding-right: 0;padding-left: 30px;">
					<div class="form-inline">
						<input type="text" id="checkin" name="checkin" value="${checkin }" class = "form-control single-input" placeholder="체크인">
						<span>&nbsp;~&nbsp;</span> 
						<input type="text" id="checkout" name="checkout" value="${checkout }" class = "form-control single-input" placeholder="체크아웃">
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