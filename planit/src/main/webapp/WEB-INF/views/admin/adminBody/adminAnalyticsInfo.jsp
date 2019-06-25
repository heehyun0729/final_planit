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
		$("#downloadMsg").hide();
		$("#date1").datepicker({
			dateFormat: "yy-mm-dd",
			maxDate: "+0M"
		});
		$("#date2").datepicker({
			dateFormat: "yy-mm-dd",
			maxDate: "+0M"
		});
		$("#date1").on("change", function(){
			$("#date2").datepicker("option", "minDate", $("#date1").val());
			if($("#date2").val()!=""){
				$("#infoMsg").hide();
				getProfit();
				$("#downloadMsg").show();
			}
		});
		$("#date2").on("change", function(){
			$("#date1").datepicker("option", "maxDate", $("#date2").val());
			if($("#date1").val()!=""){
				$("#infoMsg").hide();
				getProfit();
				$("#downloadMsg").show();
			}
		});
		$("#downloadMsg").on("click", function(){
			$(location).attr("href", "<c:url value='/adminAnalytics/profitInfoDownload?stringDays="+days.toString()+"&stringAdProfit="+adProfit.toString()+"&stringSellProfit="+sellProfit.toString()+"&stringTotalProfit="+totalProfit.toString()+"&mem_stat="+${mem_stat}+"'/>");
			//$.getJSON("<c:url value='/adminAnalytics/profitInfoDownload'/>", {mem_stat:${mem_stat}, stringDays:days.toString(), stringAdProfit:adProfit.toString(), stringSellProfit:sellProfit.toString(), stringTotalProfit:totalProfit.toString()}, function(data) {
			//	if(data!=null){
			//		alert(data.code);
			//	}
			//});
		});
	});
	var days=[];
	var adProfit=[];
	var sellProfit=[];
	var totalProfit=[];
	<c:if test="${mem_stat==0 }">
		function getProfit(){
			let date1=new Date($("#date1").val());
			let date2=new Date($("#date2").val());
			let day=Math.ceil((date2-date1)/24/60/60/1000);
			var getDays=new Date($("#date1").val());
			for(var i=1;i<day+2;i++){//날짜
				let todayYear=getDays.getFullYear();//년
				let todayMonth=getDays.getMonth()+1;//월
				if(todayMonth.toString().length==1){
					todayMonth="0"+todayMonth;
				}
				let todayDate=getDays.getDate();//일
				if(todayDate.toString().length==1){
					todayDate="0"+todayDate;
				}
				const date=todayYear + "-" + todayMonth + "-" + todayDate;
				getDays.setDate(getDays.getDate()+1);
				days.push(date);
			}
			var ctx1 = $("#profitChart");
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
		function getProfit(){
			let date1=new Date($("#date1").val());
			let date2=new Date($("#date2").val());
			let day=Math.ceil((date2-date1)/24/60/60/1000);
			let days=[];
			var getDays=new Date($("#date1").val());
			for(var i=1;i<day+2;i++){//날짜
				let todayYear=getDays.getFullYear();//년
				let todayMonth=getDays.getMonth()+1;//월
				if(todayMonth.toString().length==1){
					todayMonth="0"+todayMonth;
				}
				let todayDate=getDays.getDate();//일
				if(todayDate.toString().length==1){
					todayDate="0"+todayDate;
				}
				const date=todayYear + "-" + todayMonth + "-" + todayDate;
				getDays.setDate(getDays.getDate()+1);
				days.push(date);
			}
			var sellProfit=[];
			var ctx1 = $("#profitChart");
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
</script>
<div class="container mt-5">
	<div class="row mt-5">
		<div class="col">
			<div class="card h-100 w-100">
				<h4 class="card-header"><span class="fas fa-file-invoice-dollar mr-3"></span>수익 조회</h4>
				<div class="card-body">
					<div class="container">
						<div class="row mb-3">
							<div class="col col d-flex justify-content-start align-items-center">
								<div class="card d-flex justify-content-start align-items-center w-100">
									<div class="card-body text-center">
										<div class="row">
											<div class="col mr-4">
												<div class="input-group flex-nowrap">
													<div class="input-group-prepend">
														<span class="input-group-text" id="addon-wrapping"><i class="fas fa-calendar-day"></i></span>
													</div>
													<input type="text" class="form-control" aria-label="date1" aria-describedby="addon-wrapping" id="date1" placeholder="시작일">
												</div>
											</div>
											<div class="col">
												<div class="input-group flex-nowrap">
													<div class="input-group-prepend">
														<span class="input-group-text" id="addon-wrapping"><i class="fas fa-calendar-day"></i></span>
													</div>
													<input type="text" class="form-control" aria-label="date2" aria-describedby="addon-wrapping" id="date2" placeholder="종료일">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row  mt-3">
							<div class="col">
								<div class="card">
									<div class="card-body text-center">
										<div class="chart">
											<h6 id="infoMsg">조회할 일자를 선택해 주세요.</h6>
											<canvas id="profitChart" width="100" height="500"></canvas>
										</div>
									</div>
								</div>
								<a href="#" id="downloadMsg" class="float-right"><p class="fas fa-download">다운로드</p></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>