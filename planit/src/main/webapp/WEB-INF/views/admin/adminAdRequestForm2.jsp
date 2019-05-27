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
		$("#startDate").datepicker({
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월",],
			yearSuffix: "년",
			showMonthAfterYear: true,
			dateFormat: "yy-mm-dd",
			showAnim: "fold",
			minDate: "+7d"
		});
		$("#endDate").datepicker({
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월",],
			yearSuffix: "년",
			showMonthAfterYear: true,
			dateFormat: "yy-mm-dd",
			showAnim: "fold",
			minDate: "+7d"
		});
		$("#startDate").on('change', function(){
			getChance();
		});
		$("#endDate").on('change', function(){
			getChance();
		});
		$("#form").on('submit', function(){
			if($("#startDate").val()==""){
				$("#startDateErrMsg").fadeIn(300).delay(1000).fadeOut(300);
				return false;	
			}
			if($("#endDate").val()==""){
				$("#endDateErrMsg").fadeIn(300).delay(1000).fadeOut(300);
				return false;	
			}
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
</script>
</head>
<body>
<div class="wrapper">
<header>
	<h1>광고 신청 폼</h1>
</header>
<section>
	<article>
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