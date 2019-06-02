var plan_num;
var routelist = [];
var markers = [];
var lines = [];
var arrow, line;
var map;
var stays = 1;	// 총 여행 날짜

function initDetailMap() {
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
    map = new google.maps.Map(document.getElementById('detailMap'), {
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
    
    var geocoder = new google.maps.Geocoder();
    

	plan_num = $("#plan_num").val();
	$.ajax({
		url: "/planit/plan/detail",
		method: "post",
		dataType: "json",
		data: {plan_num: plan_num},
		success: function(data) {
			routelist = data;
			for(var i = 0 ; i < routelist.length ; i++){
				console.log(routelist[i].lat);
				setMapRoute();
			}
		}
	});
}