<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function(){
		var bgcolors = ['#113f67', '#34699a', '#408ab4', '#65c6c4', '#35477d', '#6c5b7b', '#c06c84', '#f67280'];
		$("#showMsgPopup").click(function(e) {
			e.preventDefault();
		});
		$.ajax({ 
			  url: "<c:url value='/seller/reservation/getList'/>",
			  dataType: "json",
			  success: function(data) {
				var events = [];
				for(var i = 0 ; i < data.length ; i++){
					var date = new Date(data[i].checkout);
					var checkout = new Date(date.getFullYear(), date.getMonth(), date.getDate() + eval(1));
					var formattedDate = formatDate(checkout).substr(0, 10);
					var desc = "<b>투숙객명: </b>: " + data[i].name + "<br>" +
							"<b>이메일</b>: " + data[i].email + "<br>" +
							"<b>연락처</b>: " + data[i].phone + "<br>" + 
							"<b>예약자</b>: " + data[i].id + "<br>";
					events.push({
						title: data[i].name + "(" + data[i].cnt + "명) / " + data[i].accom_name + "(" + data[i].room_type + " - " + data[i].room_capa + "인실)",
						start: data[i].checkin,
						end: formattedDate,
						color: bgcolors[i % 8],
						eventTextColor: 'white',
						accom_name: data[i].accom_name + "(" + data[i].room_type + " - " + data[i].room_capa + "인실)",
						description: desc
					});
				}
				$("#rsvnCalendar").fullCalendar({
					header: {
						left: 'prev',
						center: 'title',
						right: 'next' 
					},
					buttonIcons: true, 
					editable: false,
					locale:'ko',
					events:	{
						events,
						textColor: 'white'
					},
					height: 560,
					contentHeight:540,
					// tooltip
					eventRender: function(event, element) {
						 element.qtip({
						      content: {
						    	  title: event.accom_name,
						    	  text: event.description
						      },
						      position: {
						          my: 'bottom center',
						          at: 'top center',
						          target: element
						      },
						      style: {
						          classes: 'qtip-light qtip-shadow'
						      }
						 });
					}
				});
			}
		  });
	});
	function ppp(){
		var mem_id = $("#showMsgPopup").html();
		var popUrl = "<c:url value='/msgSendForm?id=" + mem_id + "'/>";
		var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"쪽지보내기",popOption);
	}
	function formatDate(date) {
		var y = date.getFullYear();
		var m = date.getMonth() + 1;
		m = m >= 10 ? m : "0" + m;
		var d = date.getDate();
		d = d >= 10 ? d : "0" + d;
		var week = ["일", "월", "화", "수", "목", "금", "토"];
		var day = week[date.getDay()];
		return y + "-" + m + "-" + d + "(" + day + ")";
	}
</script>


