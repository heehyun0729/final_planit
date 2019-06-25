var rsvnDialog;
var num;
var addr, name;
var checkin, checkout, cnt;
$(function() {
		var from = $( "#rsvnCheckinDatepicker" ).datepicker({
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                        "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
        minDate: 0,
        numberOfMonths: 2,
		onSelect: function(date) {
			var d = new Date(date);
			$("#rsvnCheckoutDatepicker").datepicker("option", "minDate", new Date(d.getFullYear(),d.getMonth(), d.getDate() + eval(1)));
			checkin = $("#rsvnCheckinDatepicker").val();
			roomCheck();
			setRsvnMsg();
			setPayBtn();
		}
	});
	var to = $( "#rsvnCheckoutDatepicker" ).datepicker({
    	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                        "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
		numberOfMonths: 2,
		onSelect: function() {
			checkout = $("#rsvnCheckoutDatepicker").val();
			roomCheck();
			setRsvnMsg();
			setPayBtn();
		}
    });	

	$("#accomMapModal").on('shown.bs.modal', function() {
		var map = setMap();
		var geocoder = new google.maps.Geocoder();
		geocodeAddress(geocoder, map);
	});
	
	$("#rsvnDialogCnt").on('change', function() {
		cnt = $("#rsvnDialogCnt").val();
		roomCheck();
		setRsvnMsg();
		setPayBtn();
	});
});

function openRoomDialog(room_num) {
	num = room_num;	
	$.ajax({
		url: "/planit/reservation/roomDetail",
		dataType: "json",
		data: {room_num: num},
		success: function(data) {
			var images = data.room_images;
			var title = data.room_type + "(" + data.room_capa + "인실)";
			$("#modal-title").html(title);
			var str = "<div id='roomCarousel' class='carousel' data-ride='carousel'>" +
						"<ol class='carousel-indicators'>" +
							"<li data-target='#roomCarousel' data-slide-to='0' class='active'></li>";
			for(var i = 1 ; i < images.length ; i++){
				str += "<li data-target='#roomCarousel' data-slide-to='" + i+ "'></li>";
			}
			str += "</ol>" +
					"<div class='carousel-inner'>" +
						"<div class='carousel-item active'>" +
							"<img class=d-block w-100' src='/planit/resources/uploadRoom/" + images[0].roomImg_saveImg + "' style = 'height: 400px;'>" +
						"</div>";
			for(var i = 1 ; i < images.length ; i++){
				var img = images[i].roomImg_saveImg;
				str += "<div class='carousel-item'>" +
							"<img class=d-block w-100' src='/planit/resources/uploadRoom/" + img + "' style = 'height: 400px;'>" +
						"</div>";
			}
			str += "</div>" +
					"<a class='carousel-control-prev' href='#roomCarousel' role='button' data-slide='prev'>" +
						"<span class='carousel-control-prev-icon' aria-hidden='true'></span>" +
						"<span class='sr-only'>Previous</span>" +
					"</a>" +
					"<a class='carousel-control-next' href='#roomCarousel' role='button' data-slide='next'>" +
						"<span class='carousel-control-next-icon' aria-hidden='true'></span>" +
						"<span class='sr-only'>Next</span>" +
					"</a>" +
					"</div>";
			$("#roomImages").empty();
			$("#roomImages").append(str);
		}
	});
	$("#roomDialog").modal( "show" ); 
}
   
function openRsvnDialog(room_num) {
	num = room_num;
	$("#room_num").val(num);
	checkin = $("#rsvnCheckinDatepicker").val();
	checkout = $("#rsvnCheckoutDatepicker").val();
	cnt = $("#hiddenCnt").val();
	$.ajax({
		url: "/planit/reservation/roomDetail",
		dataType: "json",
		data: {room_num: num},
		success: function(data) {
			$("#roomName").html(data.room_type);
			$("#roomCapa").html("(" + data.room_capa + "인실)");
			$("#rsvnDialogCnt").empty();
			var str = "";
			for(var i = 1 ; i <= data.room_capa ; i++){
				str += "<option value = '" + i + "' ";
				if(i == cnt){
					str += "selected = 'selected'";
				}
				str += ">" + i + "명</option>";
			}
			$("#rsvnDialogCnt").html(str);
			$('select').niceSelect('update');
			cnt = $("#rsvnDialogCnt").val();
			roomCheck();
			setRsvnMsg();
			setPayBtn();
		}
	});
	$("#rsvnDialog").modal( "show" ); 
}

