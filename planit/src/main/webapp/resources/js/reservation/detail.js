var rsvnDialog;
var num;
var addr, name;

$(function() {
	$("#accomTabs").tabs({
		collapsible: true
	});
	
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
		}
	});
	var to = $( "#rsvnCheckoutDatepicker" ).datepicker({
    	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                        "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
		numberOfMonths: 2
    });	

	$("#accomMapModal").on('shown.bs.modal', function() {
		var map = setMap();
		var geocoder = new google.maps.Geocoder();
		geocodeAddress(geocoder, map);
	});
});

function openRsvnDialog(room_num) {
	num = room_num;
	var checkin = $("#rsvnCheckinDatepicker").val();
	var checkout = $("#rsvnCheckoutDatepicker").val();
	var cnt = $("#hiddenCnt").val();
	
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
				$("#rsvnDialogCnt").html(str);
			}
			setDialog(checkin, checkout, cnt, data.room_price);
		}
	});
	$("#rsvnDialog").modal( "show" ); 
}

function setDialog(checkin, checkout, cnt, price) {
	var stay = setRsvnMsg(checkin, checkout, cnt);
	setPayBtn(checkin, checkout, cnt);
	if(cnt == -1){
		$("#roomPrice").html("0원");
	}else{
		$("#roomPrice").html((stay * price) + "원");
	}
}

function setRsvnMsg(checkin, checkout, cnt) {
	var stay = "";	
	if(checkin == null || checkin == ""
		|| checkout == null || checkout == ""){
		$("#rsvnMsg").html("날짜를 선택해주세요.");
	}else if(cnt == -1){
		$("#rsvnMsg").html("예약이 불가능한 날짜입니다.");
	}else{
		var ci = new Date(checkin).getTime();
		var co = new Date(checkout).getTime();
		stay = (co - ci) / (1000 * 60 * 60 * 24);
		$("#rsvnMsg").html(cnt + "명 " + stay + "박 가격");
	}
	return stay;
}

function setPayBtn(checkin, checkout, cnt) {
	var btn = $("#btnPay");
	if(checkin == null || checkin == ""
		|| checkout == null || checkout == ""){
		btn.val("날짜를 선택해주세요.");
		btn.prop("disabled", true);
	}else if(cnt == -1){
		btn.val("예약이 불가능한 날짜입니다.");
		btn.prop("disabled", true);
	}else{
		btn.val("결제하기")
		btn.prop("disabled", false);
	}
}

function roomCheck() {
	var checkin = $("#rsvnCheckinDatepicker").val();
	var checkout = $("#rsvnCheckoutDatepicker").val();
	var cnt = $("#rsvnDialogCnt option:selected").val();
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
				if(data != null){
					setDialog(checkin, checkout, cnt, data.room_price);
				}else{
					setDialog(checkin, checkout, -1);
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

function rsvnPay() { 
	console.log(111); 
}