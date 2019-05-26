<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.errMsg{
		color: red; font-size: 0.8em; display: none;
	}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		buildCalendar();
		//에러메시지 출력
		$("#form").on('submit', function(){
			if($("#company").val()==""){
				$("#companyErrMsg").fadeIn(300).delay(1000).fadeOut(300);
				return false;	
			}
			if($("#file").val()==""){
				$("#fileErrMsg").fadeIn(300).delay(1000).fadeOut(300);
				return false;	
			}
			if($("#url").val()==""){
				$("#urlErrMsg").fadeIn(300).delay(1000).fadeOut(300);
				return false;	
			}
		});
	});
	function getChance(){
		if($("#startDate").val()!="" && $("#endDate").val()!=""){
			$.getJSON("<c:url value='/adminAdGetChance'/>", {ad_startDate:$("#startDate").val(),ad_endDate:$("#endDate").val()}, function(data) {
				$("#peroid").val(data.peroid);
				const chance=data.chance;
				if(chance!=0){
					$("#chanceDiv").empty();
					$("#chanceDiv").append(
						"<label for='chance'>노출 확률</label><br>" +
						"<select id='chance'></select><br><br>" +
						"<span>측정 가격</span><br><div id='price'></div><br>"
					);
					$("#chance").empty();
					for(var i=10;i<=chance;i+=10){
						$("#chance").append("<option>" + i + "&percnt;</option>");
					}
					getPrice();
					$("#chance").on('change', function(){
						getPrice();
					});
				}else{
					$("#chanceDiv").empty();
					$("#chanceDiv").append("<span class='Msg'>해당 기간에 가능한 광고 자리가 없습니다.</span><br><br>");
				}
			});
		}
	}
	function getPrice(){
		const chance=$("#chance").val().replace("%", "");
		const peroid=$("#peroid").val();
		const price=chance*peroid*5000;
		$("#price").empty();
		$("#price").append(price + "&#8361;");
		$("input[name='ad_price']").val(price);
		$("input[name='ad_chance']").val(chance);
	}
	
	//달력만들기 https://blog.naver.com/deeperain/221487399219
	var today = new Date();
	function setToday(year, month){
		today = new Date(year, month-1, 1);
	}
	//today 에 Date객체를 넣어줌 //ex)5일 
	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate()); // month 를 조정해 해당 월을 변경함
		buildCalendar(); // 달력을 새로 그려준다.
	}
	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		buildCalendar();
	}
	function buildCalendar() {// 현재 달fur
		var week = [ '일', '월', '화', '수', '목', '금', '토', '일', '월', '화', '수',
					'목', '금', '토', '일', '월', '화', '수', '목', '금', '토', '일', '월',
					'화', '수', '목', '금', '토', '일', '월', '화', '수', '목', '금', '토',
					'일', '월', '화', '수', '목', '금', '토' ];
		var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); // 이번 달의 첫째 날
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); // 이번 달의 마지막 날
		var tblCalendar = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
		var tblCalendarYM = document.getElementById("calendarYM"); // yyyy년 m월 출력할 곳
			tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; // yyyy년 m월 출력​
		var dayWeek = week[nMonth.getDay()]; //이번달 첫째날의 요일
		var year = today.getFullYear();
		var lastYear = 0;
		// year와 lastyear가 동일할경우 setLunaToSolar를 계산하지 않음;
		var isSame = false;
		if (year == lastYear){
			isSame = true;	
		}
		var solarHolidays = [ "0101", "0301", "0505", "0606", "0717", "0815", "1003", "1225" ]; //양력휴일
		var lunaHolidays = [ "0101", "0102", "0408", "0814", "0815", "0816" ]; //음력휴일, 설전날도 넣어야함.​
		//대체공휴일 입력구간. 임시휴일이나 대체공휴일이 있을 경우 배열에 넣으면됨. yyyymmdd 입력
		var alternativeHolidays = [ "20150929", "20160210", "20170130",
									"20180926", "20180507", "20190506", "20200127", "20220912",
									"20230124", "20240212", "20240506", "20251008", "20270209",
									"20290924", "20290507", "20300205", "20300506", "20320921",
									"20330202", "20340221", "20350918", "20360130" ];​
		var setLunaToSolar = []; //당년도의 음력을 양력으로​
		//테이블에 기존값이 존재할 경우 해당 값을 다 날림.
		if ($('#calendar tbody tr').length > 0 && tblCalendar.rows.length != 0) {
			while (tblCalendar.rows.length > 0) { //기존 테이블 삭제
				tblCalendar.deleteRow(tblCalendar.rows.length - 1);
			}
		}​
		var header = tblCalendar.createTHead();
		var hrow = null;
		hrow = header.insertRow();
		var headerCell = document.createElement("th");
		headerCell.innerHTML = "소속(팀)";
		headerCell.rowSpan = 2;
		hrow.appendChild(headerCell);​
		headerCell = document.createElement("th");
		headerCell.innerHTML = "성명";
		headerCell.rowSpan = 2;
		hrow.appendChild(headerCell);​
		var workDay = 0;
		var cnt = nMonth.getDay();​
		//setLunaToSolar
		///////////////////////////////////////////////////
		if (!isSame) { //당년도의 음력휴일 양력으로 변환 
			for (i = 0; i < lunaHolidays.length; i++) {
				var solar = Resut(year + "" + lunaHolidays[i]);
				if (i == 0) {
					//var cDate = new Date();
					var cMonth = solar.substring(0, 2);
					var cDay = solar.substring(2, 4);
					var cDate = new Date(parseInt(cMonth) + "/" + parseInt(cDay) + "/" + year);
					cDate.setDate(cDate.getDate() - 1); // 하루전​
					/* cDate.setMonth(parseInt(cMonth-1)); // 월 설정
					cDate.setDate(parseInt(cDay)); //일 설정
					//cDate.setDate(-1); //하루전날 
					//var sdate = cDate.setDate(cDate.getDate()-1); */
					var sm = (cDate.getMonth() + 1);
					if (sm < 10){
						sm = "0" + sm;
					}					
					var sd = (cDate.getDate());
					if (sd < 10){
						sd = "0" + sd;
					}
					sDate = sm + "" + sd;
					setLunaToSolar.push(sDate);
				}
				setLunaToSolar.push(solar);
			}
			lastYear = today.getFullYear();
		}​
		var year1 = today.getFullYear();
		var month1 = (today.getMonth() + 1);
		//console.log(dayWeek);
		if ((today.getMonth() + 1) < 10) {
			month1 = "0" + (today.getMonth() + 1);
		}​
		var list = [];​
		for (i = 0; i < solarHolidays.length; i++) { // 양력휴일 넣음
			if (solarHolidays[i].substring(0, 2) == month1) {
				list.push(solarHolidays[i].substring(2, 4)); //휴일이 있을경우 list에 넣는다.
			}
		}​
		for (i = 0; i < setLunaToSolar.length; i++) { // 음력휴일 넣음
			if (setLunaToSolar[i].substring(0, 2) == month1) {
				list.push(setLunaToSolar[i].substring(2, 4)); //휴일이 있을경우 list에 넣는다.
			}
		}​
		for (i = 0; i < alternativeHolidays.length; i++) { //해당년도의 임시, 대체공휴일 추가
			if (alternativeHolidays[i].substring(0, 4) == year) {//공휴년도가 해당년도와 일치할경우
				if (alternativeHolidays[i].substring(4, 6) == month1) { //공휴년도가 해당월과 일치할경우
					list.push(alternativeHolidays[i].substring(6, 8)); //일치하는 휴일이 있을경우 list에 넣는다.
				}
			}
		}​
		for (i = 0; i < lastDate.getDate(); i++) {
			var pass = false;
			headerCell = document.createElement("th");
			if (list.length > 0) { //휴일이 있을경우
				for (j = 0; j < list.length; j++) {
					if (list[j] == (i + 1)) {
						headerCell.className = "red"; //공휴일은 빨간날로
						pass = true;
						break; //공휴일을 그렸으면 토,일 검사를 하지 않음.
					}
				}
			}
			if (!pass) {
				if (cnt % 7 == 6) {
					headerCell.className = "blue"; // 토요일은 파란색으로
				}
				if (cnt % 7 == 0) {
					headerCell.className = "red"; // 일요일은 빨간색으로
				}
			}
			headerCell.innerHTML = week[nMonth.getDay() + i];
			hrow.appendChild(headerCell);
			cnt++;
		}​
		headerCell = document.createElement("th");
		headerCell.innerHTML = "비고";
		headerCell.className = "cBlue";
		headerCell.rowSpan = 2;
		hrow.appendChild(headerCell);​
		headerCell = document.createElement("th");
		headerCell.innerHTML = "기타";
		headerCell.className = "cBlue";
		headerCell.rowSpan = 2;
		hrow.appendChild(headerCell);​
		hrow = calendar.insertRow();​
		cnt = nMonth.getDay();
		for (i = 1; i <= lastDate.getDate(); i++) { //1일부터 그달의 마지막일까지 그려준다.
			var pass = false;
			var isHoliday = false;
			headerCell = document.createElement("th");​
			if (list.length > 0) { //휴일이 있을경우
				for (j = 0; j < list.length; j++) {
					if (list[j] == i) {
						headerCell.className = "red"; 
						pass = true;
						isHoliday = true;
						break;
					}
				}
			}
			if (!pass) {
				if (cnt % 7 == 6) {
					headerCell.className = "blue";
					isHoliday = true;
				}
				if (cnt % 7 == 0) {
					headerCell.className = "red";
					isHoliday = true;
				}
			}
			if (!isHoliday) {
				workDay++;
			}
			headerCell.innerHTML = i;
			hrow.appendChild(headerCell);
			cnt++;
		}
	}
