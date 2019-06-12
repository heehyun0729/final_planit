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
		
		var ctx = $("#todayAdChart");//금일 광고율 차트
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
				}
		    }
		});
		
		var ctx1 = $("#monthProfitChart");//최근 한 달 차트
		var days=[];
		var today=new Date();
		var todayYear=today.getFullYear();//년
		var todayMonth=today.getMonth()+1;//월
		var todayDate=today.getDate();//일
		var lastDate=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		if(((todayYear.value%4==0 && todayYear.value%100!=0) || todayYear.value%400==0)&& todayMonth.value==2){//윤년 2월, 29일
			lastDate[1]=29;
		}
		for(var i=1;i<lastDate[todayMonth];i++){//한달 전 날짜 보내기
			today.setDate(today.getDate()-1);
			todayYear=today.getFullYear();//년
			todayMonth=today.getMonth()+1;//월
			todayDate=today.getDate();//일
			const date=todayYear + "-" + todayMonth + "-" + todayDate;
			days.push(date);
		}
		var adProfit=[];
		var sellProfit=[50000,70000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		var totalProfit=[];
		$.getJSON("<c:url value='/admin/adminAdManagement/getDayAdProfit'/>", {stringDays:days.toString()}, function(data) {
			if(data!=null){
				for(var i=0;i<data.length;i++){
					var dayAdProfit=data[i].adProfit;
					var daySellProfit=sellProfit[i];
					adProfit.push(dayAdProfit);
					totalProfit.push(dayAdProfit+daySellProfit);
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
	});
</script>
<div class="container mt-5">
	<div class="row mt-5">
		<div class="col">
			<div class="card h-100 w-100">
				<h4 class="card-header"><span class="fas fa-money-check-alt mr-3"></span>수익</h4>
				<div class="card-body">
					<div class="container">
						<div class="row">
							<div class="col col d-flex justify-content-start align-items-center">
								<div class="card mr-5 w-50 h-100">
									<h4 class="card-header">금일 광고율/수익</h4>
									<div class="card-body text-center">
										<div class="chart">
											<canvas id="todayAdChart" ></canvas>
										</div>
										<span><fmt:formatNumber value="${map.adProfit }" pattern="#,###" />&#8361;</span>
									</div>
								</div>
								<div class="card w-50 h-100">
									<h4 class="card-header">금일 예약 건수/수익</h4>
									<div class="card-body text-center">
										<div class="">
											<span>건</span>
										</div>
										<span><fmt:formatNumber value="${map.adProfit }" pattern="#,###" />&#8361;</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row  mt-3">
							<div class="col">
								<div class="card">
									<h4 class="card-header">최근 한 달 수익</h4>
									<div class="card-body text-center">
										<div class="chart">
											<canvas id="monthProfitChart" width="100" height="400"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col">
			<div class="card h-100 w-100">
				<h4 class="card-header"><span class="fas fa-users mr-3"></span>사용자</h4>
				<div class="card-body">
					<div class="container">
						<div class="row">
							<div class="col col d-flex justify-content-start align-items-center">
								<div class="card mr-5 w-40 h-100">
									<h4 class="card-header">성별 비율</h4>
									<div class="card-body text-center">
										<div class="chart">
											<canvas id="usersGender" ></canvas>
										</div>
									</div>
								</div>
								<div class="card mr-5 w-50 h-100">
									<h4 class="card-header">플래너 국가 순위</h4>
									<div class="card-body text-center">
										<div class="chart">
											<canvas id="usersPlanCountry" ></canvas>
										</div>
									</div>
								</div>
								<div class="card w-50 h-100">
									<h4 class="card-header">동행 국가 순위</h4>
									<div class="card-body text-center">
										<div class="chart">
											<canvas id="usersBuddyCountry" ></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col col d-flex justify-content-start align-items-center">
								<div class="card w-100 h-100">
									<h4 class="card-header">생년 비율</h4>
									<div class="card-body text-center">
										<div class="chart">
											<canvas id="usersAge" width="100" height="200"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>