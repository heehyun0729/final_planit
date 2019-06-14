<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"	crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/resources/css/admin/admin.css'/>">
		<link rel="stylesheet" href="<c:url value='/resources/css/plan/fullcalendar.css'/>">
		<link rel="stylesheet" href="<c:url value='/resources/css/plan/jquery.qtip.css'/>">
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/admin/chartjs-plugin-labels.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/admin/plan.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/admin/reservation.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/plan/moment.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/plan/jquery.qtip.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/plan/fullcalendar.min.js'/>"></script>
		<script type="text/javascript" src = "<c:url value = '/resources/js/plan/locale-all.js'/>"></script>
		<title>PlanIt::관리자::</title>
	</head>
	<style>
		
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".table a").on("click", function(event){//모달 열기
				event.preventDefault();
				const src=$(event.target).parent().prop("href");
				$("#modalSrc").html('<iframe style="border: 0px; " src="' + src + '" width="100%" height="820px"></iframe>');
				$("#clickMe").click();
			});
			$('#exampleModal').on('hidden.bs.modal', function () {//모달 닫힐때 새로고침
				  window.location.reload();
			});
			var nowPage="";//사이드바 자동 열기
			if(${current=='approvedAdList' || current=='requestRefundAdList' || current=='allAdList' || current=='requestChangeAdImageList' || current=='adCalendar'}){
				nowPage="ad";
			}
			if(nowPage=="ad"){
				$("#ad").collapse('show');
			}
			var adBadge=0;//새로운 뱃지 요청 검사
			var approveAdBadge=0;
			var requestRefundAdBadge=0;
			$.getJSON("<c:url value='/adminAdBadges'/>", function(data) {
				if(data!=null){
					approveAdBadge=data["approveAdBadge"];
					requestRefundAdBadge=data["requestRefundAdBadge"];
					requestChangeAdImageBadge=data["requestChangeAdImageBadge"];
					adBadge=approveAdBadge+requestRefundAdBadge+requestChangeAdImageBadge;
					if(approveAdBadge!=0) $("#approveAdBadge").text(approveAdBadge);
					if(requestRefundAdBadge!=0) $("#requestRefundAdBadge").text(requestRefundAdBadge);
					if(requestChangeAdImageBadge!=0) $("#requestChangeAdImageBadge").text(requestChangeAdImageBadge);
					if(adBadge!=0) $("#adBadge").text(adBadge);
				}
			});
			var apiKey = "";

			$("#accom_addr").ready(function() {
				$.getJSON('/planit/accom/apiKey', function(data) {
					apiKey = data.apiKey;
					$("#accom_addr").PlacePicker({
						key:apiKey,
					    center: {lat: 46.519, lng: 6.632},
						success:function(data,address){
							$("#accom_addr").val(data.formatted_address);
						}
					});
				});
			});
			"use strict";
			var $placePicker = null,
			    $modal = null,
			    n=null,
			    btnClass="btn btn-secondary btn-sm",
			    placePickerMap = null,
			    marker = false,
			    service = null,
			    geocoder = null,
			    result = null;
			$.fn.PlacePicker = function (t) {
			    n = {
			        key : null,
			        title : null,
			        center: {lat: -34.397, lng: 150.644},
			        zoom: 18,
			        success: function () {}
			    };
			    var params = $.extend(n, t);
			    $placePicker = this;
			    $(this).hover(function(){
			        var left = $(this).offset().left+$(this).width() - 40;
			        var top = $(this).offset().top+5;
			        $(this).click(function(){
			            if($("body").find(".modal.placePicker").length==0){
			                $("body").append('<div class="modal fade in placePicker" role="dialog"><style>.pac-container{ z-index: 10000; }</style><div class="modal-dialog modal-lg" style="width: 90%;"><div class="modal-content"><div class="modal-header"><h4 class="modal-title">주소 찾기</h4><button type="button" class="close" data-dismiss="modal">×</button></div><div class="modal-body" style="padding: 0px;"><div class="row"><div class="col-md-12" style="padding: 10px;position: absolute;z-index: 1;background: #fff;width: 30%;margin-left: 20px;margin-top: 4px;box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)!important;"><div class="input-group input-group-sm" style="width: 100%;"> <input type="text" class="form-control pull-right autocomplete" placeholder="주소 검색" style="border: 1px solid #dddddd;" autocomplete="off"></div><div class="address_content" style="display: none"><div class="address" style="margin-top: 10px;display: block;padding: 9.5px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;max-height: 50vh;overflow-x: hidden;overflow-y: scroll;text-align: left;"></div><div class="row"><div class="col-md-6"><div class="btn btn-sm btn-default" style="width: 100%;margin-top: 10px;margin-bottom: 10px;" data-dismiss="modal"><i class="fa fa-close"></i> 취소</div></div><div class="col-md-6"><div class="btn btn-sm btn-success placePickerSubmit" style="width: 100%;margin-top: 10px;margin-bottom: 10px;"><i class="fa fa-check"></i> 선택</div></div></div></div></div><div class="col-md-12"><div id="placePickerMap" style="height:calc( 80vh );width:100%"></div></div></div></div></div></div></div>');
			            }
			            result = null;
			            $modal = $(".placePicker");
			            $modal.modal("show");
			            $(".placePicker").find(".address").html("");
			            $(".placePicker").find(".address_content").hide();
			            $(".placePicker").find(".autocomplete").val("");
			            placePickerMap = null
			            marker = false;
			            if (!(typeof google === 'object' && typeof google.maps === 'object')) {
			                $.getScript('https://maps.googleapis.com/maps/api/js?language=ko&key='+params.key+'&libraries=places', function() {
			                    initPlacePickerMap(params)
			                });
			            } else{
			                initPlacePickerMap(params)
			            }
			            if(params.title!=null){
			                $modal.find(".modal-title").html(params.title);
			            }
			            $(".placePickerSubmit").click(function(){
			                var place = $(".placePicker").find(".autocomplete");
			                params.success(convertAddress(),place);
			                $modal.modal("hide")
			            });
			            $modal.on('hidden.bs.modal', function () {
			                $("body").find(".modal.placePicker").remove();
			            })
			        });
			    },
			    function(){
			        $("body").find(".placePickerUIButton").remove();
			    });


			};
			function initPlacePickerMap(params) {
			    service = new google.maps.Geocoder;
			    geocoder= new google.maps.Geocoder;
			    setTimeout(function() {
			        var loc = new google.maps.LatLng(params.center.lat, params.center.lng);
			        placePickerMap = new google.maps.Map(document.getElementById('placePickerMap'), {
			            center: loc,
			            zoom: params.zoom
			        });
			        service = new google.maps.places.PlacesService(placePickerMap);
			        var autocomplete = new google.maps.places.Autocomplete(document.getElementsByClassName("autocomplete")[0]);
			        google.maps.event.addListener(autocomplete, 'place_changed', function() {

			            var place = autocomplete.getPlace();

			            if (typeof place.address_components !== 'undefined') {
			                placePickerMap.panTo(place.geometry.location)
			                if(marker === false){
			                    marker = new google.maps.Marker({
			                        position: place.geometry.location,
			                        map: placePickerMap,
			                        draggable: true
			                    });
			                    google.maps.event.addListener(marker, 'dragend', function(event){
			                        markerLocation();
			                    });
			                } else{
			                    marker.setPosition(place.geometry.location);
			                }
			                markerLocation();
			            }

			        });

			        google.maps.event.addListener(placePickerMap, 'click', function(event) {
			            var clickedLocation = event.latLng;
			            if(marker === false){
			                marker = new google.maps.Marker({
			                    position: clickedLocation,
			                    map: placePickerMap,
			                    draggable: true
			                });
			                google.maps.event.addListener(marker, 'dragend', function(event){
			                    markerLocation();
			                });
			            } else{
			                marker.setPosition(clickedLocation);
			            }
			            markerLocation();
			        });
			    }, 1000);
			}
			function markerLocation(){
			    var currentLocation = marker.getPosition();
			    geocoder.geocode({'location': currentLocation}, function(results, status) {
			        if (status === 'OK') {
			        if (results[0]) {
			            result = results[0];
			            var cont = "<h6 style='font-weight:600;font-size: 16px;padding-bottom: 10px;'>"+result.formatted_address+"</h6>";
			            $(".address").html(cont);
			            $(".address_content").show();
			            }
			        }
			    });
			}
			function convertAddress(){
			    var data=[];
			    data["country"]="";
			    data["administrative_area_level_2"]="";
			    data["postal_code"]="";
			    data["sublocality_level_1"]="";
			    data["sublocality_level_2"]="";
			    data["route"]="";
			    data["locality"]="";
			    data["formatted_address"] = result.formatted_address;
			    $(result.address_components).each(function(i,address){
			        $(address.types).each(function(j,type){
			            if(type=="country"){
			                data[type] = address.short_name;
			            }else{
			                data[type] = address.long_name;
			            }
			        });
			    });
			    return data;
			}

		});		
	</script>
	<body>
		<tiles:insertAttribute name = "adminNav"/>
		<div class="row" id="body-row">
			<tiles:insertAttribute name = "adminSideBar"/>
			<div class="col">
				<tiles:insertAttribute name = "adminBody"/>
			</div>
		</div>
	</body>
</html>