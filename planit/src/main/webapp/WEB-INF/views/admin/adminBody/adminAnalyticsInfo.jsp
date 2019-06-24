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
				
			}
		});
		$("#date2").on("change", function(){
			$("#date1").datepicker("option", "maxDate", $("#date2").val());
			if($("#date1").val()!=""){
				
			}
		});
	});
	
	function getDays(){
		let date1=$("#date1").val();
		let date2=$("#date2").val();
		let days=[];
		//date1 date2 사이 날짜 하나씩 getjson 데이터 받아오기
	}
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
						<div class="row">
							<div class="col col d-flex justify-content-start align-items-center">
								<c:if test="${mem_stat==0 }">
									<div class="card mr-5 w-50 h-100">
										<h4 class="card-header">광고율/수익</h4>
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
								</c:if>
							</div>
						</div>
						<c:if test="${mem_stat==0 }">
							<div class="row  mt-3">
								<div class="col">
									<div class="card">
										<h4 class="card-header">수익</h4>
										<div class="card-body text-center">
											<div class="chart">
												<canvas id="monthProfitChart" width="100" height="200"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>