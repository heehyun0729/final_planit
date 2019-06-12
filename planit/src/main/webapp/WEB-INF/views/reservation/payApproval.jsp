<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
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
	<h1>결제완료</h1>
	<span>확인 버튼을 눌러 예약을 완료해주세요.</span>
	<input type = "button" value = "확인" onclick = "javascript:rsvnComplete()">
</div>
</body>
</html>