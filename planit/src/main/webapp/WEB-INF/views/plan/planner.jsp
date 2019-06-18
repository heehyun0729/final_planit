<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script async defer type="text/javascript"
	src="//maps.googleapis.com/maps/api/js?key=${sessionScope.key }&callback=initMap&libraries=places"></script>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style = "background: url(../resources/images/map.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">계획짜기</h2>
        </div>
    </div>
</section>
<!--================Breadcrumb Area =================-->
<input type = "hidden" value = "${param.plan_num }" id = "plan_num">
<section class="contact_area section_gap">
    <div class="container">
        <div class="row" style = "height: 600px;">
        	<div class = "col-md-4" style = "padding: 0;">
        		<div id="leftBox" style = "height: 600px;width:100%;border: 1px solid #aaa;padding:10px;overflow: auto;">
					<div class="form-inline">
						출국&nbsp;<input type='text' id="startDate" class="form-control"/>
					</div>
					<div id="route"></div>
				</div>
        	</div>
        	<div class = "col-md-8">
        		<div id="map" style = "height: 100%;width:100%;"></div>
					<div class="addrBox" id = "addrBox" style = "margin: 10px 0 0 10px;">
						<input type="text" id="address" class = "form-control single-input">
					</div>
					<div class="saveBox" id = "saveBox" style = "margin: 10px 10px 0 0;">
						<input type="button" value = "저장" id="btnSave" class = "btn theme_btn button_hover">
					</div>
        	</div>
    	</div>
    </div>
</section>