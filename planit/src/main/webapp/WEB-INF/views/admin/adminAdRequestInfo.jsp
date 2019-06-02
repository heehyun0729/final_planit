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
		position: relative;
		background: #1E90FF;
		left: 1000px;
		top: 100px;
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
	.displayFlex{
		width: 100%;
		height: 500px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.box{
		width: 100%;
		height: 100%;
		transition: 0.3s;
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
		cursor: default;
		color: black;
		border-bottom-left-radius: 15px;
		border-bottom-right-radius: 15px;
		display: flex;
		align-items: center;
		justify-content: center;
		line-height: 50px;
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
			<div class="displayFlex">
				<div class="box">
					<div class="title-box">
						<span>광고 신청</span>
					</div>
					<div class="content-box">
						<ul>
							<li>7일 이후의 광고를 신청합니다.</li>
							<li>확률은 10%단위로 신청합니다.</li>
							<li>이미지 크기는 100*500입니다.</li>
						</ul>
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
						<ul>
							<li>불건전 내용 여부를 확인합니다.</li>
							<li>심의에는 하루가 소요됩니다.</li>
						</ul>
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
						<ul>
							<li>신청하신 날짜에 게재됩니다.</li>
							<li>광고를 관리할 수 있습니다.</li>
						</ul>
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