<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<title>쪽지상세보기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planner.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planList.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planDetail.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/jquery.qtip.css'/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/fullcalendar.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation/rsvnList.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation/rsvnDetail.css'/>">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/linericon/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/nice-select/css/nice-select.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/responsive.css'/>">

<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-ui.min.js'/>"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>

function reSend(sendMemId){
		location.href='${pageContext.request.contextPath}/msgSendForm?id='+sendMemId;
}
function detailClose() {
	opener.parent.location.reload();
	window.close();
}

</script>
</head>
<body>
<h1>쪽지 상세</h1>
<table class="table">
	<tr>
		<th>${type=="SEND" ? "받은사람" : "보낸사람"}</th>
		<th>보낸시간</th>
		<th>쪽지내용</th>
	</tr>
	<tr>
		<td>${type=="SEND" ? vo.receiveMemId : vo.sendMemId}</td>
		<td>${vo.msgWdate}</td>
		<td>${vo.msgContent}</td>
	</tr>
</table>
<br />
<c:if test="${type=='RECEIVE'}">
<a href="#"	style="margin-left: 250px"onclick="reSend('${vo.sendMemId}')"><i class="fas fa-reply" style="color: #339af0;">답장하기</i></a>
</c:if>
<a href="#"	style="margin-left: 100px" onclick="detailClose()"><i class="fas fa-times" style="color: #339af0;">취소</i></a>
</body>
</html>