<div>
	<section>
		<article>
			<div class="container">
				<div class="row ">
					<div class="col mt-5 text-center">
						<div id="rsvnCalendar"></div><br><br>
						<form method="post" action="<c:url value = '/seller/reservation/list'/>" id="sellRsvnForm">
							<div class="row">
								<select name="order" onchange="javascript:sellRsvnSubmit()" class="col-sm-2 custom-select">
									<option value="num_desc"
										<c:if test = "${order == 'num_desc' }">selected = "selected"</c:if>
										>예약번호 내림차순</option>
									<option value="num_asc"
										<c:if test = "${order == 'num_asc' }">selected = "selected"</c:if>
										>예약번호 오름차순</option>
									<option value="checkin_asc"
										<c:if test = "${order == 'checkin_asc' }">selected = "selected"</c:if>
										>체크인 빠른 순</option>
									<option value="checkin_desc"
										<c:if test = "${order == 'checkin_desc' }">selected = "selected"</c:if>
										>체크인 늦은 순</option>
									<option value="checkout_asc"
										<c:if test = "${order == 'checkout_asc' }">selected = "selected"</c:if>
										>체크아웃 빠른 순</option>
									<option value="checkout_desc"
										<c:if test = "${order == 'checkout_desc' }">selected = "selected"</c:if>
										>체크아웃 늦은 순</option>
									<option value="accom_asc"
										<c:if test = "${order == 'accom_asc' }">selected = "selected"</c:if>
										>숙소명 오름차순</option>
									<option value="accom_desc"
										<c:if test = "${order == 'accom_desc' }">selected = "selected"</c:if>
										>숙소명 내림차순</option>
								</select> 
								<div class = "col-sm-8 text-left">
									<input type="checkbox" value="complete" name="complete" onchange="javascript:sellRsvnSubmit()" class="form-check form-check-inline"
										<c:if test = "${complete == 'complete' }">checked = "checked"</c:if>
									><span>완료된 예약만 보기</span>
								</div>
								<div class = "col-sm-2 float-right">
									<a href="<c:url value = '/accommList'/>" target="_blank" class = "btn btn-primary">숙소 목록</a>
								</div>
							</div>
							<table class="table table-hover" style = "margin-top:10px;">
								<thead>
									<tr>
										<th scope="col">예약번호<br>(결제일)
										</th>
										<th scope="col">숙소명<br>(객실)
										</th>
										<th scope="col">체크인<br>~ 체크아웃
										</th>
										<th scope="col">인원수</th>
										<th scope="col">예약자</th>
										<th scope="col">투숙객명</th>
										<th scope="col">이메일</th>
										<th scope="col">연락처</th>
										<th scope="col">결제금액</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<tr>
											<td scope="row" colspan="10">조회된 결과가 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="vo" items="${list }">
										<tr>
											<td>${vo.rsvn_num }<br> (${vo.rsvnPay_date })
											</td>
											<td><a href="<c:url value = '/roomList?accom_num=${vo.accom_num }'/>" target="_blank">${vo.accom_name }</a><br>
												(${vo.room_type } - ${vo.room_capa }인실)</td>
											<td>${vo.rsvn_checkin }<br> ~ ${vo.rsvn_checkout }
											</td>
											<td>${vo.rsvn_cnt }명</td>
											<td><a href="#" onclick="javascript:ppp()"
												id="showMsgPopup">${vo.mem_id }</a></td>
											<td>${vo.rsvn_name }</td>
											<td>${vo.rsvn_email }</td>
											<td>${vo.rsvn_phone }</td>
											<td>${vo.rsvnPay_total }원</td>
											<td><c:choose>
													<c:when test="${vo.rsvnPay_stat == 0}">
												예약 완료
											</c:when>
													<c:otherwise>
												예약 취소
											</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class = "row d-flex justify-content-center" style = "margin-bottom: 10px;">
								<span><i class="far fa-calendar-alt fa-2x"></i>&nbsp;</span><input type="text" class="form-control col-sm-2" id="sellCheckin" name="checkin" value="${checkin }">
								<span>&nbsp;~&nbsp;</span><input type="text" class="form-control col-sm-2" id="sellCheckout" name="checkout" value="${checkout }"><br>
								<input type="hidden" value="${pageNum }" name="pageNum">
							</div>
							<div class="form-inline d-flex justify-content-center">
								<input type="hidden" value="${pageNum }" name="pageNum">
								<select name="field" class="custom-select" style = "margin-right: 5px;">
									<option value = "rsvn_num"
										<c:if test = "${field == 'rsvn_num' }">selected = "selected"</c:if>
									>예약번호</option>
									<option value = "accom_name"
										<c:if test = "${field == 'accom_name' }">selected = "selected"</c:if>
									>숙소명</option>
									<option value = "room_type"
										<c:if test = "${field == 'room_type' }">selected = "selected"</c:if>
									>객실명</option>
									<option value = "mem_id"
										<c:if test = "${field == 'mem_id' }">selected = "selected"</c:if>
									>예약자</option>
									<option value = "rsvn_name"
										<c:if test = "${field == 'rsvn_name' }">selected = "selected"</c:if>
									>투숙객명</option>
									<option value = "rsvn_email"
										<c:if test = "${field == 'rsvn_email' }">selected = "selected"</c:if>
									>이메일</option>
									<option value = "rsvn_phone"
										<c:if test = "${field == 'rsvn_phone' }">selected = "selected"</c:if>
									>연락처</option>
								</select>
								<input class="form-control mr-sm-2" value="${keyword }" name="keyword" type="search">
								<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
							</div>
						</form>
						<div class="d-flex justify-content-center">
							<ul class="pagination">
								<c:if test="${startPage > 1 }">
									<li class="page-item"><a class="page-link" href="<c:url value = '/seller/reservation/list?pageNum=${startPage - 1 }&checkin=${checkin }&checkout=${checkout }&field=${field }&keyword=${keyword }&order=${order }&complete=${complete }'/>">◀</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:choose>
										<c:when test="${i == pageNum }">
											<li class="page-item active"><a class="page-link" href="<c:url value = '/seller/reservation/list?pageNum=${i }&checkin=${checkin }&checkout=${checkout }&field=${field }&keyword=${keyword }&order=${order }&complete=${complete }'/>">${i }</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="<c:url value = '/seller/reservation/list?pageNum=${i }&checkin=${checkin }&checkout=${checkout }&field=${field }&keyword=${keyword }&order=${order }&complete=${complete }'/>">${i }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${endPage < pageCnt }">
									<li class="page-item"><a class="page-link" href="<c:url value = '/seller/reservation/list?pageNum=${endPage + 1 }&checkin=${checkin }&checkout=${checkout }&field=${field }&keyword=${keyword }&order=${order }&complete=${complete }'/>">▶</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
</div>