</script>
</head>
<body>
<div class="wrapper">
<header>
	<h1>광고 신청 폼</h1>
</header>
<section>
	<article>
		<div id="calendarYM">
		</div>
		<table id="calendar">
		
		</table>
		<form id="form" method="post" action="<c:url value="/adminAdRequestForm"/>" enctype="multipart/form-data">
			<input type="hidden" name="mem_id" value="Master">
			<input type="hidden" name="ad_price" value="">
			<input type="hidden" name="ad_chance" value="">
			<input type="hidden" id="peroid" value="">
			<label for="startDate">시작일</label><br><input type="text" name="ad_startDate" id="startDate" readonly="readonly">
			<br><span id="startDateErrMsg" class="errMsg">시작일을 입력하세요.</span>
			<br>
			<label for="endDate">종료일</label><br><input type="text" name="ad_endDate" id="endDate" readonly="readonly">
			<br><span id="endDateErrMsg" class="errMsg">종료일을 입력하세요.</span>
			<br>
			<div id="chanceDiv">
				
			</div>			
			<label for="company">회사 이름</label>
			<br>
			<input type="text" name="ad_company" id="company" placeholder="플랜잇(Planit)">
			<br><span id="companyErrMsg" class="errMsg">회사 이름을 입력하세요.</span>
			<br>
			<label for="file">광고 이미지(50*200)</label>
			<br>
			<input type="file" name="file" id="file">
			<br><span id="fileErrMsg" class="errMsg">광고할 이미지를 첨부하세요.</span>
			<br>
			<label for="url">연결 주소</label>
			<br>
			<input type="text" name="ad_url" id="url" placeholder="http://www.planit.com">
			<br><span id="urlErrMsg" class="errMsg">연결 주소를 입력하세요.</span>
			<br>
			<input type="submit" value="완료">
		</form>
	</article>
</section>
<footer>
	
</footer>
</div>
</body>
</html>