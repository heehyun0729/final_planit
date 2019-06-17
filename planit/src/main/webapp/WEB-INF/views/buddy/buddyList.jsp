<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="find_buddy">
	<form method="post" action="<c:url value='/buddyList'/>" onsubmit="return check()">
		<div id="choice_date">
			여행 시작 날짜 : <input type="text" id="buddy_indate" name="kw_indate"> 
			여행 종료 날짜 : <input type="text" id="buddy_outdate" name="kw_outdate">
		</div>
		
		<div id="choice_city">
			<table id="cityTable" style="width: 80%">
				<tr>
					<th>국가</th>
					<th>도시</th>
				</tr>
				<c:forEach var="country" items="${countryList}">
					<tr>
						<td>${country }</td>
						<c:forEach var="city" items="${cityList}">
							<c:if test="${city.key==country }">
								<c:forEach var="cityVal" items="${city.value}">
									<td><input type="checkbox" id="${cityVal }" value="${cityVal }" name="kw_city">${cityVal }</td>
								</c:forEach>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div>
			성별 :
			<input type="radio" name="kw_gender" value="X" checked="checked"> 상관없음
			<input type="radio" name="kw_gender" value="M"> 남 
			<input type="radio" name="kw_gender" value="W"> 여
			
		</div>
		
		<div>
			나이대 : <select name="kw_birthYear">
				<option value="0">상관없음</option>
				<option value="20">20대</option>
				<option value="30">30대</option>
				<option value="40">40대</option>
				<option value="50">50대</option>
				<option value="60">60대 이상</option>
			</select>
		</div>
		
		<input type="submit" value="검색">
		<input id="list_all" type="button" value="전체 글 보기">
		<input id="sg_buddy" type="button" value="동행추천받기">
	</form>
