<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/linericon/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/responsive.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">

<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		const tid = window.parent.$("#rsvn_tid").val();
		const pg_token = $("#rsvn_pg_token").val();
		$.ajax({
			url : "<c:url value='/reservation/payApprovalOk'/>",
			method: "post",
			dataType : "json",
			data : {
				tid: tid,
				pg_token: pg_token
			}
		});
	});
	function rsvnComplete() {
		window.parent.$("#rsvnPayModal").modal("hide");
		window.parent.$("form").submit();
	}
</script>
</head>
<body>
<div>
	<input type="hidden" id="rsvn_pg_token" value="${param.pg_token }">
	<div class="site-section">
      <div class="container">
        <div class="row" style = "margin-top: 100px;">
          <div class="col-md-12 text-center">
            <span style = "color: #52C5FD"><i class="fas fa-check-circle fa-7x"></i></span>
            <h1 class = "title_color" style = "margin: 10px 0;">Thank you!</h1>
            <p class="lead mb-5">확인 버튼을 눌러 예약을 완료해주세요.</p>
            <p><input type = "button" class = "genric-btn primary circle" value = "확인" onclick = "javascript:rsvnComplete()"></p>
          </div>
        </div>
      </div>
    </div>
</div>
</body>
</html>