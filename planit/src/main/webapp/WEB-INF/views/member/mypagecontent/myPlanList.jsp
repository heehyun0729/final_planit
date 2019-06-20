<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="latest_blog_area mb-30" style = "margin-top:60px;">
    <div class="container">
        <div class="section_title">
        	<div class = "row d-flex">
        		<div class = "p-2">
        			<h2>내 플래너</h2>
        		</div>
        		<div class = "row ml-auto p-2">
        			<form method="post" action="<c:url value = '/member/mypage/${id }/myPlanList'/>">
						<input type = "hidden" value = "${pageNum }" name = "pageNum">
						<div class = "form-inline">
							<select name = "field" class = "nice-select" style = "height: 39px;">
								<option value = "country"
									<c:if test = "${field == 'country' }">selected = "selected"</c:if>
								>국가</option>
								<option value = "city"
									<c:if test = "${field == 'city' }">selected = "selected"</c:if>
								>도시</option>
								<option value = "plan_title"
									<c:if test = "${field == 'plan_title' }">selected = "selected"</c:if>
								>제목</option>
							</select>
							<input type = "text" style = "margin:0 10px;" name = "keyword" value = "${keyword }" class = "form-control single-input">
							<input type = "submit" value = "검색" class = "genric-btn success-border circle">
						</div>
					</form>
        		</div>
        	</div>
        </div>
        <c:if test="${empty list }">
        	<div class = "row mb-30 text-center">
				<div class="col-lg-12 mb-30">
					<h5>조회된 결과가 없습니다.</h5>
				</div>
			</div>
		</c:if>
		<c:set var = "n" value = "0"/>
		<div class = "row mb-30 text-center">
		<c:forEach var = "vo" items="${list }">
			<c:if test="${n % 3 == 0 }">
				</div>
				<div class = "row mb-30 text-center">
			</c:if>
			<div class="col-lg-4 col-md-6 mb-30">
				<div class="single-recent-blog-post" style = "border: 1px solid #ddd; border-radius: 0 0 10px 10px;padding-bottom: 15px;">
					<div class="thumb" >
						<a href = "<c:url value = '/plan/detail?pageNum=${pageNum }&field=${field }&keyword=${keyword }&plan_num=${vo.plan_num }'/>"><img src = "${vo.plan_img }" style = "height: 300px;"></a>
					</div>
					<div class = "details align-items-center">
						<a href = "<c:url value = '/plan/detail?pageNum=${pageNum }&field=${field }&keyword=${keyword }&plan_num=${vo.plan_num }'/>"><h4 class="sec_h4">${vo.plan_title }</h4></a>
					</div>
				</div>
			</div>
			<c:set var = "n" value = "${n + 1 }"/>
		</c:forEach>
		</div>
	 <nav class="blog-pagination justify-content-center d-flex">
           <ul class="pagination">
               <li class="page-item">
               	<c:if test="${startPage > 1 }">
					<a class="page-link" aria-label="이전" href = "<c:url value = '/member/mypage/${id }/myPlanList?pageNum=${startPage - 1 }&field=${field }&keyword=${keyword }'/>">
						<span aria-hidden="true">
                           <span class="lnr lnr-chevron-left"></span>
                       </span>
					</a>
				</c:if>
               </li>
               <c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
					<c:choose>
						<c:when test="${i == pageNum }">
							<li class="page-item active"><a class="page-link" href = "<c:url value = '/member/mypage/${id }/myPlanList?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href = "<c:url value = '/member/mypage/${id }/myPlanList?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
               <li class="page-item">
               		<c:if test="${endPage < pageCnt }">
						<a class="page-link" aria-label="다음" href = "<c:url value = '/member/mypage/${id }/myPlanList?pageNum=${endPage + 1 }&field=${field }&keyword=${keyword }'/>">
							<span aria-hidden="true">
	                           <span class="lnr lnr-chevron-right"></span>
	                       </span>
						</a>
					</c:if>
               </li>
           </ul>
       </nav>
</section>