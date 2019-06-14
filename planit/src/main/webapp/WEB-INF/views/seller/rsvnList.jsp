<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</script>
<div>
	<h1>예약 목록</h1>
	<div id="rsvnCalendar"></div>
	<h2>전체 예약 목록</h2>
	<a href = "<c:url value = '/accommList'/>" target = "_blank">숙소 목록</a><br>
	<form method="post" action="<c:url value = '/seller/reservation/list'/>" id = "sellRsvnForm">
		<select name = "order" onchange="javascript:sellRsvnSubmit()">
			<option value = "num_desc"
				<c:if test = "${order == 'num_desc' }">selected = "selected"</c:if>
			>예약번호 내림차순</option>
			<option value = "num_asc"
				<c:if test = "${order == 'num_asc' }">selected = "selected"</c:if>
			>예약번호 오름차순</option>
			<option value = "checkin_asc"
				<c:if test = "${order == 'checkin_asc' }">selected = "selected"</c:if>
			>체크인 빠른 순</option>
			<option value = "checkin_desc"
				<c:if test = "${order == 'checkin_desc' }">selected = "selected"</c:if>
			>체크인 늦은 순</option>
			<option value = "checkout_asc"
				<c:if test = "${order == 'checkout_asc' }">selected = "selected"</c:if>
			>체크아웃 빠른 순</option>
			<option value = "checkout_desc"
				<c:if test = "${order == 'checkout_desc' }">selected = "selected"</c:if>
			>체크아웃 늦은 순</option>
			<option value = "accom_asc"
				<c:if test = "${order == 'accom_asc' }">selected = "selected"</c:if>
			>숙소명 오름차순</option>
			<option value = "accom_desc"
				<c:if test = "${order == 'accom_desc' }">selected = "selected"</c:if>
			>숙소명 내림차순</option>
		</select>
		<input type = "checkbox" value = "complete" name = "complete" onchange="javascript:sellRsvnSubmit()"
			<c:if test = "${complete == 'complete' }">checked = "checked"</c:if>
		> <span>완료된 예약만 보기</span>
		<table border = "1">
			<tr>
				<th>예약번호<br>(결제일)</th><th>숙소명<br>(객실)</th><th>체크인<br>~ 체크아웃</th><th>인원수</th>
				<th>예약자</th><th>투숙객명</th><th>이메일</th><th>연락처</th><th>결제금액</th><th>상태</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan = "10">조회된 정보가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var = "vo" items = "${list }">
				<tr>
					<td>
						${vo.rsvn_num }<br>
						(${vo.rsvnPay_date })
					</td>
					<td>
						<a href = "<c:url value = '/roomList?accom_num=${vo.accom_num }'/>" target = "_blank">${vo.accom_name }</a><br>
						(${vo.room_type } - ${vo.room_capa }인실)
					</td>
					<td>
						${vo.rsvn_checkin }<br>
						~ ${vo.rsvn_checkout }
					</td>
					<td>${vo.rsvn_cnt }명</td>
					<td><a href = "#" onclick="ppp()" id = "showMsgPopup">${vo.mem_id }</a></td>
					<td>${vo.rsvn_name }</td>
					<td>${vo.rsvn_email }</td>
					<td>${vo.rsvn_phone }</td>
					<td>${vo.rsvnPay_total }원</td>
					<td>
						<c:choose>
							<c:when test="${vo.rsvnPay_stat == 0}">
								예약 완료
							</c:when>
							<c:otherwise>
								예약 취소
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			투숙 기간: <input type="text" id="sellCheckin" name = "checkin" value = "${checkin }"> ~ <input type="text" id="sellCheckout" name = "checkout" value = "${checkout }"><br>
			<input type = "hidden" value = "${pageNum }" name = "pageNum">
			<select name = "field">
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
			<input type = "text" name = "keyword" value = "${keyword }">
			<input type = "submit" value = "검색">
		</div>
	</form>
	
	<div>
		<c:if test="${startPage > 1 }">
			<a href = "<c:url value = '/seller/reservation/list?pageNum=${startPage - 1 }&checkin=${checkin }&checkout=${checkout }&field=${field }&keyword=${keyword }&order=${order }&complete=${complete }'/>"><span style = "color:skyblue;">[이전]</span></a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
			<c:choose>
				<c:when test="${i == pageNum }">
					<a href = "<c:url value = '/seller/reservation/list?pageNum=${i }&checkin=${checkin }&checkout=${checkout }&field=${field }&keyword=${keyword }&order=${order }&complete=${complete }'/>"><span style = "color:skyblue;">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href = "<c:url value = '/seller/reservation/list?pageNum=${i }&checkin=${checkin }&checkout=${checkout }&field=${field }&keyword=${keyword }&order=${order }&complete=${complete }'/>"><span style = "color:gray;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href = "<c:url value = '/seller/reservation/list?pageNum=${endPage + 1 }&checkin=${checkin }&checkout=${checkout }&field=${field }&keyword=${keyword }&order=${order }&complete=${complete }'/>"><span style = "color:skyblue;">[다음]</span></a>
		</c:if>
	</div>
</div>