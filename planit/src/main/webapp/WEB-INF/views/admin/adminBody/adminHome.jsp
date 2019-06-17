<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(document).ready(function(){
		Chart.pluginService.register({
			beforeDraw: function (chart) {
				if (chart.config.options.elements.center) {
			        var ctx = chart.chart.ctx;
			        var centerConfig = chart.config.options.elements.center;
			      	var fontStyle = centerConfig.fontStyle || 'Arial';
					var txt = centerConfig.text;
			        var color = centerConfig.color || '#000';
			        var sidePadding = centerConfig.sidePadding || 20;
			        var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
			        ctx.font = "30px " + fontStyle;
			        var stringWidth = ctx.measureText(txt).width;
			        var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;
			        var widthRatio = elementWidth / stringWidth;
			        var newFontSize = Math.floor(30 * widthRatio);
			        var elementHeight = (chart.innerRadius * 2);
			        var fontSizeToUse = Math.min(newFontSize, elementHeight);
			        ctx.textAlign = 'center';
			        ctx.textBaseline = 'middle';
			        var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
			        var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
			        ctx.font = fontSizeToUse+"px " + fontStyle;
			        ctx.fillStyle = color;
			        ctx.fillText(txt, centerX, centerY);
				}
			}
		});
		<c:if test="${mem_stat==0 }">
			todayAdChart();
			monthProfitChart();
			monthAdChart();
		</c:if>
		<c:if test="${mem_stat==1 }">
			todaySellerSellChart();
			monthSellerProfitChart();
		</c:if>
		
		<c:if test="${mem_stat==0 }">
			function todayAdChart(){//금일 광고율 차트
				var ctx = $("#todayAdChart");
				var data = {
					    datasets: [{
					        data: [${map.chance},(100-${map.chance})],
					        backgroundColor: ['rgba(95, 0, 255, 0.6)','rgba(0, 0, 0, 0.2)'],
					        borderWidth: 0
					    }]
					};
				var todayAdChart = new Chart(ctx, {
				    type: 'doughnut',
				    data: data,
				    options: {
				    	maintainAspectRatio: false,
				    	tooltips: {enabled: false},
				    	hover: {mode: null},
				    	elements: {
							center: {
								text: '${map.chance}%'
							}
						},
						plugins:{
				    		labels: [
				    		    {
				    		      render: 'label'
				    		    }
				    		  ]
				    	}
				    }
				});
			}
			function monthProfitChart(){//최근 한 달 차트
				var ctx1 = $("#monthProfitChart");
				var days=[];
				var today=new Date();
				var todayYear=today.getFullYear();//년
				var todayMonth=today.getMonth()+1;//월
				var todayDate=today.getDate();//일
				var lastDate=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
				if(((todayYear.value%4==0 && todayYear.value%100!=0) || todayYear.value%400==0)&& todayMonth.value==2){//윤년 2월, 29일
					lastDate[1]=29;
				}
				var today1=new Date();
				today1.setDate(today.getDate()-lastDate[todayMonth]);
				for(var i=1;i<lastDate[todayMonth];i++){//한달 전 날짜 보내기
					today1.setDate(today1.getDate()+1);
					todayYear=today1.getFullYear();//년
					todayMonth=today1.getMonth()+1;//월
					todayDate=today1.getDate();//일
					const date=todayYear + "-" + todayMonth + "-" + todayDate;
					days.push(date);
				}
				var adProfit=[];
				var sellProfit=[];
				var totalProfit=[];
				$.getJSON("<c:url value='/admin/adminAdManagement/getDayAdProfit'/>", {stringDays:days.toString()}, function(data) {
					if(data!=null){
						for(var i=0;i<(data.length/2);i++){//광고수익
							var dayAdProfit=data[i].adProfit;
							adProfit.push(dayAdProfit);
						}
						for(var i=(data.length/2);i<data.length;i++){//예약수익
							var daySellProfit=data[i].sellProfit;
							sellProfit.push(daySellProfit);
						}
						for(var i=0;i<data.length;i++){//총수익
							totalProfit.push(adProfit[i]+sellProfit[i]);
						}
						
						var monthProfitChart = new Chart(ctx1, {
						    type: 'line',
						    data: {
						        labels: days,
						        datasets: [
						        	{
							            label: '# 광고 수익',
							            data: adProfit,
							            fill: false,
							            borderColor: [
							                'rgba(95, 0, 255, 1)'
							            ],
							            borderWidth: 2
							        },
							        {
							            label: '# 판매 수익',
							            data: sellProfit,
							            fill: false,
							            borderColor: [
							                'rgba(75, 192, 192, 1)'
							            ],
							            borderWidth: 2
						       		},
						       		{
							            label: '# 총 수익',
							            data: totalProfit,
							            fill: false,
							            borderColor: [
							                'rgba(29, 219, 22, 1)'
							            ],
							            borderWidth: 2
						       		}
							    ]
						    },
						    options: {
						    	legend: {display: false},
						    	maintainAspectRatio: false,
						        scales: {
						            yAxes: [{
						            	gridLines:{display: false},
						                ticks: {
						                    beginAtZero: true
						                }
						            }],
						            xAxes: [{
						            	gridLines:{display: false},
						                ticks: {
						                    beginAtZero: true
						                }
						            }]
						        }
						    }
						});
					}
				});	
			}
		</c:if>
		
		<c:if test="${mem_stat==1 }">
			function todaySellerSellChart(){//판매자 금일 예약율 차트
				let ctx = $("#todaySellChart");
				let data = {
					    datasets: [{
					        data: [${map.roomRate },(100-${map.roomRate })],
					        backgroundColor: ['rgba(0, 84, 255, 0.6)','rgba(0, 0, 0, 0.2)'],
					        borderWidth: 0
					    }]
					};
				let todaySellChart = new Chart(ctx, {
				    type: 'doughnut',
				    data: data,
				    options: {
				    	maintainAspectRatio: false,
				    	tooltips: {enabled: false},
				    	hover: {mode: null},
				    	elements: {
							center: {
								text: '${map.roomRate }%'
							}
						},
						plugins:{
				    		labels: [
				    		    {
				    		      render: 'label'
				    		    }
				    		  ]
				    	}
				    }
				});
			}
			function monthSellerProfitChart(){//판매자 최근 한 달 차트
				var ctx1 = $("#monthProfitChart");
				var days=[];
				var today=new Date();
				var todayYear=today.getFullYear();//년
				var todayMonth=today.getMonth()+1;//월
				var todayDate=today.getDate();//일
				var lastDate=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
				if(((todayYear.value%4==0 && todayYear.value%100!=0) || todayYear.value%400==0)&& todayMonth.value==2){//윤년 2월, 29일
					lastDate[1]=29;
				}
				var today1=new Date();
				today1.setDate(today.getDate()-lastDate[todayMonth]);
				for(var i=1;i<lastDate[todayMonth];i++){//한달 전 날짜 보내기
					today1.setDate(today1.getDate()+1);
					todayYear=today1.getFullYear();//년
					todayMonth=today1.getMonth()+1;//월
					todayDate=today1.getDate();//일
					const date=todayYear + "-" + todayMonth + "-" + todayDate;
					days.push(date);
				}
				var sellProfit=[];
				$.getJSON("<c:url value='/admin/adminAdManagement/getSellerDayProfit'/>", {stringDays:days.toString(), mem_id:"${mem_id}"}, function(data) {
					if(data!=null){
						for(var i=0;i<data.length;i++){//총수익
							sellProfit.push(data[i].sellProfit);
						}
						var monthProfitChart = new Chart(ctx1, {
						    type: 'line',
						    data: {
						        labels: days,
						        datasets: [
						       		{
							            label: '# 숙박 예약 수익',
							            data: sellProfit,
							            fill: false,
							            borderColor: [
							                'rgba(29, 219, 22, 1)'
							            ],
							            borderWidth: 2
						       		}
							    ]
						    },
						    options: {
						    	legend: {display: false},
						    	maintainAspectRatio: false,
						        scales: {
						            yAxes: [{
						            	gridLines:{display: false},
						                ticks: {
						                    beginAtZero: true
						                }
						            }],
						            xAxes: [{
						            	gridLines:{display: false},
						                ticks: {
						                    beginAtZero: true
						                }
						            }]
						        }
						    }
						});
					}
				});	
			}
		</c:if>
	});
