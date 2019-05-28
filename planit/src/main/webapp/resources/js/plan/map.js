function initMap() {
	// 지도 초기화
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 46.519, lng: 6.632},
      zoom: 5,
      mapTypeId: 'roadmap',
      scrollwheel : true
    });
    
    // 자동완성검색
    var options = { types: ['(cities)'] };	// 장소 검색 범위를 도시로 제한
    var input = document.getElementById('address');
    var autocomplete = new google.maps.places.Autocomplete(input, options);
    
    autocomplete.bindTo('bounds', map);
    
    autocomplete.setFields(
            ['address_components', 'geometry', 'name', 'place_id']);
  
    var geocoder = new google.maps.Geocoder();
    
    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker();
    
    var cnt = 0;
    // 자동완성검색 선택했을 때 실행할 리스너 ==> 마커 찍고 인포윈도우 띄우기
    autocomplete.addListener('place_changed', function() {
		var place = autocomplete.getPlace();	// 장소(도시) 정보 가져오기
		// 지리 정보 받아서 마커, 인포윈도우 표시
      //  geocodeAddress(geocoder, map, place, infowindow, marker);
		
		$.getJSON('/planit/googleMap', {
			placeid: place.place_id,
			key: 'AIzaSyBJZmVpy1Zt3vbL5tusNVtcsJQnGjMLOQo'
		}, function(data) {
			var city = "";
			var country = "";
			var address = data.result.address_components;
			for(var i = 0 ; i < address.length ; i++){
				if(address[i].types[0] == 'locality'){
					city = address[i].short_name;
				}
				if(address[i].types[0] == 'country'){
					country = address[i].long_name;
				}
			}
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
		        infowindow = new google.maps.InfoWindow({
		       	 content: city + ", " + country + " <input type = 'button' id = 'addCity' value = '추가'>"
		        }, function() {
			        $("#addCity").on('click', function(){
		        		console.log(11);
						$("#leftBox").append("<div>" +
								city + ", " + country +
							"</div>");
					});
				});
		        infowindow.open(map, marker);
		      } else {
		        alert('해당 도시 정보를 찾을 수 없습니다.');
		      }
		    });
		});
    });
  }