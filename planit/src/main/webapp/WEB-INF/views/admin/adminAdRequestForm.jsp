<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
	});
	function getChance(){
		if($("#startDate").val()!="" && $("#endDate").val()!=""){
			$.getJSON("<c:url value='/adminAdGetChance'/>", {startDate:$("#startDate").val(),endDate:$("#endDate").val()}, function(data) {
				const chance=data.chance;
				if(chance!=0){
					$("#chance").empty();
					for(var i=10;i<=chance;i+=10){
						$("#chance").append("<option>" + i + "&percnt;</option>");
					}
					getPrice();
					$("#chance").on('change', function(){
						getPrice();
					});
				}
			});
		}
	}
	function getPrice(){
		const chance=$("#chance").val();
		console.log(chance);
		const startDate=$("#startDate").val();
		const endDate=$("#startDate").val();
		console.log(startDate-endDate);
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
		<form method="post" action="<c:url value="/adminAdRequestForm"/>" enctype="multipart/form-data">
			<input type="hidden" name="id" value="">
			<input type="hidden" name="price" value="">
			<label for="startDate">시작일</label><br><input type="text" name="startDate" id="startDate" readonly="readonly">
			<br><br>
			<label for="endDate">종료일</label><br><input type="text" name="endDate" id="endDate" readonly="readonly">
			<br><br>
			<label for="chance">노출 확률</label>
			<br>
			<select id="chance" name="chance">
				<option>&percnt;</option>
			</select>
			<br><br>
			<label>측정 가격(&#8361;)</label>
			<br>
			<div id="price">시작일과 종료일, 노출 확률을 선택해주세요.</div>
			<br>
			<label for="company">회사 이름</label>
			<br>
			<input type="text" name="company" id="company" placeholder="플랜잇(Planit)">
			<br><br>
			<label for="file">광고 이미지(50*200)</label>
			<br>
			<input type="file" name="file" id="file">
			<br><br>
			<label for="url">연결 주소</label>
			<br>
			<input type="text" name="url" id="url" placeholder="http://www.planit.com">
			<br><br>
			<input type="submit" value="완료">
		</form>
	</article>
</section>
<footer>
	
</footer>
</div>
</body>
</html>