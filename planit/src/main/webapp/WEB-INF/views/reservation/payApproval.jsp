<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		const tid=window.parent.$("#tid").val();
		const pg_token=$("#pg_token").val();
		$.ajax({
			url: "/planit/reservation/payApprovalOk",
			dataType: "json",
			data: {
				item_name: item_name,
				total_amount: total_amount
			},
			success: function(data) {
				if(data.result == 'fail'){
					alert("오류가 발생하였습니다.");
				}else{
					$("#tid").val(data.tid);
					$("#rsvnKakaoPay").html('<iframe style="border: 0px; " src="' + data.next_redirect_pc_url + '" width="500px" height="500px"></iframe>');
					$("#rsvnPayModal").modal("show");
				}
			}
		});
		$.getJSON("<c:url value='/adminAdKakaoPayApprovalOk'/>",{cid:cid, tid:tid, partner_order_id:partner_order_id, partner_user_id:partner_user_id, pg_token:pg_token} ,
			function(data) {
				window.parent.$('#exampleModal').modal('hide');
				window.parent.$("input[name='ad_payment']").val("카카오 페이");
				window.parent.$("form").submit();
		});
	});
</script>
<div>
	<input type="hidden" id="pg_token" value="${param.pg_token }">
</div>