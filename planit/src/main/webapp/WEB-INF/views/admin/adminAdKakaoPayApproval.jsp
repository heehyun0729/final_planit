<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		//카카오페이결제
		const cid="TC0ONETIME";
		const tid=window.parent.$("input[name='ad_tid']").val();
		const partner_order_id="partner_order_id";
		const partner_user_id="partner_user_id";
		const pg_token=$("#pg_token").val();
		$.getJSON("<c:url value='/adminAdKakaoPayApprovalOk'/>",{cid:cid, tid:tid, partner_order_id:partner_order_id, partner_user_id:partner_user_id, pg_token:pg_token} ,
			function(data) {
				$('#myModal').modal('hide');
				window.parent.$("input[name='ad_payment']").val("카카오 페이");
				window.parent.$("form").submit();
		});
	});
</script>
<div>
	<input type="hidden" id="pg_token" value="${param.pg_token }">
</div>