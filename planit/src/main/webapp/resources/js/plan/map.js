var key = "";

var routelist = [];
var markers = [];
var lines = [];
var arrow, line;
var map;
var stays = 1;	// 총 여행 날짜

$(function() {
	// key 설정
	$.getJSON('/planit/apiKey', function(data) {
		key = data.key;
	});
	// datepicker 설정
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
	// 저장버튼
	$("#btnSave").on('click', function() {
		if(routelist.length == 0){
			alert("도시를 하나 이상 추가한 뒤에 일정을 만들 수 있습니다.");
		}else{
			// 여행 시작 날짜 구하기
			var startDate = $("#startDate").val();
			// 총 여행 날짜 구하기
			for(var i = 0 ; i < routelist.length ; i++){
				stays += Number(routelist[i].stay);
			}
			// 정적 지도 이미지 주소 생성
			var img = 'https://maps.googleapis.com/maps/api/staticmap?size=400x400&mobile=true&visible=39,17&path=color:0x|weight:1|'
				for(var i = 0 ; i < routelist.length ; i++){
					img += routelist[i].lat + "," + routelist[i].lng;
					if(i < routelist.length - 1){
						img += "|";
					}
				}
				for(var i = 0 ; i < routelist.length ; i++){
					img += "&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg_v13%2Fmarker%2Fmycity_night" + routelist[i].stay + "%2Epng|" + routelist[i].lat + "," + routelist[i].lng;
				}
				img += "&key=" + key;
				img += "&format=png&maptype=roadmap&style=feature:administrative%7Celement:geometry%7Cvisibility:off&style=feature:administrative%7Celement:labels.icon%7Ccolor:0xc5c5c5&style=feature:administrative%7Celement:labels.text.stroke%7Cvisibility:off&style=feature:administrative.country%7Celement:labels.text.fill%7Ccolor:0xacacac&style=feature:administrative.land_parcel%7Cvisibility:off&style=feature:administrative.locality%7Cvisibility:off&style=feature:administrative.locality%7Celement:labels.text.fill%7Ccolor:0xbcbcbc&style=feature:administrative.neighborhood%7Cvisibility:off&style=feature:landscape%7Ccolor:0xffffff&style=feature:landscape.man_made%7Celement:geometry.fill%7Cvisibility:off&style=feature:landscape.man_made%7Celement:geometry.stroke%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:poi%7Celement:labels.text%7Cvisibility:off&style=feature:road%7Cvisibility:off&style=feature:road%7Celement:labels%7Cvisibility:off&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:transit%7Cvisibility:off&style=feature:water%7Celement:geometry.fill%7Ccolor:0xcfedf8&style=feature:water%7Celement:labels.text%7Cvisibility:off";
			$.ajax({
				url: '/planit/plan/insert',
				dataType: 'json',
				method: 'post',
				traditional:true,
				data: {
					routelist:JSON.stringify(routelist),
					startDate: startDate,
					stays:stays,
					img:img
				},
				success: function(data) {
					var result = data.result;
					if(result == 'success'){
						location.href = '/planit/plan/list';
					}else{
						alert('오류로 인해 저장을 실패하였습니다.');
					}
				}
			});
		}
	});
});


