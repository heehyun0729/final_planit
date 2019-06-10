<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	.wrapper{
		width: 100%;
		padding: 0px;
		margin: 0px;
		cursor: default;
	}
	.topLeftRadius{
		border-top-left-radius: 0px;
	}
	.topRightRadius{
		border-top-right-radius: 0px;
	}
	.bottomLeftRadius{
		border-bottom-left-radius: 0px;
	}
	.bottomRightRadius{
		border-bottom-right-radius: 0px;
	}
	.soldOut{
		background: url("<c:url value='/resources/adminImages/soldOut.png'/>") no-repeat center center;
	}
	.calendarWrapper{
		overflow:hidden;
		text-align: center;
		width: 100%;
		margin: auto;
		margin-top: 40px;
		background: #fff;
		box-shadow: 0 3px 6px 0px rgba(0,0,0,0.16), 0 3px 6px 0px rgba(0,0,0,0.23);
		border-radius: 5px;
		border: 1px solid #f8f9fa;
	}
	.prevMonth{
		font-size: 2em; float:left; width:10%;
	}
	.calendarDate{
		font-size: 2em; float:left; width:80%; cursor:default;
	}
	.nextMonth{
		font-size: 2em; float:left; width:9.9%;
	}
	.stick{
		float: left;
	}
	.br{
		clear: both;
	}	
	.sunDay{
		color: red; 
	}
	.satDay{
		color: blue;
	}
	.dayName{
		width: 158px; height: 20px; background-color: #f8f9fa; cursor:default;
	}
	.dateNum{
		width: 158px; height: 20px; text-align: left; text-indent: 10px; cursor:default;
	}
	.dateNumColor{
		background-color: #f8f9fa;
	}
	.dayDo{
		width: 158px; height: 70px; display: table-cell; vertical-align: middle;
	}
	.chances{
		background-color: #EAEAEA; text-align: center;
	}
	.form-box{
		float: left;
		background: #fff;
		margin: 15px auto;
		width: 100%;
		box-shadow: 0 3px 6px 0px rgba(0,0,0,0.16), 0 3px 6px 0px rgba(0,0,0,0.23);
		text-align: center;
		border-radius: 5px;
	}
	.arrowBox{
		margin-top: 20px;
		margin-bottom: 20px;
		text-align: center;
	}
	.form-control{
		cursor: auto;
		width: 50%;
		margin: auto;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		calendar();
	});
	//달력에 필요한 변수
	var realToday=new Date();
	var today=new Date();
	var todayYear=today.getFullYear();//년
	var todayMonth=today.getMonth()+1;//월
	var todayDate=today.getDate();//일
	var lastDate=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	var isNextMonth=false;
	if(todayDate+7>lastDate[todayMonth]){
		today.setDate(today.getDate());
		todayYear=today.getFullYear();//년
		todayMonth=today.getMonth()+1;//월
		todayDate=today.getDate();//일
		isNextMonth=true;
	}
	if(((todayYear.value%4==0 && todayYear.value%100!=0) || todayYear.value%400==0)&& todayMonth.value==2){//윤년 2월, 29일
		lastDate[1]=29;
	}	
	var todayDay=today.getDay();//요일
	function nextMonth(){
		todayMonth+=1;
		$("#calendar").empty();
		calendar();
	}
	function prevMonth(){
		todayMonth-=1;
		$("#calendar").empty();
		calendar();
	}
	function calendar(){
		//달력 만들기 시작
		$("#calendar").append("<div id='prevMonth' class='prevMonth'>&nbsp;</div>");
		$("#calendar").append("<div id='calendarDate' class='calendarDate'></div>");
		$("#calendar").append("<div id='nextMonth' class='nextMonth'>&nbsp;</div>");
		$("#calendar").append("<div style='clear: both;'></div>");
		$("#calendarDate").html(todayYear + ". " + todayMonth);
		if(todayMonth==today.getMonth()+1){
			$("#nextMonth").html("<a href='#' onclick='javascript:nextMonth()'><img alt='다음 달' class='cursor' src='<c:url value='/resources/adminImages/right-arrow.png'/>'></a>");
		}else{
			$("#prevMonth").html("<a href='#' onclick='javascript:prevMonth()'><img alt='이전 달' class='cursor' src='<c:url value='/resources/adminImages/left-arrow.png'/>'></a>");
		}
		var firstDate=new Date(todayYear,todayMonth-1,1);
		var firstDay=firstDate.getDay();
		var dayName=["일", "월", "화", "수", "목", "금", "토"];
		for(var i=0;i<dayName.length;i++){//요일 만들기
			if(i==0){
				const div=$("<div></div>");
				div.text(dayName[i]);
				div.addClass('sunDay');
				div.addClass('stick');
				div.addClass('dayName');
				div.addClass('topLeftRadius');
				$("#calendar").append(div);
			}else if(i==6){
				const div=$("<div></div>");
				div.text(dayName[i]);
				div.addClass('satDay');
				div.addClass('stick');
				div.addClass('dayName');
				div.addClass('topRightRadius');
				$("#calendar").append(div);
			}else{
				const div=$("<div></div>");
				div.text(dayName[i]);
				div.addClass('stick');
				div.addClass('dayName');
				$("#calendar").append(div);
			}
		}
		$("#calendar").append("<div class='br'></div>");
		
		var isSatDay=0;
		var emptyDay=0;
		var doDay=1;
		for(var i=0;i<firstDay;i++){//1일 시작 전 빈칸 만들기
			const div=$("<div></div>");
			div.addClass('stick');
			div.addClass('dateNum');
			div.addClass('empty');
			$("#calendar").append(div);
			isSatDay++;
			emptyDay++;
		}
		for(var i=0;i<lastDate[todayMonth-1];i++){//해당 월의 마지막 일수만큼 일자 만들기
			if(isSatDay==7){//1주일이 다 차면 줄바꿈 하고 빈칸으로 일정 만들기
				$("#calendar").append("<div class='br'></div>");
				if(emptyDay!=0){
					for(var a=0;a<emptyDay;a++){//빈칸일정
						const div=$("<div></div>");
						div.addClass('stick');
						div.addClass('dayDo');
						div.addClass('empty');
						$("#calendar").append(div);
					}
					for(var b=0;b<7-emptyDay;b++){//첫째 주 나머지 일정
						const div=$("<div></div>");
						div.prop('id', doDay+"do");
						div.addClass('stick');
						div.addClass('dayDo');
						$("#calendar").append(div);
						doDay++;
					}
					$("#calendar").append("<div class='br'></div>");
					isSatDay=0;
					emptyDay=0;
				}else{
					for(var c=0;c<7;c++){//일반 일정
						const div=$("<div></div>");
						div.prop('id', doDay+"do");
						div.addClass('stick');
						div.addClass('dayDo');
						$("#calendar").append(div);
						doDay++;
					}
					$("#calendar").append("<div class='br'></div>");
					isSatDay=0;
				}
			}
			const div=$("<div></div>");//날짜 표시
			div.prop('id', i+1);
			div.html(i+1);
			if(isSatDay==0){
				div.addClass('sunDay');
			}
			if(isSatDay==6){
				div.addClass('satDay');
			}
			div.addClass('stick');
			div.addClass('dateNum');
			div.addClass('dateNumColor');
			
			$("#calendar").append(div);
			isSatDay++;
		}
		for(var d=0;d<7-isSatDay;d++){//마지막주 빈칸 날짜
			const div=$("<div></div>");
			div.addClass('stick');
			div.addClass('dateNum');
			div.addClass('empty');
			$("#calendar").append(div);
		}
		$("#calendar").append("<div class='br'></div>");//마지막주 일정
		for(var i=0;i<isSatDay;i++){
			const div=$("<div></div>");
			div.prop('id', doDay+"do");
			div.addClass('stick');
			div.addClass('dayDo');
			$("#calendar").append(div);
			doDay++;
		}
		for(var i=0;i<7-isSatDay;i++){//마지막주 빈칸 일정
			const div=$("<div></div>");
			div.addClass('stick');
			div.addClass('dayDo');
			div.addClass('empty');
			$("#calendar").append(div);
		}
		$("#calendar").append("<div class='br'></div>");
		for(var i=0;i<7;i++){//마지막 테두리
			const div=$("<div></div>");
			div.addClass('stick');
			div.addClass('dayName');
			$("#calendar").append(div);
			if(i==0){
				div.addClass('bottomLeftRadius');
			}if(i==6){
				div.addClass('bottomRightRadius');
			}
		}
		//신청 확률 값 DB에서 얻어오기
		$.getJSON("<c:url value='/adminAdGetChance'/>", {todayYear:todayYear,todayMonth:todayMonth,lastDate:lastDate[todayMonth-1]}, function(data) {
			if(data!=null){
				for(var i=1;i<=lastDate[todayMonth-1];i++){
					const chance=data["chance"+i];
					$("#"+i+"do").text(chance+"%");
					if(chance==100){
						$("#"+i+"do").addClass("soldOut");
						$("#"+i+"do").text("");
					}
				}
			}else{
				console.log("DB에서 데이터를 받아오지 못함");
			}
		});
	}    
</script>
<section class="container">	
	<div id="calendar" class="calendarWrapper" ></div>
</section>