<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
	.flexWrapper{
		width: 1000px;
		height: 600px;
		margin: 180px auto;
	}
	.displayFlex{<!-- 겹칠 가능성 있음 -->
		width: 100%;
		height: 50%;
		margin: 100px auto;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	.infoTitle-box{
		background: #59DA50;
		border-top-left-radius: 25px;
		border-top-right-radius: 25px;
		margin: 50px auto;
		margin-bottom: 0px;
		width: 100%;
		padding-top: 10px;
		padding-bottom: 10px;
		text-align: center;
		cursor: default;
		font-size: 1.2em;
		font-weight: bold;
		color: white;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.infoContent-box{
		background: #E9FFE0;
		margin: 50px auto;
		margin-top: 0px;
		width: 100%;
		height: 70%;
		cursor: default;
		color: black;
		border-bottom-left-radius: 15px;
		border-bottom-right-radius: 15px;
		display: table;
	}
	.table-cell{
		display: table-cell;
		vertical-align: middle;
		text-align: center;
		line-height: 50px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".go").on("click", function(){
			$(location).prop("href","<c:url value='/adminAdRequestForm'/>");
		});
	});
</script>
<div>
<header>
</header>
<section>
	<article class="flexWrapper">
		<div class="displayFlex">
			<div class="infoTitle-box">
				<span>광고 신청이 완료되었습니다</span>
			</div>
			<div class="infoContent-box">
				<div class="table-cell">
					<p>광고 신청 진행사항 및 광고 통계 등 상세사항은 마이페이지 -> 광고 를 참고하세요.</p>
					<p>기타 문의사항은 관리자에게 쪽지로 문의주시기 바랍니다.</p>
				</div>
			</div>
		</div>		
	</article>
</section>
<footer>
</footer>
</div>