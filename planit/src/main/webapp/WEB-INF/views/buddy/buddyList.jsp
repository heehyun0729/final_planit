<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--================style Area =================-->
<style>
	.active { color: #fff !important; background-color: #337ab7 !important; border-color: #2e6da4 !important;}
	.mg_p { margin:20px 0px; }
	.page-liner{padding-bottom: 9px;margin: 20px 0 20px;border-bottom: 1px solid #eee;}
	
	.ui-datepicker{ font-size: 15px; width: 20%; }
	.ui-datepicker select.ui-datepicker-month{ width:20%; font-size: 15px; }
	.ui-datepicker select.ui-datepicker-year{ width:20%; font-size: 15px; }
</style>

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area blog_banner_two">
    <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">동행 찾기</h2>
            <p>나와 함께 여행할 동행을 찾아보세요!</p>
        </div>
    </div>
</section>

<!--================body Area =================-->
<div class="container">
	<div class="page-liner"></div>
	
	<div id="Search_buddy">
		<form method="post" action="<c:url value='/buddyList'/>" onsubmit="return check()">
			<div class="row">
				<div class="col-md-6">
					<h3 class="typo-list">여행 시작</h3>
		            <input type="text" class="form-control" placeholder="Search" id="buddy_indate" name="kw_indate">
	            </div>
	 			<div class="col-md-6">
	 				<h3 class="typo-list">여행 끝</h3>
		            <input type="text" class="form-control" placeholder="Search" id="buddy_outdate" name="kw_outdate">
	 			</div>
	        </div>
			
			<div class="page-liner"></div>
			
			<div class="btn-group-toggle" data-toggle="buttons">
				<c:forEach var="country" items="${countryList}">
					<p class="mg_p">${country }</p>
					<c:forEach var="city" items="${cityList}">
						<c:if test="${city.key==country }">
							<c:forEach var="cityVal" items="${city.value}">
							<label class="genric-btn success circle">
								<input type="checkbox" id="${cityVal }" value="${cityVal }" name="kw_city">${cityVal }
							</label>
							</c:forEach>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
			
			<div class="page-liner"></div>
			
			<div>
				<label>성별</label>
			</div>
			<div class="form-group">
				<select name="kw_gender" class="nice-select wide">
					<option value="X">상관없음</option>
					<option value="M">남자</option>
					<option value="W">여자</option>
				</select>
			</div>
			
			<br>
			<div class="page-liner"></div>
			
			<div>
				<label>연령대</label>
			</div>
			<div class="form-group">
				<select name="kw_birthYear" class="nice-select wide">
					<option value="0">상관없음</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대</option>
					<option value="50">50대</option>
					<option value="60">60대 이상</option>
				</select>
			</div>
			
			<div class="page-liner"></div>
			
			<div class="text-center">
				<input type="submit" class="genric-btn primary circle arrow" value="검색">
			</div>
		</form>
	</div>
	
	<div class="page-liner"></div>
	
	<div class="btn_group">
		<input id="list_all" class="genric-btn primary circle" type="button" value="전체 글 목록">
		<input id="sg_buddy" class="genric-btn primary circle" type="button" value="동행추천받기">
	</div>
	<br>
	<div id="buddy_list">
		<table class="table table-hover" id="buddyTable">
			<thead>
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
			</thead>
			<tbody>
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
						<td><input type="button" class="btn btn-success msgBtn" value="쪽지하기" onclick="msgPopup('${buddy.mem_id}')"></td>
						<c:choose>
							<c:when test="${empty overlap_ck}">
								<td><input type="button" class="btn btn-success msgBtn" value="동행요청하기" onclick="apply_buddy('${buddy.buddy_num}')"></td>
							</c:when>
							<c:otherwise>
								<c:set var="find" value="false" />
								<c:forEach var="overlapck" items="${overlap_ck}">
									<c:choose>
										<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='0' }">
											<td><input type="button" class="btn btn-success msgBtn" value="요청중" disabled="disabled"></td>
											<c:set var="find" value="true" />
										</c:when>
										<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='1' }">
											<td><input type="button" class="btn btn-success msgBtn" value="수락" disabled="disabled"></td>
											<c:set var="find" value="true" />
										</c:when>
										<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='2' }">
											<td><input type="button" class="btn btn-success msgBtn" value="동행요청하기" onclick="apply_buddy('${buddy.buddy_num}')"></td>
											<c:set var="find" value="true" />
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${not find}">
									<td><input type="button" class="btn btn-success msgBtn" value="동행요청하기" onclick="apply_buddy('${buddy.buddy_num}')"></td>
								</c:if>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">
			<li class="page-item">
				<c:choose>
					<c:when test="${startPage > 1 }">
		                <a href="<c:url value='/buddyList?pageNum=${startPage - 1 }${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Previous">
		                    <span aria-hidden="true">
		                        <span class="lnr lnr-chevron-left"></span>
		                    </span>
		                </a>
	                </c:when>
	                <c:otherwise>
		                <a href="<c:url value='/buddyList?pageNum=1${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Previous">
		                    <span aria-hidden="true">
		                        <span class="lnr lnr-chevron-left"></span>
		                    </span>
		                </a>
	                </c:otherwise>
                </c:choose>
            </li>
			
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum==i }"><%--현재 페이지 --%>
						<li class="page-item active"><a href="<c:url value='/buddyList?pageNum=${i}${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>">
						${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a href="<c:url value='/buddyList?pageNum=${i}${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>">
						${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<li class="page-item">
				<c:choose>
					<c:when test="${endPage < pageCnt}">
		                <a href="<c:url value='/buddyList?pageNum=${startPage + 1 }${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Next">
		                    <span aria-hidden="true">
		                        <span class="lnr lnr-chevron-right"></span>
		                    </span>
		                </a>
	                </c:when>
	                <c:otherwise>
		                <a href="<c:url value='/buddyList?pageNum=${startPage}${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Next">
		                    <span aria-hidden="true">
		                        <span class="lnr lnr-chevron-right"></span>
		                    </span>
		                </a>
	                </c:otherwise>
                </c:choose>
            </li>
		</ul>
	</nav>
	
	<div id="button_div">
		<a href="#" onclick="insert_buddy()" class="genric-btn success circle arrow">등록하기<span class="lnr lnr-arrow-right"></span></a>
	</div>

	<a href="<c:url value='/buddyMg' />">동행관리</a>
</div>

<input type="hidden" id="localurl" value="<c:url value='/'/>">

<!--================ script =================-->
<script type="text/javascript">
	
	var localurl=$('#localurl').val();
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
	function insert_buddy(){
		if('${mem_id}'!=null && '${mem_id}'!=""){
			window.location.href=localurl+'buddyInsert';
		}else{
			alert("로그인이 필요한 서비스 입니다.");
		}
	}
	
	//리스트 전체보기
	$("#list_all").click(function(){
		window.location.href=localurl+"buddyList";
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
		var popUrl = localurl+"buddySg?"+str;
		var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"동행추천",popOption);
	}
	//쪽지보내기 팝업
	function msgPopup(id){
		if('${mem_id}'!=null && '${mem_id}'!=""){
			var popUrl = localurl+"msgSendPopupForm?id="+id;
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
			window.location.href=localurl+"buddyApplyBuddy?buddy_num="+buddy_num;
		}else{
			
		}
	}
</script>