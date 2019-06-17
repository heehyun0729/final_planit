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

<!--================ script =================-->
<script type="text/javascript" src="<c:url value='/resources/js/buddy/list.js'/>"></script>