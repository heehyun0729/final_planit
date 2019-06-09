<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"	crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
</head>
<style>
	.alert {
		height: 20px;
		line-height: 20px;
		padding: 0px;
	}
	.chart {
		position: relative;
		margin: auto;
		height: 400px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var refunded=1;
		var length=${fn:length(getAdInfoInfo)};
		<c:forEach items="${getAdInfoInfo}" var ="vo">
			if("${vo.adInfo_status}"==4 || "${vo.adInfo_status}"==3){
				refunded++;
			};
		</c:forEach>
		if(refunded>1){
			$("#allRefundRequestBtn").remove();//부분환불 되었거나 요청이 있었을시 일괄 환불 요청 버튼 삭제
		}
		var ctx = $("#myChart");//차트
		var date=[];
		var hit=[];
		var click=[];
		<c:forEach items="${getAdInfoInfo}" var ="vo">
			date.push("${vo.adInfo_date}");
			hit.push("${vo.adInfo_hit}");
			click.push("${vo.adInfo_click}");
		</c:forEach>
		
		var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: date,
		        datasets: [
		        	{
			            label: '# 조회 수',
			            data: hit,
			            fill: false,
			            borderColor: [
			                'rgba(54, 162, 235, 1)'
			            ],
			            borderWidth: 2
			        },
			        {
			            label: '# 클릭 수',
			            data: click,
			            backgroundColor: [
			                'rgba(75, 192, 192, 0.2)'
			            ],
			            borderColor: [
			                'rgba(75, 192, 192, 1)'
			            ],
			            borderWidth: 2
		       		}
			    ]
		    },
		    options: {
		    	maintainAspectRatio: false,
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero: true
		                }
		            }]
		        }
		    }
		});
	});		
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-auto text-center">
				<div class="alert alert-secondary"><span class="">번호</span></div>
				<div>${getAdInfo.ad_num }</div><br>
				<div class="alert alert-secondary"><span class="">회사명</span></div>
				<div>${getAdInfo.ad_company }</div><br>
				<div class="alert alert-secondary"><span class="">신청일</span></div>
				<div>${getAdInfo.ad_requestDate }</div><br>
				<div class="alert alert-secondary"><span class="">총 결제금액</span></div>
				<div><fmt:formatNumber value="${getAdInfo.ad_price }" pattern="#,###" />&#8361;</div><br>
				<div class="alert alert-secondary"><span class="">결제 번호</span></div>
				<div>${getAdInfo.ad_tid }</div><br>
			</div>
			<div class="col-sm-auto text-center">
				<div class="alert alert-secondary"><span class="">신청자 ID</span></div>
				<div>${getAdInfo.mem_id }</div><br>
				<div class="alert alert-secondary"><span class="">URL</span></div>
				<div>${getAdInfo.ad_url }</div><br>
				<div class="alert alert-secondary"><span class="">결재일</span></div>
				<c:choose>
					<c:when test="${getAdInfo.ad_approveDate!=null }">
						<div>${getAdInfo.ad_approveDate }</div><br>
					</c:when>
					<c:otherwise>
						<div>X</div><br>
					</c:otherwise>
				</c:choose>
				<div class="alert alert-secondary"><span class="">결제 수단</span></div>
				<div>${getAdInfo.ad_payment }</div><br>
				<div class="alert alert-secondary"><span class="">진행 상황</span></div>
				<c:choose>
					<c:when test="${getAdInfo.ad_progress=='0' }">
						<div>승인 대기중</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='1' }">
						<div>승인됨</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='2' }">
						<div>반려됨</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='3' }">
						<div>환불 요청됨</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='4' }">
						<div>부분 환불됨</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='5' }">
						<div>환불 완료됨</div><br>
					</c:when>
					<c:otherwise>
						<div>X</div><br>
					</c:otherwise>
				</c:choose>	
			</div>
			<div class="col text-center refundRequest-box">
				<div class="alert alert-secondary"><span>세부정보</span></div><br>
				<c:forEach var="vo" items="${getAdInfoInfo}">
					<div>${vo.adInfo_date } - ${vo.adInfo_chance }% - <fmt:formatNumber value="${vo.adInfo_price }" pattern="#,###" />&#8361;
						<c:choose>
						 	<c:when test="${vo.adInfo_status=='4' }">
						 		<span class="badge badge-secondary">환불 완료</span>
						 	</c:when>
						 	<c:when test="${vo.adInfo_status=='3' }">
						 		<span class="badge badge-info">환불 요청됨</span>
						 	</c:when>
						 	<c:otherwise>
						 		<a href="<c:url value='/requestRefundPartAd?ad_num=${vo.ad_num }&adInfo_num=${vo.adInfo_num }'/>"><input type="hidden" value="${vo.adInfo_num }"><span class="badge badge-warning">환불 요청</span><input type="hidden" value="${vo.adInfo_price }"></a>
						 	</c:otherwise>
						 </c:choose>
					</div><br>
				</c:forEach>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col text-center">
				<div class="col-sm-auto text-center">
					<div class="alert alert-secondary"><span>광고 이미지</span></div>
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					  	<c:forEach var="i" items="${getAdInfoImage }" varStatus="status">
						    <c:choose>
							    <c:when test="${status.first }">
							    	<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							    </c:when>
							    <c:otherwise>
							    	<li data-target="#carouselExampleIndicators" data-slide-to="${status.index }"></li>
							    </c:otherwise>
						    </c:choose>
					    </c:forEach>
					  </ol>
					  <div class="carousel-inner">
						<c:forEach var="vo" items="${getAdInfoImage }" varStatus="status">
							<c:choose>
						 		<c:when test="${status.first }">
							    	<div class="carousel-item active">
							     		<img src="<c:url value='/resources/adImage/${vo.adImg_saveImg }'/>" width="1000" height="400" class="d-block w-100" alt="광고 이미지">
							    		<div class="carousel-caption d-none d-md-block">
								        	<c:forEach var="getInfo" items="${getAdInfoInfo }" begin="${status.index }" end="${status.index }">
								        		<h5>${getInfo.adInfo_date}</h5>
								        	</c:forEach>
								        </div>
							    	</div>
						 		</c:when>
							 	<c:otherwise>
								    <div class="carousel-item">
								    	<img src="<c:url value='/resources/adImage/${vo.adImg_saveImg }'/>" width="1000" height="400" class="d-block w-100" alt="광고 이미지">
								    	<div class="carousel-caption d-none d-md-block">
								        	<c:forEach var="getInfo" items="${getAdInfoInfo }" begin="${status.index }" end="${status.index }">
								        		<h5>${getInfo.adInfo_date}</h5>
								        	</c:forEach>
								        </div>
								    </div>
							 	</c:otherwise>
							</c:choose>
						</c:forEach>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
					<br>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="chart">
					<canvas id="myChart" width="100" height="100"></canvas>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col d-flex justify-content-center">
				<br>
				<a id="allRefundRequestBtn" class="btn btn-info" href="<c:url value='/requestRefundAllAd?ad_num=${getAdInfo.ad_num }'/>">일괄 환불 요청</a>
			</div>
		</div>
	</div>
</body>
</html>