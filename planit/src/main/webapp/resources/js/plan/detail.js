var plan_num;
var routelist = [];
var markers = [];
var lines = [];
var events = [];
var arrow, line;
var map;
var scheduleDialog, startDateDialog, infoDialog;
var startDatepicker;
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
    // 총 여행기간  div 위치 설정
    var planStays = document.getElementById("planStays");
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(planStays);   
    
    var geocoder = new google.maps.Geocoder();
    // routelist 받아오기
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
				// 달력에 표시할 events 배열에 데이터 저장
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
			// 첫 번째 도시로 지도 중앙 설정
			map.setCenter({lat:Number(routelist[0].lat), lng:Number(routelist[0].lng)});
			setMapRoute();	// 마커, 경로 표시
			showCalendar();	// 달력 설정
			setDialog();	// dialog창 설정
		}
	});
}
// 달력에 이벤트 표시하는 함수
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
		// 이벤트에 마우스 올리면 tooltip 표시
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
// dialog창 설정하느 함수
function setDialog() {
	startDateDialog = $( "#startDateDialog" ).dialog({
      autoOpen: false,
      height: 380,
      width: 320,
      modal: true,
      buttons: {
        "저장": updateStartDate,
        "취소": function() {
        	startDateDialog.dialog("close");
		} 
      } 
    });
	infoDialog = $( "#infoDialog" ).dialog({
      autoOpen: false,
      height: 250,
      width: 250,
      modal: true,
      buttons: {
        "저장": updateInfo,
        "취소": function() {
        	infoDialog.dialog("close");
		} 
      } 
    });
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
// 출발일 변경 dialog 열기
function openInfoDialog() {
	
	infoDialog.dialog( "open" ); 
}
// 플래너 정보 수정 dialog 열기
function openStartDateDialog() {
	$( "#startDatepicker" ).datepicker({
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                        "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
		defaultDate: routelist[0].date_in
	});
	startDateDialog.dialog( "open" ); 
}
// 세부일정 수정 dialog 열기
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
// 출발일  DB 수정하는 함수
function updateStartDate() {
	// routelist의 각 루트 날짜 수정
	var startdate = new Date($( "#startDatepicker" ).datepicker("getDate"));
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
	$.ajax({
		url: '/planit/plan/updateStartDate',
		dataType: 'json',
		method: 'post',
		data: {
			num: plan_num,
			startDate: formatDate(startdate),
			routelist:JSON.stringify(routelist)
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
// 플래너 정보 DB 수정하는 함수
function updateInfo() {
	var title = $("#infoTitle").val();
	var plan_public = $("#infoDialog input:checked").val();
	$.ajax({
		url: '/planit/plan/updateInfo',
		dataType: 'json',
		method: 'post',
		data: {
			num: plan_num,
			title: title,
			plan_public: plan_public
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
// 세부 일정 DB 수정하는 함수
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
// 세부 일정 null로 DB 수정하는 함수
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