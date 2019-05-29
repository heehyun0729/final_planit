var routelist = [];
Route = function(city, country, lat, lng, stay, date_in, date_out) {
	this.city = city;
	this.country = country;
	this.lat = lat;
	this.lng = lng;
	this.stay = stay;
	this.date_in=date_in;
	this.date_out=date_out;
}
var key = 'AIzaSyBJZmVpy1Zt3vbL5tusNVtcsJQnGjMLOQo';
function initMap() {
	// 지도 초기화
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 46.519, lng: 6.632},
      zoom: 5,
      mapTypeId: 'roadmap',
      scrollwheel : true,
      zoomControl: true,
      mapTypeControl: false,
      scaleControl: false,
      streetViewControl: false,
      rotateControl: false,
      fullscreenControl: false
    });
    
    // 자동완성검색
    var options = { types: ['(cities)'] };	// 장소 검색 범위를 도시로 제한
    var addrBox = document.getElementById('addrBox');
    var input = document.getElementById('address');
    $(input).click(function() {
		input.value = "";
	});
    var autocomplete = new google.maps.places.Autocomplete(input, options);
    autocomplete.bindTo('bounds', map);
    autocomplete.setFields(
            ['address_components', 'geometry', 'name', 'place_id']);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(addrBox);
  
    var geocoder = new google.maps.Geocoder();
    
    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker();
    
    // 자동완성검색 선택했을 때 실행할 리스너 ==> 마커 찍고 인포윈도우 띄우기
    autocomplete.addListener('place_changed', function() {
		var place = autocomplete.getPlace();	// 장소(도시) 정보 가져오기
		
		// api에서 도시 정보 가져오기
		$.getJSON('/planit/googleMap', {
			placeid: place.place_id,
			fields: 'address_components,geometry,photos,place_id',
			key: key
		}, function(data) {
			var city = "";
			var country = "";
			var result = data.result;
			var address = result.address_components;
		    var cityInfo = [];	// 0: 도시명, 1: 국가명, 2: [lat, lng], 3: lng
			for(var i = 0 ; i < address.length ; i++){
				if(address[i].types[0] == 'locality'){
					city = address[i].short_name;
				}
				if(address[i].types[0] == 'country'){
					country = address[i].long_name;
				}
			}
			var lat = result.geometry.location.lat;
			var lng = result.geometry.location.lng;
			var photoreference = result.photos[0].photo_reference;
			// 장소 위치(위도, 경도)로 도시 정보 받아오기 ==> 마커, 인포윈도우 표시
		    geocoder.geocode({'location': place.geometry.location}, function(results, status) {
		      if (status === 'OK') {
	    		// 기존 마커, 인포윈도우 삭제
	    		infowindow.close();
	    	    marker.setMap(null);
		        map.setCenter(place.geometry.location);
		        // 마커 만들기
		        marker = new google.maps.Marker({
		          map: map,
		          title: place.name,
		          position: place.geometry.location
		        });
		        // 마커 위치에 인포윈도우 만들고 도시명, 국가명 띄우기
		        var params = "\"" + city + "\",\"" + country + "\",\"" + lat + "\",\"" + lng + "\"";
		        var content = "<div>" +
		        		"<img style = 'float:left;margin-right:5px;' src = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=75&maxheight=75&photoreference="+ photoreference + "&key=" + key + "'>" + 
		        		"<div style='display:inline-block'><h3>" + city + "</h3><p>" + country + "</p></div>" +
		        		"<a href = 'javascript:addCity(" + params + ")'><span style='color:Tomato;margin:5px;'><i class='fas fa-plus-square fa-3x'></i></span></a>"
		        		"</div>";
		        infowindow = new google.maps.InfoWindow({
		       	 content: content
		        });
		        infowindow.open(map, marker);
		        marker.addListener('click', function(e) {
			        infowindow.open(map, marker);
		        });
		      } else {
		        alert('해당 도시 정보를 찾을 수 없습니다.');
		      }
		    });
		});
    });
  }
// routelist에 도시 정보 추가, 왼쪽 div에 정보 추가하는 함수
function addCity(city, country, lat, lng) {
	// 머무르는 날짜 구하기
	var date_in, date_out;
	if(routelist.length == 0){
		date_in = new Date($("#startDate").val());
		date_out = new Date(date_in.getFullYear(),date_in.getMonth(), date_in.getDate() + eval(1));
	}else{
		var startdate = new Date($("#startDate").val());
		
		var term  = 0;
		for (var i = 0 ; i < routelist.length ; i++){
			term = term + eval(routelist[i].stay);
		}

		date_in = new Date(startdate.getFullYear(), startdate.getMonth(), startdate.getDate() + eval(term));
		date_out = new Date(date_in.getFullYear(), date_in.getMonth(), date_in.getDate() + eval(1));
	}
	// routelist 배열에 Route 객체 추가
	routelist[routelist.length] = new Route(city, country, lat, lng, 1, date_in, date_out);
	setRouteDiv();
}
// 왼쪽 div에 정보 추가
function setRouteDiv() {
	var str = "";
	for(var i = 0 ; i < routelist.length ; i++){
		str += "<div style = 'padding: 5px;margin-bottom:10px;border-top:1px solid #aaa;border-bottom:1px solid #aaa;'>" +
					"<div style = 'height:50px;display:inline-block;float:left;'>" +
						"<select id = 'stay' style = 'margin-top:15px;margin-right:5px;'>" +
							"<option value = '0'>0박</option>" +
							"<option value = '1' selected = 'selected'>1박</option>" +
							"<option value = '2'>2박</option>" +
							"<option value = '1'>1박</option>" +
							"<option value = '1'>1박</option>" +
							"<option value = '1'>1박</option>" +
							"<option value = '1'>1박</option>" +
							"<option value = '1'>1박</option>" +
							"<option value = '1'>1박</option>" +
							"<option value = '1'>1박</option>" +
						"</select>" +
					"</div>" +
					"<div>" +
						"<span style = 'font-size:20px;font-weight:bold;'>" + routelist[i].city + "</span><span> " + routelist[i].country + "</span>" +
						"<p style = 'font-size:12px;color:gray;margin-top: 5px;'>" + formatDate(routelist[i].date_in) + "~" + formatDate(routelist[i].date_out) + "</p>" +
					"</div>" +
				"</div>";
		$('#route').html(str);
	}
}
// Date 객체를 format해서 리턴하는 함수
function formatDate(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var week = ["일", "월", "화", "수", "목", "금", "토"];
	var day = week[date.getDay()];
	return y + "-" + m + "-" + d + "(" + day + ")";
}
// routelist date_in, date_out 수정
function setRouteDate(date) {
	var startdate = new Date(date);
	var date_in, date_out;
	for(var i = 0 ; i < routelist.length ; i++){
		if(routelist.length == 1){
			date_in = startdate;
			routelist[i].date_in = date_in;
			date_out = new Date(date_in.getFullYear(),date_in.getMonth(), date_in.getDate() + eval(routelist[i].stay));
			routelist[i].date_out = date_out;
			startdate = date_out;
		}else{
			date_in = startdate;
			routelist[i].date_in = date_in;
			date_out = new Date(date_in.getFullYear(), date_in.getMonth(), date_in.getDate() + eval(routelist[i].stay));
			routelist[i].date_out = date_out;
			startdate = date_out;
		}
	}
	setRouteDiv();
}
// datepicker 설정
$(function() {
	$("#startDate").datepicker({
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                        "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
		onSelect: function(date) {
			$(this).datepicker( "hide" );
			setRouteDate(date);
		}
	});
	$('#startDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
});