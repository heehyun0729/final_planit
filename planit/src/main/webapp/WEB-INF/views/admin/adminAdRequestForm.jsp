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
	.errMsg{
		color: white;
		font-weight: bolder;
		margin-left: 10px;
		margin-right: 10px; 
	}
	.formWrapper{
		width: 100%;
		margin: auto;
		margin-top: 15px;
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
		width: 169px; height: 20px; background-color: #f8f9fa; cursor:default;
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
	.hover{
		
	}
	.hover:hover{
		background: #f8f9fa; cursor:pointer;
	}
	.empty{
		
	}
	.cant{
		background: #f8f9fa;
	}
	.soldOut{
		background: url("<c:url value='/resources/adminImages/soldOut.png'/>") no-repeat center center;
	}
	.chanceDiv{
		display: none; position: absolute; background-color: #FCFCFC; width: 70px; border: 1px solid #f8f9fa; cursor:pointer;
	}
	.chances{
		background-color: #EAEAEA; text-align: center;
	}
	.chances:hover{
		background-color: #f8f9fa;
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
	#kakaoPay{
		
	}
	#kakaoPay:hover{
		cursor: pointer;
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
	.cursor{
		cursor: pointer;
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
	#infoWrapper{
		width: 100%;
		margin: auto;
		margin-top: 15px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		calendar();
		$("#addFile").on('click', function(){//파일 추가 이벤트
			$("#none").empty();
			$("#none").append("<input type='file' id='newFile' name='file' onchange='moveFile(this);'>");
			$("#newFile").click();
		});
		$("body").click(function(event) {//바디에 이벤트주기
			//console.log(event.pageX,event.pageY);//마우스 위치 좌표 확인
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
		var maxDivNum=3;
		var nowNum=1;//사용자 입력 정보 창 이동
		$("#formInfo").hide();
		$("#formInfo2").hide();
		$("#preview").hide();
		$("#leftBtn").on('click', function() {
			if(nowNum==1){
				$("#infoWrapper .form-box").eq(0).hide();
				$("#infoWrapper .form-box").eq(1).hide();
				$("#infoWrapper .form-box").eq(2).show();
				nowNum=maxDivNum;
			}else if(nowNum==2){
				$("#infoWrapper .form-box").eq(0).show();
				$("#infoWrapper .form-box").eq(1).hide();
				$("#infoWrapper .form-box").eq(2).hide();
				nowNum--;
			}else if(nowNum==3){
				$("#infoWrapper .form-box").eq(0).hide();
				$("#infoWrapper .form-box").eq(1).show();
				$("#infoWrapper .form-box").eq(2).hide();
				nowNum--;
			}
		});
		$("#rightBtn").on('click', function() {
			if(nowNum==1){
				$("#infoWrapper .form-box").eq(0).hide();
				$("#infoWrapper .form-box").eq(1).show();
				$("#infoWrapper .form-box").eq(2).hide();
				nowNum++;
			}else if(nowNum==2){
				$("#infoWrapper .form-box").eq(0).hide();
				$("#infoWrapper .form-box").eq(1).hide();
				$("#infoWrapper .form-box").eq(2).show();
				nowNum++;
			}else if(nowNum==3){
				$("#infoWrapper .form-box").eq(0).show();
				$("#infoWrapper .form-box").eq(1).hide();
				$("#infoWrapper .form-box").eq(2).hide();
				nowNum=1;
			}			
		});
		$("#kakaoPay").on('click', function(){//결제 버튼을 클릭하면
			if(orderedId.length==0){//결제목록이 없을경우
				$("#infoWrapper .form-box").eq(0).show();
				$("#infoWrapper .form-box").eq(1).hide();
				$("#infoWrapper .form-box").eq(2).hide();
				nowNum=1;
				const marginleft=parseInt($("#wrap").css("margin-left").replace("px",""));
				const x=$("#wrap").width()/2;
				const y=$("#wrap").height()/2;
				const x1=x+marginleft;
				$("#speechBubble1").offset({top: y});
				$("#speechBubble1").offset({left: x1});
				$('#speechBubble1').tooltip('show');
				return;
			};
			if($("#preview").attr("src")==""){
				$("#infoWrapper .form-box").eq(0).hide();
				$("#infoWrapper .form-box").eq(1).show();
				$("#infoWrapper .form-box").eq(2).hide();
				nowNum=2;
				const marginleft=parseInt($("#wrap").css("margin-left").replace("px",""));
				const x=$("#wrap").width()/2;
				const x1=x+marginleft;
				const y=$("#addFile").offset().top;
				$("#speechBubble2").offset({left: x1});
				$("#speechBubble2").offset({top: y});
				$('#speechBubble2').tooltip('show');
				
				return;
			}	
			if($("#company").val()=="" || $("#url").val()==""){//에러메시지 출력sdfaaasadf
				$("#infoWrapper .form-box").eq(0).hide();
				$("#infoWrapper .form-box").eq(1).hide();
				$("#infoWrapper .form-box").eq(2).show();
				nowNum=3;
				const marginleft=parseInt($("#wrap").css("margin-left").replace("px",""));
				const x=$("#wrap").width()/2;
				const y=$("#formInfo").offset().top;
				const y1=$("#formInfo").height()/2;
				const x1=x+marginleft;
				$("#speechBubble3").offset({left: x1});
				$("#speechBubble3").offset({top: y+y1});
				$('#speechBubble3').tooltip('show');
				return;
			}		
			//카카오페이결제
			const cid="TC0ONETIME";
			const partner_order_id="partner_order_id";
			const partner_user_id="partner_user_id";			
			const item_name="Planit광고";
			const quantity=$("input[name='order']").length;
			const total_amount=$("input[name='ad_price']").val();
			const vat_amount=$("input[name='ad_price']").val()/10;
			const tax_free_amount="0";
			const approval_url="http://192.168.0.21:9090/planit/adminAdKakaoPayApproval";
			const fail_url="http://192.168.0.21:9090/planit/adminAdKakaoPayFail";
			const cancel_url="http://192.168.0.21:9090/planit/adminAdKakaoPayCancel";
			$.getJSON("<c:url value='/adminAdKakaoPay'/>",{cid:cid, partner_order_id:partner_order_id, partner_user_id:partner_user_id, item_name:item_name, quantity:quantity, total_amount:total_amount, vat_amount:vat_amount, tax_free_amount:tax_free_amount, approval_url:approval_url, fail_url:fail_url, cancel_url:cancel_url} ,
				function(data) {
					if(data!=null){
						$("input[name='ad_tid']").val(data.tid);
						$("#modalSrc").html('<iframe style="border: 0px; " src="' + data.next_redirect_pc_url + '" width="465px" height="500px"></iframe>');
						$("#clickMe").click();
					}
			});
			return;
		});
		
		$('.speechBubble').on('shown.bs.tooltip', function () {//툴팁 지연시간 설정
			setTimeout(function() { 
				$('.speechBubble').tooltip('hide');
			}, 1500);
		});
	});	
	function moveFile(name){//이미지 파일 미리보기
		$("#file").empty();
		$("#file").append($("#newFile"));//파일 Form으로 이동
		const fileList=name.files;
		const reader=new FileReader();//파일리더 객체 생성
		reader.readAsDataURL(fileList[0]);//파일 읽기
		reader.onload=function(){
			const tempImage=new Image();//이미지 객체 생성
			tempImage.src=reader.result;//url 주입
			tempImage.onload=function(){
				const canvas=document.createElement('canvas');//리사이즈를 위해 캔버스 객체 생성
				const canvasContext=canvas.getContext("2d");
				const width=canvas.width=1000;//캔버스 크기 설정
				const height=canvas.height=400;
				canvasContext.drawImage(this, 0, 0, width, height);//캔버스에 이미지 그리기
				const dataURL=canvas.toDataURL("image/jpeg");//이미지를 url로 변환
				$("#preview").attr("src", dataURL);
				$("#preview").attr("alt", fileList[0].name);
				$("#imageInfo").text(fileList[0].name);
				$("#preview").show();
			};
		};		
	};
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
		$("#form").append("<input id='" + id + "order' name='order' type='hidden' value='" + chanceDate + "'>");
		$("#form").append("<input id='" + id + "orderDate' name='orderDate' type='hidden' value='" + todayYear + "-" + todayMonth + "-" + day + "'>");
		$("#cart").append("<div id='" + id + "cart'>" + todayYear + "-" + todayMonth + "-" + day + " : " + chance + " <a href='javascript:deleteOrder(\"" + id + "\","+ todayMonth +")'><img src='<c:url value='/resources/adminImages/delete.png'/>'/></a>"+"</div>");
		$("#chanceDiv").hide();
		$("#"+id).addClass('ordered');
		$("#"+id).removeClass('hover');
		$("#"+id).text("");
		orderedId.push(id+todayMonth);
		$("#cartMsg").hide();
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
		if(orderedId.length==0){
			$("#cartMsg").show();
			$("#price").hide();
		};
		getPrice();
	}
	function getPrice(){//가격 계산
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
	    if(orderedId.length!=0){
			$("#price").show();
		};
	    $("#price").html("<br><span class=''>결제 금액 : " + price + "&#8361;</span><br><br>");
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
						$("#"+i+"do").removeClass('soldOut');
						$("#"+i+"do").text("");
					}
				}else if(todayMonth==realToday.getMonth()+1 && isNextMonth==false){
					for(var i=1;i<=todayDate;i++){
						$("#"+i+"do").addClass('cant');
						$("#"+i+"do").removeClass('hover');
						$("#"+i+"do").removeClass('soldOut');
						$("#"+i+"do").text("");
					}
				}
			}else{
				console.log("DB에서 데이터를 받아오지 못함");
			}
		});
	}    
