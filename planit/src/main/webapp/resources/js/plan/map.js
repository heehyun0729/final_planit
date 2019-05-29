var routelist = [];
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
			console.log(data);
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
		        var content = "<div>" +
		        		"<img style = 'float:left;margin-right:5px;' src = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=75&maxheight=75&photoreference="+ photoreference + "&key=" + key + "'>" + 
		        		"<div style='display:inline-block'><h3>" + city + "</h3><p>" + country + "</p></div>" +
		        		"<a href = 'javascript:addCity(\"" + city + "\",\"" + country + "\")'><span style='color:Tomato;margin:5px;'><i class='fas fa-plus-square fa-3x'></i></span></a>"
		        		"</div>";
		        infowindow = new google.maps.InfoWindow({
		       	 content: content
		        });
		        infowindow.open(map, marker);
		      } else {
		        alert('해당 도시 정보를 찾을 수 없습니다.');
		      }
		    });
		});
    });
  }

function addCity(city, country) {
	date_in = new Date($("#startDate").val());
	date_out = new Date(date_in.getFullYear(),date_in.getMonth(), date_in.getDate()+eval(1));

	var str = "";
	str += "<div>" +
			city + ", " + country + "<br>" +
			formatDate(date_in) + "~" + formatDate(date_out) +
			"</div>";
	$('#route').append(str);
}

function formatDate(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var week = ["일", "월", "화", "수", "목", "금", "토"];
	var day = week[date.getDay()];
	return y + "-" + m + "-" + d + "(" + day + ")";
}

$(function() {
	$("#startDate").datepicker({
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                        "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd"
	});
	$('#startDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
});