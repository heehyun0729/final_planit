<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
	.topLeftRadius{
		border-top-left-radius: 25px;
	}
	.topRightRadius{
		border-top-right-radius: 25px;
	}
	.bottomLeftRadius{
		border-bottom-left-radius: 25px;
	}
	.bottomRightRadius{
		border-bottom-right-radius: 25px;
	}
	.errMsg{
		color: red;
		font-size: 0.8em;
		display: none;
	}
	.formWrapper{
		width: 90%;
		margin: auto;
		margin-top: 15px;
	}
	.calendarWrapper{
		overflow:hidden;
		text-align: center;
		float: left;
		margin-right: 30px;
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
		width: 150px; height: 20px; background-color: #DAD9FF; cursor:default;
	}
	.dateNum{
		width: 150px; height: 20px; text-align: left; text-indent: 10px; cursor:default;
	}
	.dateNumColor{
		background-color: #D4F4FA;
	}
	.dayDo{
		width: 150px; height: 70px; 
	}
	.hover{
		background-color: white; transition: 0.5s
	}
	.hover:hover{
		background: linear-gradient(#B2EBF4, #FFFFFF); cursor:pointer;
	}
	.hover:active{
		background: linear-gradient(#FFFFFF, #B2EBF4);
	}
	.empty{
		
	}
	.cant{
		background: linear-gradient(#FFC6C6, #FFFFFF);
	}
	.soldOut{
		background: url("<c:url value='/resources/adminImages/soldOut.png'/>") no-repeat center center;
	}
	.chanceDiv{
		display: none; position: absolute; background-color: #FCFCFC; width: 50px; border: 1px solid gray; cursor:pointer;
	}
	.chances{
		background-color: #EAEAEA; text-align: center;
	}
	.chances:hover{
		background-color: #DAD9FF;
	}
	.ordered{
		cursor:pointer; background: url("<c:url value='/resources/adminImages/checked.png'/>") no-repeat center center;
	}
	.ordered:active{
		background-size: 40%;
	}
	.cancel{
		background-color: #EAEAEA; text-align: center;
	}
	.cancel:hover{
		background-color: #DAD9FF;
	}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		calendar();
		$("#form").on('submit', function(){//에러메시지 출력
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
			if($("#cart").children().length==0){
				$("#cartErrMsg").fadeIn(300).delay(1000).fadeOut(300);
				return false;
			};
		});
		$("body").click(function(event) {//바디에 이벤트주기
		    if($(event.target).hasClass('hover')) {
		    	getChance(event);
		    }else if($(event.target).hasClass('chances')){
		    	addOrder(event);
		    }else if($(event.target).hasClass('ordered')){
		    	getCancel(event);
		    }else if($(event.target).hasClass('cancel')){
		    	const id=$("#tempId").val();
		    	deleteOrder(id,todayMonth);
		    }else{
		    	$("#chanceDiv").hide();
		    }
		});
	});
	var idChance=[];//id 순서별 확률 모음
	var orderedId=[];//주문한 날짜를 포함한 id 배열
	function getChance(event){//확률 가져오고 메뉴 열기
		const x=event.pageX;
		const y=event.pageY;
		const chance=$(event.target).text().replace("%","");
		$("#chanceDiv").empty();		
		for(var i=10;i<=100-chance;i+=10){
			$("#chanceDiv").append("<div class='chances'>" + i + "&percnt;</div>");
		}
		$("#chanceDiv").css("left",x+15);
		$("#chanceDiv").css("top",y);
		$("#chanceDiv").hide();
		$("#chanceDiv").slideDown(300);
		$("#tempId").val($(event.target).prop("id"));
	}
	function addOrder(event){//주문 추가
		const chance=$(event.target).text();
		const id=$("#tempId").val()
		const day=id.replace("do","");
		const chanceDate=chance+id+todayMonth+"y"+todayYear;
		if($("#cart").children().length==0){
			$("#cart").append("<div>주문 현황</div><br>");
		};
		$("#form").append("<input id='" + id + "order' name='order' type='hidden' value='" + chanceDate + "'>");
		$("#form").append("<input id='" + id + "orderDate' name='orderDate' type='hidden' value='" + todayYear + "-" + todayMonth + "-" + day + "'>");
		$("#cart").append("<div id='" + id + "cart'>" + todayYear + "-" + todayMonth + "-" + day + " : " + chance + " <a href='javascript:deleteOrder(\"" + id + "\","+ todayMonth +")'><img src='<c:url value='/resources/adminImages/delete.png'/>'/></a>"+"</div>");
		$("#chanceDiv").hide();
		$("#"+id).addClass('ordered');
		$("#"+id).removeClass('hover');
		$("#"+id).text("");
		orderedId.push(id+todayMonth);
		getPrice();
	}
	function getCancel(event){//취소 메뉴 열기
		const x=event.pageX;
		const y=event.pageY;
		$("#chanceDiv").empty();
		$("#chanceDiv").append("<div class='cancel'>취소</div>");
		$("#chanceDiv").css("left",x+15);
		$("#chanceDiv").css("top",y);
		$("#chanceDiv").hide();
		$("#chanceDiv").slideDown(300);
		$("#tempId").val($(event.target).prop("id"));
	}
	function deleteOrder(id,month){//주문 취소
		$("#chanceDiv").hide();
		$("#"+id+"cart").remove();
		$("#"+id+"order").remove();
		$("#"+id+"orderDate").remove();
		$("#"+id+"orderPrice").remove();
		$("#"+id).removeClass('ordered');
		$("#"+id).addClass('hover');
		$("#"+id).text(idChance[id.replace("do","")]+"%");
		const idMonth=id+month;
		orderedId=$.grep(orderedId, function(value){
			return value != idMonth;
		});
		getPrice();
	}
	function getPrice(){//가격 계산
		if($("#cart").children().length==1){
			$("#cart").empty();
		};
		const orders=$("input[name='order']");
		let price=0;
		$("#ordersDiv").empty();
		$.each(orders, function(){
			const chance=parseInt($(this).val().toString().split("%")[0]);
			const chancePrice=chance*1000;
			const id=$(this).prop("id");
			$("#ordersDiv").append("<input id='" + id + "orderPrice' name='orderPrice' type='hidden' value='" + chancePrice + "'>");
			price += chancePrice;
		});
		$("input[name='ad_price']").val(price);
		var reg = /(^[+-]?\d+)(\d{3})/;
	    price += '';
	    while (reg.test(price))
	    price = price.replace(reg, '$1' + ',' + '$2');
	    if($("#cart").children().length==0){
	    	$("#price").html("");
		}else{
			$("#price").html("결제 금액 : " + price + "&#8361;");
		};
	}	
	//달력에 필요한 변수
	var realToday=new Date();
	var today=new Date();
	var todayYear=today.getFullYear();//년
	var todayMonth=today.getMonth()+1;//월
	var todayDate=today.getDate();//일
	var lastDate=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	var isNextMonth=false;
	if(todayDate+7>lastDate[todayMonth]){
		today.setDate(today.getDate()+7);
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
			$("#nextMonth").html("<a href='#' onclick='javascript:nextMonth()'>></a>");
		}else{
			$("#prevMonth").html("<a href='#' onclick='javascript:prevMonth()'><</a>");
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
						div.addClass('hover');
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
						div.addClass('hover');
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
			div.addClass('hover');
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
						$("#"+i+"do").removeClass("hover");
						$("#"+i+"do").addClass("soldOut");
						$("#"+i+"do").text("");
					}
					idChance.push(chance);
				}
				for(var i=1;i<=lastDate[todayMonth-1];i++){//주문확인 후 주문했으면 주문표시
					for(var a=0;a<orderedId.length;a++){
						if(orderedId[a]==(i+"do"+todayMonth)){
							$("#"+i+"do").addClass('ordered');
							$("#"+i+"do").removeClass('hover');
							$("#"+i+"do").text("");
						}
					}
				}
				//1주일 후 부터 주문 가능하게 표시
				if(todayMonth==realToday.getMonth()+2 && isNextMonth==true){//오늘로부터 7일 후 가 달을 넘어가면?
					for(var i=1;i<=todayDate;i++){
						$("#"+i+"do").addClass('cant');
						$("#"+i+"do").removeClass('hover');
						$("#"+i+"do").text("");
					}
				}else if(todayMonth==realToday.getMonth()+1 && isNextMonth==false){
					for(var i=1;i<=todayDate;i++){
						$("#"+i+"do").addClass('cant');
						$("#"+i+"do").removeClass('hover');
						$("#"+i+"do").text("");
					}
				}
			}else{
				console.log("DB에서 데이터를 받아오지 못함");
			}
		});
		
	}
</script>
<div class="wrapper">
<header>
</header>
<section>
	<article class="formWrapper">
		<div id="calendar" class="calendarWrapper"></div>
		<input type="hidden" id="tempId">
		<div class="stick">
			<div id="cart"></div><br>
			<div id="price"></div><br>
			<form id="form" method="post" action="<c:url value="/adminAdRequestForm"/>" enctype="multipart/form-data">
				<input type="hidden" name="mem_id" value="Master">
				<input type="hidden" name="ad_price" value="">
				<div id="chanceDiv" class="chanceDiv"></div>	
				<div id="ordersDiv"></div>
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
				<br><span id="urlErrMsg" class="errMsg">연결 주소를 입력하세요.</span><span id="cartErrMsg" class="errMsg">광고를 표시할 날짜를 선택하세요.</span>
				<br>
				<input type="submit" value="결제하기">
			</form>
		</div>
	</article>
</section>
<footer>
	
</footer>
</div>