</div>
<div id="buddy_list">
	<div id="buddy_table">
		<table id="buddyTable" style="width: 80%">
			<tr>
				<th>여행자</th>
				<th>여행날짜</th>
				<th>희망성별</th>
				<th>희망나이</th>
				<th>여행 소개</th>
				<th>여행할 도시</th>
				<th>쪽지하기</th>
				<th>동행요청하기</th>
			</tr>
			<c:forEach var="buddy" items="${buddyList}">	
				<tr>
					<td>${buddy.mem_id}</td>
					<td>${buddy.buddy_indate} ~ ${buddy.buddy_outdate}</td>
					<c:choose>
						<c:when test="${buddy.buddy_gender =='X'}">
							<td>상관없음</td>
						</c:when>
						<c:when test="${buddy.buddy_gender =='M'}">
							<td>남자</td>
						</c:when>
						<c:when test="${buddy.buddy_gender =='W'}">
							<td>여자</td>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${buddy.buddy_birthyear==0}">
							<td>상관없음</td>
						</c:when>
						<c:otherwise>
							<td>${buddy.buddy_birthyear}대</td>
						</c:otherwise>
					</c:choose>
					<td>${buddy.buddy_msg}</td>
					<td>${buddy.buddy_city}</td>
					<td><input type="button" value="쪽지하기" onclick="msgPopup('${buddy.mem_id}')"></td>
					<c:choose>
						<c:when test="${empty overlap_ck}">
							<td><input type="button" value="동행요청하기1" onclick="apply_buddy('${buddy.buddy_num}')"></td>
						</c:when>
						<c:otherwise>
							<c:set var="find" value="false" />
							<c:forEach var="overlapck" items="${overlap_ck}">
								<c:choose>
									<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='0' }">
										<td><input type="button" value="요청중" disabled="disabled"></td>
										<c:set var="find" value="true" />
									</c:when>
									<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='1' }">
										<td><input type="button" value="수락" disabled="disabled"></td>
										<c:set var="find" value="true" />
									</c:when>
									<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='2' }">
										<td><input type="button" value="동행요청하기-거절" onclick="apply_buddy('${buddy.buddy_num}')"></td>
										<c:set var="find" value="true" />
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${not find}">
								<td><input type="button" value="동행요청하기-없음" onclick="apply_buddy('${buddy.buddy_num}')"></td>
							</c:if>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="paging">
		<c:choose>
			<c:when test="${startPage > 1 }">
				<a href = "<c:url value='/buddyList?pageNum=${startPage - 1 }${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>"><span style = "color:skyblue;">◀</span></a>
			</c:when>
			<c:otherwise>
				<span style = "color:grey;">◀</span>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum==i }"><%--현재 페이지 --%>
					<a href="<c:url value='/buddyList?pageNum=${i}${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>">
					<span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/buddyList?pageNum=${i}${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>">
					<span style='color:gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${endPage < pageCnt }">
				<a href = "<c:url value='/buddyList?pageNum=${startPage + 1 }${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>"><span style = "color:skyblue;">▶</span></a>
			</c:when>
			<c:otherwise>
				<span style = "color:grey;">▶</span>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div id="button_div">
		<input id="insert_buddy" type="button" value="동행찾는 글 등록하기">
	</div>
	<a href="<c:url value='/buddyMg' />">동행관리</a>
</div>
<script type="text/javascript">
	$(function() {
		$.datepicker.regional['calendar'] = {
				closeText: '닫기',
		        prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		        '7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        dateFormat: 'yy-mm-dd',
		        minDate: 0,
		        showMonthAfterYear: true,
		        yearSuffix: '년',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: 'c-99:c+99',
		        showButtonPanel: true
		}
		$.datepicker.setDefaults($.datepicker.regional['calendar']);
		
		$("#buddy_indate").datepicker();
		
	    $('#buddy_indate').datepicker("option", "onSelect", function ( selectedDate ) {
	    	$("#buddy_outdate").datepicker();
	    	$("#buddy_outdate").datepicker( "option", "minDate", selectedDate );
	    });
	});
	
	//동행 글 추가
	$("#insert_buddy").click(function(){
		if('${mem_id}'!=null && '${mem_id}'!=""){
			window.location.href="<c:url value='/buddyInsert' />";
		}else{
			alert("로그인이 필요한 서비스 입니다.");
		}
	});
	
	//리스트 전체보기
	$("#list_all").click(function(){
		window.location.href="<c:url value='/buddyList' />";
	});
	
	//자동추천
	$("#sg_buddy").click(function(){
		if('${mem_id}'!=null && '${mem_id}'!=""){
			if('${sgId}' != ''){
				var result = confirm('같은 일정에 같은 도시를 여행하는 사람이 있습니다. 추천받으시겠습니까?');
				if(result) { 
					var param=eval('${sgId}');
					var str="";
					for(var i=0;i<param.length;i++){
						str=str+"buddy_num="+param[i]+"&";
					}
					popupOpen(str);
				}else{
					
				}
			}else{
				alert('같은 일정에 같은 도시를 여행하는 사람이 없습니다.ㅠㅠ');
			}
		}else{
			alert("로그인이 필요한 서비스 입니다.");
		}
	});
	
	//동행추천 팝업
	function popupOpen(str){
		var popUrl = "<c:url value='/buddySg?"+str+"'/>";
		var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"동행추천",popOption);
	}
	//쪽지보내기 팝업
	function msgPopup(id){
		if('${mem_id}'!=null && '${mem_id}'!=""){
			var popUrl = "<c:url value='/msgSendPopupForm?id="+id+"'/>";
			var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
				window.open(popUrl,"쪽지보내기",popOption);
		}else{
			alert("로그인이 필요한 서비스 입니다.");
		}
	}
	//유효성체크
	function check(){
		if($('input:checkbox[name="kw_city"]').is(":checked")){
			return true;
		}else{
			alert("여행하려는 도시를 선택해주세요.");
			return false;
		}
	}
	//동행요청
	function apply_buddy(buddy_num){
		var result = confirm('동행을 요청하시겠습니까?');
		if(result) {
			alert("신청되었습니다.");
			window.location.href="<c:url value='/buddyApplyBuddy?buddy_num="+buddy_num+"' />";
		}else{
			
		}
	}
</script>