function setRsvnDialog(price) {
	var stay = getStay();
	if(cnt == -1 || stay == -1){
		$("#roomPrice").html("0");
	}else{
		$("#roomPrice").html(stay * price);
	}
}

function setRsvnMsg() {
	if(checkin == null || checkin == ""
		|| checkout == null || checkout == ""){
		$("#rsvnMsg").html("날짜를 선택해주세요.");
	}else if(cnt == -1){
		$("#rsvnMsg").html("예약이 불가능한 날짜입니다.");
	}else{
		var stay = getStay();
		$("#rsvnMsg").html(cnt + "명 " + stay + "박 가격");
	}
}

function getStay() {
	var ci = new Date(checkin).getTime();
	var co = new Date(checkout).getTime();
	var stay = (co - ci) / (1000 * 60 * 60 * 24);
	if(checkin == null || checkout == null
			|| checkin == "" || checkout == ""){
		stay = -1;
	}
	$("#stay").val(stay);
	return stay;
}

function setPayBtn() {
	var btn = $("#btnPay");
	if(checkin == null || checkin == ""
		|| checkout == null || checkout == ""){
		btn.val("날짜를 선택해주세요.");
		btn.attr("class", "genric-btn disable");
		btn.attr("type", "button");
		btn.disabled = true;
	}else if(cnt == -1){
		btn.val("예약이 불가능한 날짜입니다.");
		btn.attr("class", "genric-btn disable");
		btn.attr("type", "button");
		btn.disabled = true;
	}else{
		btn.val("결제하기")
		btn.attr("class", "genric-btn primary circle");
		btn.attr("type", "submit");
		btn.disabled = false;
	}
}

function roomCheck() {
	checkin = $("#rsvnCheckinDatepicker").val();
	checkout = $("#rsvnCheckoutDatepicker").val();
	cnt = $("#rsvnDialogCnt").val();
	if(checkin != null && checkin != ""
		&& checkout != null && checkout != ""){
		$.ajax({
			url: "/planit/reservation/roomCheck",
			dataType: "json",
			data: { 
				room_num: num,
				checkin: checkin,
				checkout: checkout,
				cnt: cnt
			},
			success: function(data) {
				if(data.room_num == -1){	// 방 예약이 이미 차있는 경우
					cnt = -1;
					setRsvnDialog(0);
					setRsvnMsg();
					setPayBtn();
				}else{
					setRsvnDialog(data.room_price);	// 예약 가능한 경우
					setRsvnMsg();
					setPayBtn();
				}
			}
		});
	}
}
function setMap() {
	var map = new google.maps.Map(document.getElementById("accomMap"), {
		center: {lat: 46.519, lng: 6.632},
		zoom: 15,
		mapTypeId: 'roadmap',
	    scrollwheel : true,
	    mapTypeControl: false,
	    streetViewControl: false
	}); 
	return map;
}
function showMap(address, accom_name) {
	addr = address;
	name = accom_name
	$('#accomMapModal').modal( "show" );
}
function geocodeAddress(geocoder, resultsMap) {
	geocoder.geocode({'address': addr}, function(results, status) {
	  if (status === 'OK') {
	   resultsMap.setCenter(results[0].geometry.location);
	    var marker = new google.maps.Marker({
	      map: resultsMap,
	      position: results[0].geometry.location
	    });
	    var content = "<div><h5>" + name + "</h5><span>" + addr + "</span></div>";
	    var infowindow = new google.maps.InfoWindow({
       	 content: content
        });
        infowindow.open(map, marker);
        marker.addListener('click', function(e) {
	        infowindow.open(map, marker);
        });
	  }
	});
}