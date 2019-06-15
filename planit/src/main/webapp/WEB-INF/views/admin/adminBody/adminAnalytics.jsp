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
		todayAdChart();
		todaySellChart();
		monthProfitChart();
		monthAdChart();
		usersPlanCountry();
		usersBuddyCountry();
		usersGender();
		usersAge();
	});
	
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
	
	function todaySellChart(){//금일 예약율 차트
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
	
	function monthAdChart(){//최근 한 달 광고 클릭율
		let ctx = $("#monthAdChart");
		let days=[];
		let today=new Date();
		let todayYear=today.getFullYear();//년
		let todayMonth=today.getMonth()+1;//월
		let todayDate=today.getDate();//일
		let lastDate=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
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
		let hit=[];
		let click=[];
		$.getJSON("<c:url value='/adminAnalytics/getDayAdInfo'/>", {stringDays:days.toString()}, function(data) {
			if(data!=null){
				for(var i=0;i<(data.length/2);i++){//조회 수
					var getDayAdHit=data[i].getDayAdHit;
					hit.push(getDayAdHit);
				}
				for(var i=(data.length/2);i<data.length;i++){//클릭 수
					var getDayAdClick=data[i].getDayAdClick;
					click.push(getDayAdClick);
				}
				
				var monthAdChart = new Chart(ctx, {
				    type: 'bar',
				    data: {
				        labels: days,
				        datasets: [
				        	{
				        		label: '# 클릭 수',
					            data: click,
					            fill: false,
					            borderColor: [
					                ''
					            ],
					            borderWidth: 2
					        },
					        {
					        	label: '# 조회 수',
					            data: hit,
					            fill: false,
					            borderColor: [
					                'rgba(95, 0, 255, 1)'
					            ],
					            borderWidth: 2,
					            type: 'line'
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
				        },
				        plugins:{
				    		labels: [
				    		    {
				    		      render: 'value'
				    		    }
				    		  ]
				    	}
				    }
				});
			}
		});	
	}
	
	function usersPlanCountry(){//플래너 국가 순위 차트
		var ctx2 = $("#usersPlanCountry");
		var countryList=[];
		var cntList=[];	
		<c:forEach var="i" items="${map.countryList }">
			countryList.push("${i}");
		</c:forEach>
		<c:forEach var="i" items="${map.cntList }">
			cntList.push("${i}");
		</c:forEach>		
		var usersPlanCountrydata = {
			    datasets: [{
			        data: cntList,
			        backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
			        borderWidth: 1
			    }],
				labels: countryList
			};
		var usersPlanCountry = new Chart(ctx2, {
		    type: 'pie',
		    data: usersPlanCountrydata,
		    options: {
		    	maintainAspectRatio: false,
		    	legend: {display: false},
		    	plugins:{
		    		labels: [
		    		    {
		    		      render: 'label',
		    		      position: 'outside'
		    		    },
		    		    {
		    		      render: 'percentage'
		    		    }
		    		  ]
		    	}
		    }
		});
	}
	
	function usersBuddyCountry(){//동행 국가 순위 차트
		let ctx = $("#usersBuddyCountry");
		let countryList=[];
		let cntList=[];
		<c:forEach var="i" items="${map.buddyCountryList }">
			countryList.push("${i}");
		</c:forEach>
		<c:forEach var="i" items="${map.buddyCntList }">
			cntList.push("${i}");
		</c:forEach>
		let usersBuddyCountrydata = {
			    datasets: [{
			        data: cntList,
			        backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
			        borderWidth: 1
			    }],
				labels: countryList
			};
		let usersPlanCountry = new Chart(ctx, {
		    type: 'pie',
		    data: usersBuddyCountrydata,
		    options: {
		    	maintainAspectRatio: false,
		    	legend: {display: false},
		    	plugins:{
		    		labels: [
		    		    {
		    		      render: 'label',
		    		      position: 'outside'
		    		    },
		    		    {
		    		      render: 'percentage'
		    		    }
		    		  ]
		    	}
		    }
		});
	}
	
	function usersGender(){//회원 성별 차트
		let ctx = $("#usersGender");
		let genderList=[];
		let genderCntList=[];
		<c:forEach var="i" items="${map.genderList }">
			genderList.push("${i}");
		</c:forEach>
		<c:forEach var="i" items="${map.genderCntList }">
			genderCntList.push("${i}");
		</c:forEach>
		let usersGenderdata = {
			    datasets: [{
			        data: genderCntList,
			        backgroundColor: [
			        	'rgba(54, 162, 235, 0.2)',
			        	'rgba(255, 99, 132, 0.2)'
		            ],
		            borderColor: [
		            	'rgba(54, 162, 235, 1)',
		            	'rgba(255, 99, 132, 1)'
		            ],
			        borderWidth: 1
			    }],
				labels: genderList
			};
		let usersGender = new Chart(ctx, {
		    type: 'pie',
		    data: usersGenderdata,
		    options: {
		    	maintainAspectRatio: false,
		    	legend: {display: false},
		    	plugins:{
		    		labels: [
		    		    {
		    		      render: 'label',
		    		      position: 'outside'
		    		    },
		    		    {
		    		      render: 'percentage'
		    		    }
		    		  ]
		    	}
		    }
		});
	}
	
	function usersAge(){//회원 생년 분포 차트
		let ctx = $("#usersAge");
		let birthYearList=[];
		let birthYearCntList=[];
		<c:forEach var="i" items="${map.birthYearList }">
			birthYearList.push("${i}");
		</c:forEach>
		<c:forEach var="i" items="${map.birthYearCntList }">
			birthYearCntList.push("${i}");
		</c:forEach>
		let usersbirthYeardata = {
				labels: birthYearList,
				datasets: [{
			        label: '# 년도',
			    	data: birthYearCntList,
			        backgroundColor: [
			        	'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)',
		                'rgba(0, 159, 64, 0.2)',
		                'rgba(163, 45, 171, 0.2)',
		                'rgba(163, 45, 171, 0.2)',
		                'rgba(0, 45, 171, 0.2)',
		                'rgba(175, 145, 171, 0.2)',
		                'rgba(171, 205, 201, 0.2)',
		                'rgba(85, 76, 111, 0.2)'
		            ],
		            borderColor: [
		            	  'rgba(255, 99, 132, 1)',
		                  'rgba(54, 162, 235, 1)',
		                  'rgba(255, 206, 86, 1)',
		                  'rgba(75, 192, 192, 1)',
		                  'rgba(153, 102, 255, 1)',
		                  'rgba(255, 159, 64, 1)',
		                  'rgba(0, 159, 64, 1)',
		                  'rgba(163, 45, 171, 1)',
		                  'rgba(0, 45, 171, 1)',
		                  'rgba(175, 145, 171, 1)',
		                  'rgba(171, 205, 201, 1)',
		                  'rgba(85, 76, 111, 1)'
		            ],
			        borderWidth: 1
			    }],
				
			};
		let usersbirthYear = new Chart(ctx, {
		    type: 'bar',
		    data: usersbirthYeardata,
		    options: {
		    	maintainAspectRatio: false,
		    	legend: {display: false},
		    	scales: {
		            yAxes: [{
		            	gridLines:{display: false},
		                ticks: {
		                    beginAtZero: true
		                }
		            }],
		            xAxes: [{
		            	gridLines:{display: false}
		            }]
		        },
		        plugins:{
		    		labels: [
		    		    {
		    		      render: 'value',
		    		      textMargin: -20
		    		    }
		    		  ]
		    	}
		    }
		});
	}
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
									<h4 class="card-header">숙소 예약율/수익</h4>
									<div class="card-body text-center">
										<div class="chart">
											<canvas id="todaySellChart" ></canvas>
										</div>
										<span><fmt:formatNumber value="${map.todaySellProfit }" pattern="#,###" />&#8361;</span>
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
											<canvas id="monthProfitChart" width="100" height="200"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row  mt-3">
							<div class="col">
								<div class="card">
									<h4 class="card-header">최근 한 달 광고 정보</h4>
									<div class="card-body text-center">
										<div class="chart">
											<canvas id="monthAdChart" width="100" height="200"></canvas>
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
	<div class="row mt-5 mb-5">
		<div class="col">
			<div class="card h-100 w-100">
				<h4 class="card-header"><span class="fas fa-users mr-3"></span>사용자</h4>
				<div class="card-body">
					<div class="container">
						<div class="row">
							<div class="col col d-flex justify-content-start align-items-center">
								<div class="card mr-5 w-50 h-100">
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