</script>
<style type="text/css">
.breadcrumb_area .bg-ad {
  background: url("<c:url value='/resources/adminImages/graphs.jpg'/>") no-repeat scroll center 0/cover;
  opacity: 0.50;
  z-index: -1;
}	
</style>
<div class="wrapper">
<header>
<section class="breadcrumb_area">
	<div class="overlay bg-ad" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">광고 신청</h2>
		</div>
	</div>
</section>
</header>
<section id="containerDiv" class="container">
	<article class="formWrapper">		
		<div id="calendar" class="calendarWrapper" ></div>
		<input type="hidden" id="tempId">
		<div id="infoWrapper" class="stick">
			<div id="cartInfo" class="form-box">
				<br><div id="cart">주문 현황</div>
				<p id="cartMsg"><br>광고할 날짜를 클릭해 주문해주세요.</p><br>
				<div id="price"></div>
			</div>
			<form id="form" method="post" action="<c:url value="/adminAdRequestForm"/>" enctype="multipart/form-data">
				<input type="hidden" name="mem_id" value="${mem_id }">
				<input type="hidden" name="ad_price" value="">
				<input type="hidden" name="ad_payment" value="">
				<input type="hidden" name="ad_tid" value="">
				<div id="file" style="display: none;"></div>
				<div id="formInfo2" class="form-box">
					<br><p>광고 이미지</p><br>
					<img id="preview" src="" alt=""><br><br>
					<span id="imageInfo">이미지를 추가해주세요.<br>(1000 * 400)</span><br><br>
					<img id="addFile" class="cursor" alt="이미지추가" src="<c:url value='/resources/adminImages/paper-clip.png'/>"><br><br>					
				</div>
				<div id="formInfo" class="form-box">
					<div id="ordersDiv"></div><br>	
					<span>주문 정보</span><br><br>
					<input class="form-control" type="text" name="ad_company" id="company" placeholder="회사 이름"><br><br>
					<input class="form-control" type="url" name="ad_url" id="url" placeholder="연결 주소"><br><br>
					<img id="kakaoPay" alt="카카오페이" src="<c:url value='/resources/adminImages/payment_icon_yellow_medium.png'/>"><br><br>
				</div>				
			</form>
			<div class="arrowBox">
				<img id="leftBtn" class="cursor" alt="이전 정보" src="<c:url value='/resources/adminImages/left-arrow.png'/>">
				<img id="rightBtn" class="cursor" alt="다음 정보" src="<c:url value='/resources/adminImages/right-arrow.png'/>">
			</div>			
		</div>
		<div id="chanceDiv" class="chanceDiv"></div>
		<div id="none" style="display: none;"></div>
	</article>
	<!-- 모달 -->
	<input id="clickMe" type="hidden" class="btn btn-primary" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#exampleModal">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				</div>
				<div class="modal-body" id="modalSrc">
					
				</div>
			</div>
		</div>
	</div>
	<div id="speechBubble1" class="speechBubble" style="position: absolute;"data-toggle="tooltip" data-html="true" title="주문할 날짜를 클릭해 주세요"></div>
	<div id="speechBubble2" class="speechBubble" style="position: absolute;"data-toggle="tooltip" data-html="true" title="이미지를 첨부해 주세요"></div>
	<div id="speechBubble3" class="speechBubble" style="position: absolute;"data-toggle="tooltip" data-html="true" title="주문정보를 입력해 주세요"></div>
</section>
<footer>
</footer>
</div>