function initMap() {
	// 지도 스타일
	var styledMapType = new google.maps.StyledMapType([
  	  {
  	    "featureType": "administrative",
  	    "elementType": "geometry",
  	    "stylers": [{ "visibility": "off"}]
  	  },
  	  {
  	    "featureType": "administrative",
  	    "elementType": "labels.icon",
  	    "stylers": [{ "color": "#c5c5c5"}]
  	  },
  	  {
  	    "featureType": "administrative",
  	    "elementType": "labels.text.stroke",
  	    "stylers": [{"visibility": "off" }]
  	  },
  	  {
  	    "featureType": "administrative.country",
  	    "elementType": "labels.text.fill",
  	    "stylers": [{"color": "#acacac"}]
  	  },
  	  {
  	    "featureType": "administrative.locality",
  	    "elementType": "labels.text.fill",
  	    "stylers": [{"color": "#bcbcbc"}]
  	  },
  	  {
  	    "featureType": "landscape",
  	    "stylers": [{"color": "#ffffff"}]
  	  },
  	  {
  	    "featureType": "landscape.man_made",
  	    "elementType": "geometry.fill",
  	    "stylers": [{"visibility": "off"}]
  	  },
  	  {
  	    "featureType": "landscape.man_made",
  	    "elementType": "geometry.stroke",
  	    "stylers": [{"visibility": "off"}]
  	  },
  	  {
  	    "featureType": "poi",
  	    "stylers": [{"visibility": "off"}]
  	  },
  	  {
  	    "featureType": "poi",
  	    "elementType": "labels.text",
  	    "stylers": [{"visibility": "off"}]
  	  },
  	  {
  	    "featureType": "road",
  	    "stylers": [{"visibility": "off"}]
  	  },
  	  {
  	    "featureType": "road",
  	    "elementType": "labels",
  	    "stylers": [{"visibility": "off"}]
  	  },
  	  {
  	    "featureType": "road",
  	    "elementType": "labels.icon",
  	    "stylers": [{"visibility": "off"}]
  	  },
  	  {
  	    "featureType": "transit",
  	    "stylers": [{"visibility": "off"}]
  	  },
  	  {
  	    "featureType": "water",
  	    "elementType": "geometry.fill",
  	    "stylers": [{"color": "#cfedf8"}]
  	  },
  	  {
  	    "featureType": "water",
  	    "elementType": "labels.text",
  	    "stylers": [{"visibility": "off"} ]
  	  }
  	]);
	// 지도 초기화
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 46.519, lng: 6.632},
      zoom: 5,
      mapTypeId: 'roadmap',
      scrollwheel : true,
      zoomControl: true,
      mapTypeControl: false,
      scaleControl: false,
      streetViewControl: false,
      rotateControl: false,
      fullscreenControl: false,
    });
    map.mapTypes.set('styled_map', styledMapType);
    map.setMapTypeId('styled_map');
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
    // 저장버튼
    var btnSave = document.getElementById("saveBox");
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(saveBox);
    
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
			if(result.photos != null){
				var photoreference = result.photos[0].photo_reference;
			}
			// 장소 위치(위도, 경도)로 도시 정보 받아오기 ==> 마커, 인포윈도우 표시
		    geocoder.geocode({'location': place.geometry.location}, function(results, status) {
		      if (status === 'OK') {
	    		// 기존 마커, 인포윈도우 삭제
	    		infowindow.close();
	    	    marker.setMap(null);
		        map.setCenter(place.geometry.location);
		        // 마커 만들기
		        var icon = "/planit/resources/planImages/marker.png";
		        var image = {
        		  url: icon,
        		  size: new google.maps.Size(71, 71),
        		  origin: new google.maps.Point(0, 0),
        		  anchor: new google.maps.Point(17, 34),
        		  scaledSize: new google.maps.Size(25, 25)
        		};
		        marker = new google.maps.Marker({
		          map: map,
		          title: place.name,
		          position: place.geometry.location,
		          icon: image
		        });
		        // 마커 위치에 인포윈도우 만들고 도시명, 국가명 띄우기
		        var params = "\"" + city + "\",\"" + country + "\",\"" + lat + "\",\"" + lng + "\"";
		        var content = "<div>" +
		        		"<img style = 'float:left;margin-right:5px;' src = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=75&maxheight=75&photoreference="+ photoreference + "&key=" + key + "'>" + 
		        		"<div style='display:inline-block'><h3>" + city + "</h3><p>" + country + "</p></div>" +
		        		"<a href = 'javascript:addCity(" + params + ")'><span style='color:skyblue;margin:5px;'><i class='fas fa-plus-square fa-3x'></i></span></a>"
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
// 지도에 마커, 경로 추가하는 함수
function setMapRoute() {
	clearMarkers();
	clearLines();
    // 경로 화살표 모양 설정
    arrow = {
	  path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
	};
    // 경로 position 배열
	var lineCoordinates = [];
	for(var i = 0 ; i < routelist.length ; i++){
		lineCoordinates.push(new google.maps.LatLng({lat: Number(routelist[i].lat), lng: Number(routelist[i].lng)}));
	}
    // 마커 모양 설정
	var icon = "/planit/resources/planImages/circle.png";
    var image = {
	  url: icon,
	  origin: new google.maps.Point(0, 0),
	  anchor: new google.maps.Point(17, 34),
	  scaledSize: new google.maps.Size(25, 25)
	};
	for(var i = 0 ; i < routelist.length ; i++){
		// 선 그리기
		var line = new google.maps.Polyline({
			path: lineCoordinates,
			icons: [{
				icon: arrow,
				offset: '100%'
			 }],
			strokeColor: '#878787',
			strokeOpacity: 0.9,
			strokeWeight: 2
		});
		line.setMap(map);
		lines.push(line);
		// 마커 그리기
		markers.push(new google.maps.Marker({
			map: map,
			icon: image,
			title: routelist[i].city,
			position: {lat: Number(routelist[i].lat), lng: Number(routelist[i].lng)},
			label: routelist[i].stay.toString()
		}));
	}
}
// 마커 삭제 함수
function clearMarkers() {
	for(var i = 0 ; i < markers.length ; i++){
		markers[i].setMap(null);
	}
	markers = [];
}
function clearLines() {
	for(var i = 0 ; i < lines.length ; i++){
		lines[i].setMap(null);
	}
	lines = [];
}
// 경로 삭제 함수
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
	var route = new Object();
	route.city = city;
	route.country = country;
	route.lat = lat;
	route.lng = lng;
	route.stay = 1;
	route.date_in = formatDate(date_in);
	route.date_out = formatDate(date_out);
	routelist.push(route);
	console.log(routelist);
	setRouteDiv();
	setMapRoute();
}
// 왼쪽 div에 정보 추가
function setRouteDiv() {
	var str = "";
	for(var i = 0 ; i < routelist.length ; i++){
		str += "<div style = 'padding-left: 5px;'>" +
				"<div style='width:28px;height:7pt;border-right:3px solid skyblue'></div>" +
					"<div style = 'width:50px;height:50px;display:inline-block;float:left;margin-right:15px;border:3px solid skyblue;border-radius:28px;'>" +
						"<select id = 'stay" + i + "' style = 'margin-top:15px;margin-left:2px;' onchange = 'javascript:changeStay(" + i + ")'>";
							for(var j = 0 ; j < 10 ; j++){
								str += "<option value = '" + j + "' ";
								if(j == routelist[i].stay){
									str += "selected = 'selected'";
								}
								str += ">" + j + "박</option>";
							}
				str += "</select>" +
					"</div>" +
					"<div style = 'width:180px;float:left;'>" +
						"<div>" +
							"<span style = 'font-size:20px;font-weight:bold;'>" + routelist[i].city + "</span>" +
							"<span> " + routelist[i].country + " </span>" +
							"<a href='javascript:deleteCity(" + i + ")'><span style = 'font-size:10px;color:#aaa;'><i class='fas fa-times-circle'></i></span></a>" +
						"</div>" +
						"<div><span style = 'font-size:12px;color:gray;margin-top: 5px;'>" + routelist[i].date_in + "~" + routelist[i].date_out + "</span></div>" +
					"</div>" +
					"<div style='width:28px;height:7pt;border-right:3px solid skyblue;clear:both;'></div>" +
				"</div>";
		if(i < routelist.length - 1){
			str += "<div style='width:28px;height:15pt;padding-left: 5px;border-right:3px solid skyblue;'></div>";
		}
		$('#route').html(str);
	}
}
// x 버튼 누르면 동작하는 루트 삭제 함수
function deleteCity(i) {
	if(confirm("정말 삭제하시겠습니까?")){
		clearMarkers();
		clearLines();
		if(routelist.length == 1){
			routelist = [];
			$('#route').html("");
		}else{
			routelist.splice(i, 1);
		}
		setRouteDate();
		setMapRoute();
	}else{
		return;
	}
}
// 머무는 날짜 바꾸면 동작하는 함수
function changeStay(i) {
	var stay = $("#stay" + i).val();
	// routelist의 해당 배열 stay 수정
	routelist[i].stay = stay;
	// routelist의 모든 date_in, date_out 수정
	setRouteDate();
	setMapRoute();
}
// Date 객체를 format해서 리턴하는 함수
function formatDate(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	m = m >= 10 ? m : "0" + m;
	var d = date.getDate();
	d = d >= 10 ? d : "0" + d;
	var week = ["일", "월", "화", "수", "목", "금", "토"];
	var day = week[date.getDay()];
	return y + "-" + m + "-" + d + "(" + day + ")";
}
// datepicker 날짜 수정하면 routelist date_in, date_out 수정하는 함수
function setRouteDate() {
	var date = $("#startDate").val();
	var startdate = new Date(date);
	var date_in, date_out;
	for(var i = 0 ; i < routelist.length ; i++){
		if(routelist.length == 1){
			date_in = startdate;
			routelist[i].date_in = formatDate(date_in);
			date_out = new Date(date_in.getFullYear(),date_in.getMonth(), date_in.getDate() + eval(routelist[i].stay));
			routelist[i].date_out = formatDate(date_out);
			startdate = date_out;
		}else{
			date_in = startdate;
			routelist[i].date_in = formatDate(date_in);
			date_out = new Date(date_in.getFullYear(), date_in.getMonth(), date_in.getDate() + eval(routelist[i].stay));
			routelist[i].date_out = formatDate(date_out);
			startdate = date_out;
		}
	}
	setRouteDiv();
}