</script>
<div class="container mt-5">
	<div class="row mt-5">
		<div class="col d-flex justify-content-start align-items-center text-center">
			<c:if test="${mem_stat==0 }">
				<!-- 관리자 전용 통계 -->
				<div class="card h-100 w-50 mr-5">
					<h4 class="card-header">금일 광고율</h4>
					<div class="card-body">
						<div class="chart">
							<canvas id="todayAdChart" ></canvas>
						</div>
					</div>
				</div>
			<div class="card h-100 w-50 mr-5">
				<h4 class="card-header">금일 수익</h4>
				<div class="card-body">
					<img src="<c:url value='/resources/adminImages/won.png'/>" width="100" height="100"><br>
					<span><fmt:formatNumber value="${map.adProfit+map.todaySellProfit }" pattern="#,###" />&#8361;</span>
				</div>
			</div>
			<div class="card h-100 w-100">
				<h4 class="card-header">최근 한 달 수익</h4>
				<div class="card-body">
					<div class="chart">
						<canvas id="monthProfitChart" width="100" height="150"></canvas>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${mem_stat==1 }">
				<!-- 판매자 전용 통계 -->
				<div class="card mr-5 w-50 h-100">
					<h4 class="card-header">숙소 예약율/수익</h4>
					<div class="card-body text-center">
						<div class="chart">
							<canvas id="todaySellChart" ></canvas>
						</div>
						<span><fmt:formatNumber value="${map.todaySellProfit }" pattern="#,###" />&#8361;</span>
					</div>
				</div>
				<div class="card h-100 w-100">
					<h4 class="card-header">최근 한 달 수익</h4>
					<div class="card-body">
						<div class="chart">
							<canvas id="monthProfitChart" width="100" height="150"></canvas>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<c:if test="${mem_stat==0 }">
		<!-- 관리자 전용 통계 -->
		<div class="row mt-5">
			<div class="col-auto">
				<div class="card h-100">
					<h4 class="card-header text-left">최근 광고 거래</h4>
					<div class="card-body">
						<div class="container">
							<div class="row ">
								<div class="col text-center">
									<table class="table table-hover ">
										<thead>
										<tr>
											<th scope="col">번호</th><th scope="col">신청자</th><th scope="col">결제금액</th><th scope="col">진행상황</th>
										</tr>
										</thead>
										<tbody>
										<c:choose>
											<c:when test="${map.getRecent5Ad[0]!=null }">
												<c:forEach var="vo" items="${map.getRecent5Ad}">
													<tr>
														<td scope="row">${vo.ad_num }</td>
														<td>${vo.mem_id }</td>
														<td><fmt:formatNumber value="${vo.ad_price}" pattern="#,###" /></td>
														<td>
															<c:choose>
																<c:when test="${vo.ad_progress=='0' }">
																	<div class="badge badge-primary">승인 대기중</div><br>
																</c:when>
																<c:when test="${vo.ad_progress=='1' }">
																	<div class="badge badge-success">승인됨</div><br>
																</c:when>
																<c:when test="${vo.ad_progress=='2' }">
																	<div class="badge badge-danger">반려됨</div><br>
																</c:when>
																<c:when test="${vo.ad_progress=='3' }">
																	<div class="badge badge-warning">환불 요청됨</div><br>
																</c:when>
																<c:when test="${vo.ad_progress=='4' }">
																	<div class="badge badge-secondary">부분 환불됨</div><br>
																</c:when>
																<c:when test="${vo.ad_progress=='5' }">
																	<div class="badge badge-dark">환불 완료됨</div><br>
																</c:when>
																<c:otherwise>
																	<div>X</div><br>
																</c:otherwise>
															</c:choose>	
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td scope="row" colspan="4">최근 거래 내역이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>		
										</tbody>				
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<h4 class="card-header text-left">최근 예약 거래</h4>
					<div class="card-body">
						<div class="container">
							<div class="row ">
								<div class="col text-center">
									<table class="table table-hover ">
										<thead>
										<tr>
											<th scope="col">번호</th><th scope="col">신청자</th><th scope="col">결제금액</th><th scope="col">진행상황</th>
										</tr>
										</thead>
										<tbody>
										<c:choose>
											<c:when test="${map.getRecent5Sell[0]!=null }">
												<c:forEach var="vo" items="${map.getRecent5Sell}" varStatus="status">
													<tr>
														<td scope="row">${vo.rsvnPay_id }</td>
														<c:forEach var="getId" begin="${status.index }" end="${status.index }" items="${map.getRecent5SellId }">
															<td>${getId}</td>
														</c:forEach>
														<td><fmt:formatNumber value="${vo.rsvnPay_total }" pattern="#,###" /></td>
														<td>
															<c:choose>
																<c:when test="${vo.rsvnPay_stat=='0' }">
																	<div class="badge badge-success">예약됨</div><br>
																</c:when>
																<c:when test="${vo.rsvnPay_stat=='1' }">
																	<div class="badge badge-dark">환불됨</div><br>
																</c:when>
																<c:otherwise>
																	<div>X</div><br>
																</c:otherwise>
															</c:choose>	
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td scope="row" colspan="4">최근 거래 내역이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
										</tbody>				
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${mem_stat==1 }">
		<!-- 판매자 전용 통계 -->
		<div class="row mt-5">
			<div class="col">
				<div class="card h-100">
					<h4 class="card-header text-left">최근 예약 거래</h4>
					<div class="card-body">
						<div class="container">
							<div class="row ">
								<div class="col text-center">
									<table class="table table-hover ">
										<thead>
										<tr>
											<th scope="col">번호</th><th scope="col">신청자</th><th scope="col">결제금액</th><th scope="col">진행상황</th><th scope="col">결제일</th>
										</tr>
										</thead>
										<tbody>
										<c:choose>
											<c:when test="${map.getSellerRecent5Sell[0]!=null }">
												<c:forEach var="vo" items="${map.getSellerRecent5Sell}" varStatus="status">
													<tr>
														<td scope="row">${vo.RSVNPAY_ID }</td>
														<td>${vo.MEM_ID}</td>
														<td><fmt:formatNumber value="${vo.RSVNPAY_TOTAL }" pattern="#,###" /></td>
														<td>
															<c:choose>
																<c:when test="${vo.RSVNPAY_STAT=='0' }">
																	<div class="badge badge-success">예약됨</div><br>
																</c:when>
																<c:when test="${vo.RSVNPAY_STAT=='1' }">
																	<div class="badge badge-dark">환불됨</div><br>
																</c:when>
																<c:otherwise>
																	<div>X</div><br>
																</c:otherwise>
															</c:choose>	
														</td>
														<td>${vo.RSVNPAY_DATE }</td>				
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td scope="row" colspan="5">최근 거래 내역이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
										</tbody>				
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</div>