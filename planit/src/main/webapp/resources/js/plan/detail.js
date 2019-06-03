var plan_num;
var routelist = [];
var markers = [];
var lines = [];
var events = [];
var arrow, line;
var map;
var scheduleDialog, scheduleForm;
var planDetail_num;
var bgcolors = ['#113f67', '#34699a', '#408ab4', '#65c6c4', '#35477d', '#6c5b7b', '#c06c84', '#f67280'];

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

    var planStays = document.getElementById("planStays");
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(planStays);
    var planStartDate = document.getElementById("planStartDate");
    map.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(planStartDate);
    
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
				var date = new Date(routelist[i].date_out);
				var date_out = new Date(date.getFullYear(), date.getMonth(), date.getDate() + eval(1));
				var formattedDate = formatDate(date_out);
				events.push({
					order: routelist[i].order,
					title: routelist[i].city,
					start: routelist[i].date_in.substr(0, 10),
					end: formattedDate.substr(0, 10),
					color: bgcolors[i % 8],
					city:  routelist[i].city,
					country: routelist[i].country,
					description: 'asdasd'
				});
			}
			events.push({
				title: '출국일',
				start: routelist[0].date_in.substr(0, 10),
				color: '#999999'
			});
			map.setCenter({lat:Number(routelist[0].lat), lng:Number(routelist[0].lng)});
			setMapRoute();
			showCalendar();
			setScheduleDialog();
		}
	});
}
function showCalendar() {
	$("#planCalendar").fullCalendar({
		header: {
			left: 'prev',
			center: 'title',
			right: 'next' 
		},
		defaultDate: routelist[0].date_in,
		buttonIcons: true, 
		editable: false,
		locale:'ko',
		events:events,
		height: 460,
		contentHeight:440,
		eventRender: function(event, element) {
			 element.qtip({
			      content: {
			    	  title: event.city + ", " + event.country,
			    	  text: event.description
			      },
			      position: {
			          my: 'bottom center',
			          at: 'top center',
			          target: element
			      },
			      style: {
			          classes: 'qtip-light qtip-shadow'
			      }
			 });
		}
	});
}
function setScheduleDialog() {
	scheduleDialog = $( "#scheduleDialog" ).dialog({
      autoOpen: false,
      height: 450,
      width: 400,
      modal: true,
      buttons: {
        "저장": updateSchedule,
        "취소": function() {
			scheduleDialog.dialog("close");
		}
      }
    });
}
function openScheduleDialog(num) {
	planDetail_num = num;
	var route;
	 for(var i = 0 ; i < routelist.length ; i++){
		if(routelist[i].num == num){
			route = routelist[i];
		}
	}
	$("#scheduleCity").html(route.city + ", " + route.country);
	$("#scheduleDate").html(formatDate(new Date(route.date_in)) + "~" + formatDate(new Date(route.date_out)));
	scheduleDialog.dialog( "open" ); 
}
function updateSchedule() {
	var detail = $("#scheduleDetail").val();
	console.log(planDetail_num + " / " + detail);
	$.ajax({
		url: '/planit/plan/updateDetail',
		dataType: 'json',
		method: 'post',
		data: {
			num: planDetail_num,
			detail: detail
			},
		success: function(data) {
			var result = data.result;
			if(result == 'success'){
				location.href = "/planit/plan/detail?plan_num=" + plan_num;
			}else{
				alert("오류로 인해 작업을 실패했습니다.");
			}
		}
	});
}
function deleteSchedule(num) {
	if(confirm("정말 삭제하시겠습니까?")){
		planDetail_num = num;
		$.ajax({
			url: '/planit/plan/updateDetail',
			dataType: 'json',
			method: 'post',
			data: {
				num: planDetail_num,
				detail: ""
				},
			success: function(data) {
				var result = data.result;
				if(result == 'success'){
					location.href = "/planit/plan/detail?plan_num=" + plan_num;
				}else{
					alert("오류로 인해 작업을 실패했습니다.");
				}
			}
		});
	}
}