<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript">
	alert("결제 대기시간을 초과하였습니다. 다시 시도해주세요.");
	window.parent.$('#rsvnPayModal').modal('hide');
</script>