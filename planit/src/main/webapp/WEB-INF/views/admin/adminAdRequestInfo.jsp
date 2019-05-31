<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
	.requestBox{
		position: absolute;
		background: #1E90FF;
		left: 1300px;
		top: 320px;
		width: 200px;
		height: 50px;
		box-shadow: 0 3px 6px 0px rgba(0,0,0,0.16), 3px 1px 6px 0px rgba(0,0,0,0.23);
		display: flex;
		align-items: center;
		justify-content: center;
		cursor: pointer;
		font-size: 1.3em;
		font-weight: bold;
		color: white;
	}
	.go{
		
	}
	#headerWrapper{
		width: 100%;
		height: 300px;
		overflow: hidden;
	}
	#contentWrapper{
		width: 100%;
		height: 400px;
	}
	#footerWrapper{
		width: 100%;
		height: 85px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.back{
		background: url("<c:url value='/resources/adminImages/graphs.jpg'/>") no-repeat center center;
		width: 100%;
		height: 100%;
		transition: 0.3s;
	}
	.back:hover{
		width: 105%;
		height: 105%;
	}	
	.stick{
		width: 100%;
		height: 400px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.box{
		width: 100%;
		height: 100%;
		transition: 0.3s;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	.box:hover{
		width: 110%;
		height: 110%;
	}
	.title-box{
		background: #59DA50;
		border-top-left-radius: 25px;
		border-top-right-radius: 25px;
		margin: 50px auto;
		margin-bottom: 0px;
		width: 285px;
		height: 50px;
		text-align: center;
		cursor: default;
		font-size: 1.2em;
		font-weight: bold;
		color: white;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.content-box{
		background: #E9FFE0;
		margin: 50px auto;
		margin-top: 0px;
		width: 285px;
		height: 285px;
		text-align: left;
		cursor: default;
		color: black;
		border-bottom-left-radius: 15px;
		border-bottom-right-radius: 15px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".go").on("click", function(){
			$(location).prop("href","<c:url value='/adminAdRequestForm'/>");
		});
	});
</script>
</head>
<body>
<div>
<header>
	<div id="headerWrapper">
		<div class="back">
			<div id="requestAd" class="requestBox go"><span>광고신청하기</span></div>
		</div>
	</div>
</header>
<section>	
	<article>
		<div id="contentWrapper">
			<div class="stick">
				<div class="box">
					<div class="title-box">
						<span>광고 신청</span>
					</div>
					<div class="content-box">
						<p>최소 7일 이후의 광고를 신청합니다.</p>
					</div>
				</div>
				<div>
					<img alt='다음 단계' class='cursor' src='<c:url value='/resources/adminImages/right-arrow.png'/>'>
				</div>
				<div class="box">
					<div class="title-box">
						<span>광고 심의</span>
					</div>
					<div class="content-box">
						aa-aa
					</div>
				</div>
				<div>
					<img alt='다음 단계' class='cursor' src='<c:url value='/resources/adminImages/right-arrow.png'/>'>
				</div>
				<div class="box">
					<div class="title-box">
						<span>광고 게재</span>
					</div>
					<div class="content-box">
						aa-aa
					</div>
				</div>
			</div>
		</div>
	</article>
</section>
<footer>
	<div id="footerWrapper">
	</div>
</footer>
</div>
</body>